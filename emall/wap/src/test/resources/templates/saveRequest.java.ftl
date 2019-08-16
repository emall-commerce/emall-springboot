package ${package.SaveRequest};

import ${package.DTO}.${table.classBodyName}DTO;

import ${table.modulePackage}.business.${package.ModuleName}.pojo.request.${table.classBodyName}ModifyRequest;
import ${table.modulePackage}.business.${package.ModuleName}.pojo.response.save.${table.classBodyName}SaveResponse;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * ${table.comment!} 保存请求类
 * </p>
 *
 * @author ${author}
 * @since ${cfg.date}
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
public class ${table.classBodyName}SaveRequest extends ${table.classBodyName}ModifyRequest<${table.classBodyName}SaveResponse> {
    @Override
    public void init() {

    }

    @Override
    public void verify() {

    }

    @Override
    public void build() {
        init();
        verify();
    }

    @Override
    public Class<${table.classBodyName}SaveResponse> getResponseClass() {
        return ${table.classBodyName}SaveResponse.class;
    }

    @Override
    public ${table.classBodyName}DTO parsePojo() {
        return convert().convertToDTO(this);
    }

}