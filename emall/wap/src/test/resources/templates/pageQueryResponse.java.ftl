package ${package.PageQueryResponse};

import ${package.DTO}.${table.classBodyName}DTO;
import ${table.modulePackage}.business.${package.ModuleName}.pojo.domain.${table.classBodyName}Domain;
import ${table.modulePackage}.business.${package.ModuleName}.pojo.dto.${table.classBodyName}DTO;
import com.lxzl.standard.base.pojo.response.BaseStandardPageResponse;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.util.List;

/**
 * <p>
 * ${table.comment!} 分页查询响应类
 * </p>
 *
 * @author ${author}
 * @since ${cfg.date}
 */
@Data
@Accessors(chain = true)
public class ${table.classBodyName}PageQueryResponse implements BaseStandardPageResponse<List<${table.classBodyName}DTO>, ${table.classBodyName}PageQueryResponse.${table.classBodyName}PageItem>, ${table.classBodyName}Domain {
    /**
     * 分页item列表数据
     */
    private List<${table.classBodyName}PageItem> ${table.classBodyName?uncap_first}s;

    @Override
    public void build(List<${table.classBodyName}DTO> ${table.classBodyName?uncap_first}DTOS) {
        this.${table.classBodyName?uncap_first}s = convert().convertToPageItems(${table.classBodyName?uncap_first}DTOS);
    }

    @Override
    public List<${table.classBodyName}PageItem> getItems() {
        return this.${table.classBodyName?uncap_first}s;
    }

    /**
     * <p>
     * 分页item数据
     * </p>
     *
     * @author ${author}
     * @date ${cfg.date}
     */
    @Data
    @EqualsAndHashCode(callSuper = true)
    @Accessors(chain = true)
    public static class ${table.classBodyName}PageItem extends ${table.classBodyName}DTO {

    }
}