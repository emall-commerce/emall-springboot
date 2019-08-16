package ${package.QueryRequest};

<#list table.importPackages as pkg>
import ${pkg};
</#list>
import ${package.Query}.${table.classBodyName}Query;
import ${table.modulePackage}.business.${package.ModuleName}.pojo.domain.${table.classBodyName}Domain;
import com.lxzl.standard.base.pojo.request.BaseStandardQueryRequest;
import com.lxzl.standard.base.pojo.response.BaseStandardResponse;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * ${table.comment!} 抽象查询请求类
 * </p>
 *
 * @author ${author}
 * @since ${cfg.date}
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
public abstract class ${table.classBodyName}QueryRequest<RESPONSE extends BaseStandardResponse> extends BaseStandardQueryRequest<${table.classBodyName}Query, RESPONSE>  implements ${table.classBodyName}Domain {
    /**
     * 数据表id
     */
    private Long ${table.classBodyName?uncap_first}Id;
<#-- ----------  BEGIN 字段循环遍历  ---------->
<#list table.fields as field>
    /**
     * ${field.comment}
     */
    private ${field.propertyType} ${field.propertyName};
</#list>
<#------------  END 字段循环遍历  ---------->

}
