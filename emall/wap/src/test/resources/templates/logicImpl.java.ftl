package ${package.LogicImpl};

import ${package.Service}.${table.serviceName};
import ${package.Logic}.${table.classBodyName}Logic;

import ${table.modulePackage}.business.${package.ModuleName}.pojo.request.query.${table.classBodyName}CommonQueryRequest;
import ${table.modulePackage}.business.${package.ModuleName}.pojo.request.query.${table.classBodyName}PageQueryRequest;
import ${table.modulePackage}.business.${package.ModuleName}.pojo.request.save.${table.classBodyName}SaveRequest;
import ${table.modulePackage}.business.${package.ModuleName}.pojo.request.update.${table.classBodyName}UpdateByIdRequest;
import ${table.modulePackage}.business.${package.ModuleName}.pojo.response.query.${table.classBodyName}PageQueryResponse;
import ${table.modulePackage}.business.${package.ModuleName}.pojo.response.query.${table.classBodyName}QueryResponse;
import ${table.modulePackage}.business.${package.ModuleName}.pojo.response.save.${table.classBodyName}SaveResponse;
import ${table.modulePackage}.business.${package.ModuleName}.pojo.response.update.${table.classBodyName}UpdateResponse;
import com.lxzl.standard.base.logic.BaseStandardLogic;
import com.lxzl.skull.database.common.Page;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
/**
 * <p>
 * ${table.comment!} 逻辑实现类
 * </p>
 *
 * @author ${author}
 * @since ${cfg.date}
 */
@Component(value = "${table.classBodyName?uncap_first}Logic")
public class ${table.classBodyName}LogicImpl extends BaseStandardLogic implements ${table.classBodyName}Logic {
    @Autowired
    private ${table.serviceName} ${table.serviceName?uncap_first};

    @Override
    public ${table.classBodyName}SaveResponse save(${table.classBodyName}SaveRequest request) {
        return ${table.classBodyName?uncap_first}Service.save(request);
    }

    @Override
    public ${table.classBodyName}UpdateResponse updateById(${table.classBodyName}UpdateByIdRequest request) {
        return ${table.classBodyName?uncap_first}Service.update(request);
    }

    @Override
    public Page<${table.classBodyName}PageQueryResponse.${table.classBodyName}PageItem> page(${table.classBodyName}PageQueryRequest request) {
        return ${table.classBodyName?uncap_first}Service.page(request);
    }

    @Override
    public ${table.classBodyName}QueryResponse find(${table.classBodyName}CommonQueryRequest request) {
        return ${table.classBodyName?uncap_first}Service.find(request);
    }
}