package ${package.ServiceImpl};

import ${package.Entity}.${entity};
import ${package.Mapper}.${table.mapperName};
import ${package.DTO}.${table.classBodyName}DTO;
import ${package.Query}.${table.classBodyName}Query;
import ${package.Service}.${table.serviceName};

import ${table.modulePackage}.business.${package.ModuleName}.convert.${table.classBodyName}Convert;
import ${table.modulePackage}.business.${package.ModuleName}.pojo.request.${table.classBodyName}ModifyRequest;
import ${table.modulePackage}.business.${package.ModuleName}.pojo.request.${table.classBodyName}QueryRequest;
import ${table.modulePackage}.business.${package.ModuleName}.pojo.request.query.${table.classBodyName}PageQueryRequest;
import ${table.modulePackage}.business.${package.ModuleName}.pojo.response.${table.classBodyName}ModifyResponse;
import ${table.modulePackage}.business.${package.ModuleName}.pojo.response.query.${table.classBodyName}PageQueryResponse;
import ${table.modulePackage}.business.${package.ModuleName}.pojo.response.query.${table.classBodyName}PageQueryResponse.${table.classBodyName}PageItem;
import ${table.modulePackage}.business.${package.ModuleName}.pojo.response.query.${table.classBodyName}QueryResponse;
import com.lxzl.standard.base.convert.BaseConvert;
import com.lxzl.standard.base.service.BaseStandardService;
import com.lxzl.skull.basic.utils.Assert;
import com.lxzl.skull.common.factory.BeanFactory;
import com.lxzl.skull.database.common.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * <p>
 * ${table.comment!} 服务实现类
 * </p>
 *
 * @author ${author}
 * @since ${cfg.date}
 */
@Service(value = "${table.serviceName?uncap_first}")
<#if kotlin>
open class ${table.serviceImplName} : ${superServiceImplClass}<${table.mapperName}, ${entity}>(), ${table.serviceName} {

}
<#else>
public class ${table.serviceImplName} extends BaseStandardService<${table.mapperName}, ${table.entityName}, ${table.classBodyName}DTO> implements ${table.serviceName} {
    @Autowired
    private ${table.mapperName} ${table.mapperName?uncap_first};


    @Override
    @Transactional(rollbackFor = Exception.class)
    public <Request extends ${table.classBodyName}ModifyRequest<Response>, Response extends ${table.classBodyName}ModifyResponse> Response save(Request request) {
        // 构建
        request.build();
        // 转化
        ${table.classBodyName}DTO ${table.classBodyName?uncap_first}DTOForSave = request.parsePojo();
        // 执行插入
        ${table.classBodyName}DTO ${table.classBodyName?uncap_first}DTOYetSave = super.save(${table.classBodyName?uncap_first}DTOForSave);
        // 获取响应对象
        return BeanFactory.newResponse(request, ${table.classBodyName?uncap_first}DTOYetSave);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public <Request extends ${table.classBodyName}ModifyRequest<Response>, Response extends ${table.classBodyName}ModifyResponse> Response update(Request request) {
        // 构建
        request.build();
        // 转化
        ${table.classBodyName}DTO ${table.classBodyName?uncap_first}DTOForUpdate = request.parsePojo();
        // 执行更新
        ${table.classBodyName}DTO ${table.classBodyName?uncap_first}DTOYetUpdate = super.updateByPrimaryKey(${table.classBodyName?uncap_first}DTOForUpdate);
        // 获取响应对象
        return BeanFactory.newResponse(request, ${table.classBodyName?uncap_first}DTOYetUpdate);
    }

    @Override
    public Page<${table.classBodyName}PageItem> page(${table.classBodyName}PageQueryRequest request) {
        // 构建
        request.build();
        // 转化
        ${table.classBodyName}Query ${table.classBodyName?uncap_first}Query = request.parsePojo();
        // 查询分页数据
        Page<${table.classBodyName}PageQueryResponse.${table.classBodyName}PageItem> page = super.pageByQuery(${table.classBodyName?uncap_first}Query, request);
        // 返回
        return page;
    }

    @Override
    public <Request extends ${table.classBodyName}QueryRequest<Response>, Response extends ${table.classBodyName}QueryResponse> Response find(Request request) {
        // 构建
        request.build();
        // 转化
        ${table.classBodyName}Query ${table.classBodyName?uncap_first}Query = request.parsePojo();
        // 查询
        ${table.classBodyName}DTO ${table.classBodyName?uncap_first}DTO = super.findByQuery(${table.classBodyName?uncap_first}Query);
        // 返回
        return BeanFactory.newResponse(request, ${table.classBodyName?uncap_first}DTO);
    }

    @Override
    public void verifyExistById(Long id) {
        super.verifyExist(id);
    }

    @Override
    public void verifyNotExistById(Long id) {
        super.verifyNotExist(id);
    }

    @Override
    protected BaseConvert<${table.entityName}, ${table.classBodyName}DTO> getConvert() {
        return ${table.classBodyName}Convert.INSTANCE;
    }
}
</#if>
