package ${package.CommonQueryRequest};

import ${package.Query}.${table.classBodyName}Query;
import ${table.modulePackage}.business.${package.ModuleName}.pojo.request.${table.classBodyName}QueryRequest;
import ${table.modulePackage}.business.${package.ModuleName}.pojo.response.query.${table.classBodyName}QueryResponse;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * ${table.comment!} 普通查询请求类
 * </p>
 *
 * @author ${author}
 * @since ${cfg.date}
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
public class ${table.classBodyName}CommonQueryRequest extends ${table.classBodyName}QueryRequest<${table.classBodyName}QueryResponse> {
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
    public Class<${table.classBodyName}QueryResponse> getResponseClass() {
        return ${table.classBodyName}QueryResponse.class;
    }

    @Override
    public ${table.classBodyName}Query parsePojo() {
        return convert().convertToQuery(this);
    }

}