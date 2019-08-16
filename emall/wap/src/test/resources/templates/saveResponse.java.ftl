package ${package.SaveResponse};

import ${package.DTO}.${table.classBodyName}DTO;

import ${table.modulePackage}.business.${package.ModuleName}.pojo.response.${table.classBodyName}ModifyResponse;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * ${table.comment!} 保存响应类
 * </p>
 *
 * @author ${author}
 * @since ${cfg.date}
 */
@Data
@Accessors(chain = true)
public class ${table.classBodyName}SaveResponse extends ${table.classBodyName}ModifyResponse {
    /**
     * 返回给页面的视图对象
     */
    private ${table.classBodyName}SaveVO ${table.classBodyName?uncap_first};

    @Override
    public void build(${table.classBodyName}DTO ${table.classBodyName?uncap_first}DTO) {
        this.${table.classBodyName?uncap_first} = convert().convertToSaveVO(${table.classBodyName?uncap_first}DTO);
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
    public static class ${table.classBodyName}SaveVO extends ${table.classBodyName}DTO {

    }
}