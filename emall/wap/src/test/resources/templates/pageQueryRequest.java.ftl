package ${package.PageQueryRequest};

import ${package.Query}.${table.classBodyName}Query;

import ${table.modulePackage}.business.${package.ModuleName}.pojo.request.${table.classBodyName}QueryRequest;
import ${table.modulePackage}.business.${package.ModuleName}.pojo.response.query.${table.classBodyName}PageQueryResponse;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;
/**
 * <p>
 * ${table.comment!} 分页查询请求类
 * </p>
 *
 * @author ${author}
 * @since ${cfg.date}
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
public class ${table.classBodyName}PageQueryRequest extends ${table.classBodyName}QueryRequest<${table.classBodyName}PageQueryResponse> {
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
    public Class<${table.classBodyName}PageQueryResponse> getResponseClass() {
        return ${table.classBodyName}PageQueryResponse.class;
    }

    @Override
    public ${table.classBodyName}Query parsePojo() {
        return convert().convertToQuery(this);
    }

}