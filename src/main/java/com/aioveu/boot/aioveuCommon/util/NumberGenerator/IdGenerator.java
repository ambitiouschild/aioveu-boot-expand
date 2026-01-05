package com.aioveu.boot.aioveuCommon.util.NumberGenerator;


import com.aioveu.boot.JuhaocheJwtUtils.SpringContextHolder;
import org.apache.poi.hpsf.Date;
import org.springframework.stereotype.Component;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.concurrent.atomic.AtomicLong;

/**
 * 分布式ID生成器
 * 基于雪花算法实现
 */
@Component
public class IdGenerator {

    // ==============================雪花算法参数==================================
    /**
     * 起始时间戳（2024-01-01 00:00:00）
     */
    private final long twepoch = 1704067200000L;

    /**
     * 机器ID所占的位数
     */
    private final long workerIdBits = 5L;

    /**
     * 数据标识ID所占的位数
     */
    private final long datacenterIdBits = 5L;

    /**
     * 序列在ID中占的位数
     */
    private final long sequenceBits = 12L;

    /**
     * 支持的最大机器ID
     */
    private final long maxWorkerId = -1L ^ (-1L << workerIdBits);

    /**
     * 支持的最大数据中心ID
     */
    private final long maxDatacenterId = -1L ^ (-1L << datacenterIdBits);

    /**
     * 机器ID向左移12位
     */
    private final long workerIdShift = sequenceBits;

    /**
     * 数据中心ID向左移17位(12+5)
     */
    private final long datacenterIdShift = sequenceBits + workerIdBits;

    /**
     * 时间戳向左移22位(5+5+12)
     */
    private final long timestampLeftShift = sequenceBits + workerIdBits + datacenterIdBits;

    /**
     * 生成序列的掩码，这里为4095 (0b111111111111=0xfff=4095)
     */
    private final long sequenceMask = -1L ^ (-1L << sequenceBits);

    /**
     * 工作机器ID(0~31)
     */
    private long workerId;

    /**
     * 数据中心ID(0~31)
     */
    private long datacenterId;

    /**
     * 毫秒内序列(0~4095)
     */
    private long sequence = 0L;

    /**
     * 上次生成ID的时间戳
     */
    private long lastTimestamp = -1L;

    private static final AtomicLong ATOMIC_LONG = new AtomicLong(0);

    // ==============================构造方法==================================

    /**
     * 构造函数（自动获取机器ID）
     */
    public IdGenerator() {
        this.datacenterId = getDatacenterId();
        this.workerId = getWorkerId(datacenterId);
    }

    /**
     * 构造函数
     * @param workerId 工作ID (0~31)
     * @param datacenterId 数据中心ID (0~31)
     */
    public IdGenerator(long workerId, long datacenterId) {
        if (workerId > maxWorkerId || workerId < 0) {
            throw new IllegalArgumentException(
                    String.format("worker Id can't be greater than %d or less than 0", maxWorkerId));
        }
        if (datacenterId > maxDatacenterId || datacenterId < 0) {
            throw new IllegalArgumentException(
                    String.format("datacenter Id can't be greater than %d or less than 0", maxDatacenterId));
        }
        this.workerId = workerId;
        this.datacenterId = datacenterId;
    }

    // ==============================核心方法==================================

    /**
     * 生成下一个ID（线程安全）
     */
    public synchronized long generateId() {
        long timestamp = timeGen();

        // 如果当前时间小于上一次ID生成的时间戳，说明系统时钟回退过，此时应当抛出异常
        if (timestamp < lastTimestamp) {
            throw new RuntimeException(
                    String.format("Clock moved backwards. Refusing to generate id for %d milliseconds",
                            lastTimestamp - timestamp));
        }

        // 如果是同一时间生成的，则进行毫秒内序列
        if (lastTimestamp == timestamp) {
            sequence = (sequence + 1) & sequenceMask;
            // 毫秒内序列溢出
            if (sequence == 0) {
                // 阻塞到下一个毫秒，获得新的时间戳
                timestamp = tilNextMillis(lastTimestamp);
            }
        } else {
            // 时间戳改变，毫秒内序列重置
            sequence = 0L;
        }

        // 上次生成ID的时间戳
        lastTimestamp = timestamp;

        // 移位并通过或运算拼到一起组成64位的ID
        return ((timestamp - twepoch) << timestampLeftShift)
                | (datacenterId << datacenterIdShift)
                | (workerId << workerIdShift)
                | sequence;
    }

