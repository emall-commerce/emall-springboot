package ${package.QueryResponse};

import ${package.DTO}.${table.classBodyName}DTO;
import com.lxzl.standard.base.pojo.response.BaseStandardResponse;
import ${table.modulePackage}.business.${package.ModuleName}.pojo.domain.${table.classBodyName}Domain;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.util.List;

/**
 * <p>
 * ${table.comment!} 普通查询响应类
 * </p>
 *
 * @author ${author}
 * @since ${cfg.date}
 */
@Data
@Accessors(chain = true)
public class ${table.classBodyName}QueryResponse implements BaseStandardResponse<${table.classBodyName}DTO>, ${table.classBodyName}Domain {
    /**
     * 返回给页面的视图对象
     */
    private ${table.classBodyName}QueryVO ${table.classBodyName?uncap_first};

    @Override
    public void build(${table.classBodyName}DTO ${table.classBodyName?uncap_first}DTO) {
        this.${table.classBodyName?uncap_first} = convert().convertToQueryVO(${table.classBodyName?uncap_first}DTO);
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
    public static class ${table.classBodyName}QueryVO extends ${table.classBodyName}DTO {

    }
}