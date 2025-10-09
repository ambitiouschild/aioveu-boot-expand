
#  Docker Compose 安装中间件 MySQL、Redis、Minio、Xxl-Job

## 安装  cd  /opt/aioveu-boot/docker


```bash
# docker-compose -f ./docker-compose.yml -p aioveu-boot up -d
# 1. 仅创建新容器（不重建已有容器） --no-recreate参数：只启动新服务，不重建已有容器
#  如果你只想新增容器（新增的服务），并且不想修改已有的容器（即使配置有更改） --no-recreate
#  如果你希望新增容器，并且对于修改过的容器也更新（重新创建），那么就不加--no-recreate。
#  注意：--no-recreate参数不会重新创建任何容器，包括配置发生改变的容器也不会被更新。它只会启动那些没有在运行的服务（包括新增的服务）。
# docker-compose up -d --no-recreate --no-start  # 创建但不启动（包括新增的服务）
# docker-compose start [service...]  # 然后手动启动你想要启动的服务
#如果你修改了已有服务的配置，那么这些服务会被重新创建（更新）。如果你不想更新它们，那么就不要修改已有服务的配置。
#如果你在修改已有服务配置的同时，又不想重新创建它们，那么可以使用--no-recreate，但是这样修改的配置就不会生效。
 docker compose -f ./docker-compose.yml -p aioveu-boot up -d  --no-recreate
```
防止意外重建的策略
1. 使用标签控制重建
   services:
   existing-service:
   labels:
   com.docker.compose.recreate: "never"
```bash
# 2. 分离服务定义 # 基础服务 (不常变动)
 docker compose -f ./docker-compose.yml -p aioveu-boot up -d  --no-recreate
 
```

```bash
# 2. 分离服务定义 新增服务 (频繁变动)
 docker compose -f ./docker-compose-add.yml -p aioveu-boot up -d 
 
```
```bash
# 3. 部分更新特定容器  重建单个容器
 docker compose up -d --no-deps --build <服务名>
 
```


```bash
docker pull openjdk:17-jdk-slim
```

# - p aioveu-boot 指定命名空间，避免与其他容器冲突，这里方便管理，统一管理和卸载

## 卸载


```bash 
docker-compose -f ./docker-compose.yml -p aioveu-boot down
```

```bash
# 9.切换回本地上下文
docker context use default
```

```bash
# 10.切换回本地上下文执行验证
docker context show  # 应显示 "default"
```

```bash
# 11.显示本地容器而非远程
docker ps -a 
```