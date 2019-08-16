package ${package.UpdateByIdRequest};

import ${package.DTO}.${table.classBodyName}DTO;

import ${table.modulePackage}.business.${package.ModuleName}.pojo.request.${table.classBodyName}ModifyRequest;
import ${table.modulePackage}.business.${package.ModuleName}.pojo.response.update.${table.classBodyName}UpdateResponse;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * ${table.comment!} 普通更新请求类
 * </p>
 *
 * @author ${author}
 * @since ${cfg.date}
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
public class ${table.classBodyName}UpdateByIdRequest extends ${table.classBodyName}ModifyRequest<${table.classBodyName}UpdateResponse> {

    /** 表id */
    private Long ${table.classBodyName?uncap_first}Id;

    @Override
    public void init() {

    }

    @Override
    public void verify() {
        // 校验数据是否存在，不存在抛出异常
        service().verifyExistById(this.${table.classBodyName?uncap_first}Id);
    }

    @Override
    public void build() {
        init();
        verify();
    }

    @Override
    public Class<${table.classBodyName}UpdateResponse> getResponseClass() {
        return ${table.classBodyName}UpdateResponse.class;
    }

    @Override
    public ${table.classBodyName}DTO parsePojo() {
        return convert().convertToDTO(this);
    }
}