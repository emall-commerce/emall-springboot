package ${package.Controller};


import org.springframework.web.bind.annotation.RequestMapping;

<#if restControllerStyle>
import org.springframework.web.bind.annotation.RestController;
<#else>
import org.springframework.stereotype.Controller;
</#if>
<#if superControllerClassPackage??>
import ${superControllerClassPackage};
</#if>
import ${table.modulePackage}.business.${package.ModuleName}.pojo.request.query.${table.classBodyName}CommonQueryRequest;
import ${table.modulePackage}.business.${package.ModuleName}.pojo.request.query.${table.classBodyName}PageQueryRequest;
import ${table.modulePackage}.business.${package.ModuleName}.pojo.request.save.${table.classBodyName}SaveRequest;
import ${table.modulePackage}.business.${package.ModuleName}.pojo.request.update.${table.classBodyName}UpdateByIdRequest;
import com.lxzl.skull.result.Result;
import org.springframework.web.bind.annotation.RequestBody;

import com.lxzl.standard.base.controller.BaseStandardController;
import org.springframework.beans.factory.annotation.Autowired;
import ${package.Logic}.${table.classBodyName}Logic;
import ${package.Service}.${table.classBodyName}Service;

/**
 * <p>
 * ${table.comment!} 前端控制器
 * </p>
 *
 * @author ${author}
 * @since ${cfg.date}
 */
<#if restControllerStyle>
@RestController(value = "${table.controllerName?uncap_first}")
<#else>
@Controller(value = "${table.controllerName?uncap_first}")
</#if>
@RequestMapping("${table.nameRemovePrefix}")
public class ${table.controllerName} extends BaseStandardController {
    @Autowired
    private ${table.classBodyName}Logic ${table.classBodyName?uncap_first}Logic;
    @Autowired
    private ${table.classBodyName}Service ${table.classBodyName?uncap_first}Service;

    @RequestMapping(value = "save")
    public Result save(@RequestBody ${table.classBodyName}SaveRequest request) {
        return super.generateResult(${table.classBodyName?uncap_first}Logic.save(request));
    }

    @RequestMapping(value = "update_by_id")
    public Result updateById(@RequestBody ${table.classBodyName}UpdateByIdRequest request) {
        return super.generateResult(${table.classBodyName?uncap_first}Logic.updateById(request));
    }

    @RequestMapping(value = "page")
    public Result page(@RequestBody ${table.classBodyName}PageQueryRequest request) {
        return super.generateResult(${table.classBodyName?uncap_first}Logic.page(request));
    }

    @RequestMapping(value = "find")
    public Result listByQuery(@RequestBody ${table.classBodyName}CommonQueryRequest request) {
        return super.generateResult(${table.classBodyName?uncap_first}Logic.find(request));
    }
}
