package ${package.UpdateResponse};

<#list table.importPackages as pkg>
import ${pkg};
</#list>
import ${package.DTO}.${table.classBodyName}DTO;

import ${table.modulePackage}.business.${package.ModuleName}.pojo.response.${table.classBodyName}ModifyResponse;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * ${table.comment!} 更新响应类
 * </p>
 *
 * @author ${author}
 * @since ${cfg.date}
 */
@Data
@Accessors(chain = true)
public class ${table.classBodyName}UpdateResponse extends ${table.classBodyName}ModifyResponse {
    /**
     * 返回给页面的视图对象
     */
    private ${table.classBodyName}UpdateVO ${table.classBodyName?uncap_first};

    @Override
    public void build(${table.classBodyName}DTO ${table.classBodyName?uncap_first}DTO) {
        this.${table.classBodyName?uncap_first} = convert().convertToUpdateVO(${table.classBodyName?uncap_first}DTO);
    }

    /**
     * <p>
     * 视图类 : 封装响应数据
     * </p>
     *
     * @author ${author}
     * @date ${cfg.date}
     */
    @Data
    @EqualsAndHashCode(callSuper = true)
    @Accessors(chain = true)
    public static class ${table.classBodyName}UpdateVO extends ${table.classBodyName}DTO {

    }
}