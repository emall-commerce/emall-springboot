package ${package.Domain};

import com.alibaba.fastjson.annotation.JSONField;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.lxzl.standard.base.pojo.domain.BaseStandardDomain;
import ${table.modulePackage}.business.${package.ModuleName}.convert.${table.classBodyName}Convert;
import ${table.modulePackage}.business.${package.ModuleName}.service.${table.classBodyName}Service;
import ${table.modulePackage}.business.${package.ModuleName}.logic.${table.classBodyName}Logic;
import com.lxzl.skull.common.spring.SpringUtil;

/**
 * <p>
 * ${table.comment!} 领域类
 * </p>
 *
 * @author ${author}
 * @since ${cfg.date}
 */
public interface ${table.classBodyName}Domain extends BaseStandardDomain {

    /**
     * <p>
     *  ${table.comment!}service
     * </p>
     *
     * @return ${table.classBodyName}Service
     * @author ${author}
     * @date  ${cfg.date}
     */
    default ${table.classBodyName}Service service() {
        return SpringUtil.getBean(${table.classBodyName}Service.class);
    }

    /**
     * <p>
     *  ${table.comment!}logic
     * </p>
     *
     * @return ${table.classBodyName}Logic
     * @author ${author}
     * @date ${cfg.date}
     */
    default ${table.classBodyName}Logic logic() {
        return SpringUtil.getBean(${table.classBodyName}Logic.class);
    }

    /**
     * <p>
     *  ${table.comment!}convert
     * </p>
     *
     * @return ${table.classBodyName}Convert
     * @author ${author}
     * @date ${cfg.date}
     */
    default ${table.classBodyName}Convert convert() {
        return ${table.classBodyName}Convert.INSTANCE;
    }
}
