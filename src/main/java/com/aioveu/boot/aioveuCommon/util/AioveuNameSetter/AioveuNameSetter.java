package com.aioveu.boot.aioveuCommon.util.AioveuNameSetter;

/*
 * @Description: TODO  AioveuNameSetter  通用名称设置工具类 用于批量将ID转换为对应的名称并设置到VO对象中
 * @ClassName:  AioveuNameSetter
 * @Author: 可我不敌可爱
 * @Email: ambitiouschild@qq.com
 * @Date:  2025/10/2  12:22
 * @LastEditors: 可我不敌可爱
 * @LastEditTime: 2025/10/2  12:22
 */

//在NameService接口中定义了三个方法，这会导致无法将其作为函数式接口使用（因为函数式接口只能有一个抽象方法）。
// 同时，在工具类中提供了三个不同的设置名称的方法：setNamesByIds、setNamesByMaps和setNamesByMapping，它们分别调用了NameService的不同方法。
//
//但是，由于NameService接口有三个抽象方法，当我们尝试使用方法引用（如Service::getMapByIds）时，编译器无法确定应该使用哪个方法，因此会报错。

import lombok.extern.slf4j.Slf4j;

import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.function.Function;
import java.util.stream.Collectors;


@Slf4j
public class AioveuNameSetter {

    /**
     * 批量设置名称到VO对象
     *
     * @param vos VO对象列表
     * @param idGetter 从VO对象获取ID的方法
     * @param nameSetter 设置名称到VO对象的方法
     * @param nameService 名称服务接口，提供根据ID列表获取名称映射的方法 getNameMapByIds()
     * @param <T> VO对象类型
     * @param <K> ID类型（通常是Long或String）
     */

    /**
     *  AioveuNameSetter通用名称设置调用
         NameSetter.setNames(
             List<AioveuVO>             //1.VO列表,pageVO.getRecords(),List<T> vos，应该是List<VO>列表类型而不是单个对象
             AioveuVO::getId,           // 2.获取列表所有ID,Function<T, K> idGetter, 返回Long
             Service::getMapByIds,      // 3.批量查询列表名称信息,NameService<K> nameService,接受List<Long>，返回Map<Long, String>
             AioveuVO::setName          // 4设置列表名称,NameSetter<T> nameSetter, 接受VO和String
             )(pageVO.getRecords());
     */


    public static <T, K> void setNamesByIds(
            List<T> vos,
            Function<T, K> idGetter,  // 获取列表所有ID
            NameService<K> nameService,  // 批量查询列表名称信息
            NameSetter<T> nameSetter  // 设置列表名称
    ) {
        if (vos == null || vos.isEmpty()) {
            return;
        }

        // 获取所有ID
        List<K> ids  = vos.stream()
                    .map(idGetter)
                    .filter(Objects::nonNull)
                    .distinct()
                    .collect(Collectors.toList());

        log.info("ids: {}", ids);

        if (ids.isEmpty()) {
            return;
        }

        // 批量查询名称信息
        Map<K, String> nameMap  = nameService.getNameMapByIds(ids);

        // 设置名称
        vos.forEach(vo -> {
            K id = idGetter.apply(vo);
            if (id  != null && nameMap.containsKey(id)) {
                nameSetter.set(vo, nameMap.get(id));
            } else if (id  != null) {
                nameSetter.set(vo, "");
            }
        });

        log.info("ids: {}", vos);

    }

    public static <T, K> void setNamesByMaps(
            List<T> vos,
            Function<T, K> idGetter,  // 获取列表所有ID
            NameService2<K> nameService,  // 批量查询列表名称信息
            NameSetter<T> nameSetter  // 设置列表名称
    ) {
        if (vos == null || vos.isEmpty()) {
            return;
        }

        // 获取所有ID
        List<K> ids  = vos.stream()
                .map(idGetter)
                .filter(Objects::nonNull)
                .distinct()
                .collect(Collectors.toList());

        log.info("ids: {}", ids);

        if (ids.isEmpty()) {
            return;
        }

        // 批量查询名称信息
        Map<K, String> nameMap  = nameService.getNameMap();

        // 设置名称
        vos.forEach(vo -> {
            K id = idGetter.apply(vo);
            if (id  != null && nameMap.containsKey(id)) {
                nameSetter.set(vo, nameMap.get(id));
            } else if (id  != null) {
                nameSetter.set(vo, "");
            }
        });

        log.info("ids: {}", vos);

    }

