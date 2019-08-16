package ${package.ModifyRequest};

<#list table.importPackages as pkg>
import ${pkg};
</#list>
import ${package.DTO}.${table.classBodyName}DTO;
import ${table.modulePackage}.business.${package.ModuleName}.pojo.response.${table.classBodyName}ModifyResponse;
import ${table.modulePackage}.business.${package.ModuleName}.pojo.domain.${table.classBodyName}Domain;
import com.lxzl.standard.base.pojo.request.BaseStandardAlterRequest;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * ${table.comment!} 修改请求类
 * </p>
 *
 * @author ${author}
 * @since ${cfg.date}
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
public abstract class ${table.classBodyName}ModifyRequest<RESPONSE extends ${table.classBodyName}ModifyResponse> extends BaseStandardAlterRequest<${table.classBodyName}DTO, RESPONSE> implements ${table.classBodyName}Domain {

<#-- ----------  BEGIN 字段循环遍历  ---------->
<#list table.fields as field>
    /**
     * ${field.comment}
     */
    private ${field.propertyType} ${field.propertyName};
</#list>
<#------------  END 字段循环遍历  ---------->

}