    /**
     * 阻塞到下一个毫秒，直到获得新的时间戳
     */
    protected long tilNextMillis(long lastTimestamp) {
        long timestamp = timeGen();
        while (timestamp <= lastTimestamp) {
            timestamp = timeGen();
        }
        return timestamp;
    }

    /**
     * 返回当前时间，以毫秒为单位
     */
    protected long timeGen() {
        return System.currentTimeMillis();
    }

    /**
     * 获取机器ID（基于主机名和进程ID）
     */
    private long getWorkerId(long datacenterId) {
        StringBuilder sb = new StringBuilder();
        sb.append(datacenterId);
        String name = getHostName();
        if (name != null) {
            sb.append(name);
        }

        // 通过主机名和进程ID生成workerId
        String workerIdStr = sb.toString();
        return (workerIdStr.hashCode() & 0xffff) % (maxWorkerId + 1);
    }

    /**
     * 获取数据中心ID（基于网络接口）
     */
    private long getDatacenterId() {
        try {
            InetAddress ip = InetAddress.getLocalHost();
            byte[] address = ip.getAddress();
            long id = ((address[address.length - 2] & 0xFF) << 8)
                    + (address[address.length - 1] & 0xFF);
            return id % (maxDatacenterId + 1);
        } catch (UnknownHostException e) {
            // 如果获取失败，使用随机数
            return (long) (Math.random() * (maxDatacenterId + 1));
        }
    }

    /**
     * 获取主机名
     */
    private String getHostName() {
        try {
            return InetAddress.getLocalHost().getHostName();
        } catch (UnknownHostException e) {
            return null;
        }
    }

    /**
     * 静态方法，方便直接调用
     */
    public static long nextId() {
        return SpringContextHolder.getBean(IdGenerator.class).generateId();
    }

    // ==============================其他ID生成方案==================================

    /**
     * 生成简短的ID（基于时间戳+随机数，适合短链等场景）
     */
    public static String generateShortId() {
        long timestamp = System.currentTimeMillis();
        long random = (long) (Math.random() * 10000);
        return Long.toHexString(timestamp) + Long.toHexString(random);
    }

    /**
     * 生成UUID（去掉横线）
     */
    public static String generateUUID() {
        return java.util.UUID.randomUUID().toString().replaceAll("-", "");
    }

    /**
     * 生成递增ID（单机环境下使用，不适合分布式）
     */
    public static long generateIncrementId() {
        return ATOMIC_LONG.incrementAndGet();
    }

    /**
     * 解析雪花算法生成的ID
     */
    public SnowflakeIdInfo parseSnowflakeId(long id) {
        long timestamp = (id >> timestampLeftShift) + twepoch;
        long datacenterId = (id >> datacenterIdShift) & ~(-1L << datacenterIdBits);
        long workerId = (id >> workerIdShift) & ~(-1L << workerIdBits);
        long sequence = id & sequenceMask;

        return new SnowflakeIdInfo(timestamp, datacenterId, workerId, sequence);
    }

    /**
     * 雪花算法ID信息
     */
    public static class SnowflakeIdInfo {
        private final long timestamp;
        private final long datacenterId;
        private final long workerId;
        private final long sequence;

        public SnowflakeIdInfo(long timestamp, long datacenterId, long workerId, long sequence) {
            this.timestamp = timestamp;
            this.datacenterId = datacenterId;
            this.workerId = workerId;
            this.sequence = sequence;
        }

        // Getter方法
        public long getTimestamp() { return timestamp; }
        public long getDatacenterId() { return datacenterId; }
        public long getWorkerId() { return workerId; }
        public long getSequence() { return sequence; }
        public Date getGenerateTime() { return new Date(); }

        @Override
        public String toString() {
            return String.format("SnowflakeIdInfo{timestamp=%d, datacenterId=%d, workerId=%d, sequence=%d}",
                    timestamp, datacenterId, workerId, sequence);
        }
    }
}