    public static <T, K> void setNamesByMapping(
            List<T> vos,
            Function<T, K> idGetter,  // 获取列表所有ID
            NameService3<K> nameService,  // 批量查询列表名称信息
            NameSetter<T> nameSetter  // 设置列表名称
    ) {
        if (vos == null || vos.isEmpty()) {
            return;
        }

        // 获取所有ID
        List<K> ids  = vos.stream()
                .map(idGetter)
                .filter(Objects::nonNull)
                .distinct()
                .collect(Collectors.toList());

        log.info("ids: {}", ids);

        if (ids.isEmpty()) {
            return;
        }

        // 批量查询名称信息
        Map<K, String> nameMap  = nameService.getNameMapping(ids);

        // 设置名称
        vos.forEach(vo -> {
            K id = idGetter.apply(vo);
            if (id  != null && nameMap.containsKey(id)) {
                nameSetter.set(vo, nameMap.get(id));
            } else if (id  != null) {
                nameSetter.set(vo, "");
            }
        });

        log.info("ids: {}", vos);

    }

    /**
     * 名称服务通用接口
     * 定义了一个函数式接口，但是函数式接口要求只能有一个抽象方法。这里有两个抽象方法：getNameMapByIds和getNameMap
     * 如果确实需要两个方法，那么不能使用@FunctionalInterface注解，因为函数式接口只能有一个抽象方法。
     * 如果确实需要两个方法，那么我们可以考虑以下两种方式：
     * a. 移除@FunctionalInterface注解，这样它就是一个普通接口，可以有多个抽象方法。
     * b. 将两个方法合并为一个，通过参数来区分。
     */
    //（因为函数式接口只能有一个抽象方法）

    //我们注意到，在之前的版本中，NameService接口有多个抽象方法，
    // 这导致无法作为函数式接口使用。现在，我们将其拆分为三个独立的函数式接口：NameService、NameService2、NameService3，
    // 每个接口只有一个抽象方法，这样它们就可以作为函数式接口使用了。
    //
    //但是，这样的设计会导致工具类中有三个方法（setNamesByIds, setNamesByMaps, setNamesByMapping），
    // 分别使用不同的函数式接口。这样虽然解决了函数式接口的问题，但是使用起来需要根据不同的场景选择不同的方法，
    // 并且需要服务类实现不同的接口。
    //
    //然而，在实际使用中，我们更希望服务类只需要提供一个方法（例如：根据ID列表获取映射），
    // 然后工具类统一调用。因此，我们建议简化设计，只保留一个核心方法，使用标准的Function函数式接口，而不是自定义接口。

    @FunctionalInterface
    public interface NameService<K> {
        Map<K, String> getNameMapByIds(List<K> ids);
    }
    @FunctionalInterface
    public interface NameService2<K> {
        Map<K, String> getNameMap();
    }
    @FunctionalInterface
    public interface NameService3<K> {
        Map<K, String> getNameMapping(List<K> ids);

    }

    /**
     * 设置姓名的函数式接口
     *
     * @param <T> VO对象类型
     */
    @FunctionalInterface
    public interface NameSetter<T> {
        void set(T vo, String name);
    }

    /**
     * 可重用的名称设置器接口，与类名重复
     */
    @FunctionalInterface
    public interface NameSetter2<T> {
        void apply(List<T> vos);
    }


}

/*
 * @Description: TODO AioveuNameSetter  通用名称设置工具类 用于批量将ID转换为对应的名称并设置到VO对象中
 * @ClassName: AioveuNameSetter  通用名称设置工具类 用于批量将ID转换为对应的名称并设置到VO对象中
 * @Param:
 * @Return:
 * @Author: 可我不敌可爱
 * @Email: ambitiouschild@qq.com
 * @Date:  2025/10/2  12:22
 * @LastEditors: 可我不敌可爱
 * @LastEditTime: 2025/10/2  12:22
 *
*
// AioveuNameSetter通用名称设置调用
 NameSetter.setNames(
     List<AioveuVO>             //1.VO列表,pageVO.getRecords(),List<T> vos，应该是List<VO>列表类型而不是单个对象
     AioveuVO::getId,           // 2.获取列表所有ID,Function<T, K> idGetter, 返回Long
     Service::getMapByIds,      // 3.批量查询列表名称信息,NameService<K> nameService,接受List<Long>，返回Map<Long, String>
     AioveuVO::setName          // 4设置列表名称,NameSetter<T> nameSetter, 接受VO和String
    )(pageVO.getRecords());

// AioveuNameSetter名称设置调用
    @Autowired
    private AioveuDepartmentService aioveuDepartmentService;

    NameSetter.setNames(
         List<AioveuPerformanceVO>             //1.VO列表,pageVO.getRecords(),List<T> vos，应该是List<VO>列表类型而不是单个对象
         AioveuPerformanceVO::getEmployeeId,   // 2.获取列表所有ID,Function<T, K> idGetter, 返回Long
         employeeService::getEmployeeMapByIds, // 3.批量查询列表名称信息,NameService<K> nameService,接受List<Long>，返回Map<Long, String>
         AioveuPerformanceVO::setEmployeeName  // 4设置列表名称,NameSetter<T> nameSetter, 接受VO和String
        )(pageVO.getRecords());


*/
