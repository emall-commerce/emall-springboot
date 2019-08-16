package ${package.Logic};


import ${table.modulePackage}.business.${package.ModuleName}.pojo.request.query.${table.classBodyName}CommonQueryRequest;
import ${table.modulePackage}.business.${package.ModuleName}.pojo.request.query.${table.classBodyName}PageQueryRequest;
import ${table.modulePackage}.business.${package.ModuleName}.pojo.request.save.${table.classBodyName}SaveRequest;
import ${table.modulePackage}.business.${package.ModuleName}.pojo.request.update.${table.classBodyName}UpdateByIdRequest;
import ${table.modulePackage}.business.${package.ModuleName}.pojo.response.query.${table.classBodyName}PageQueryResponse.${table.classBodyName}PageItem;
import ${table.modulePackage}.business.${package.ModuleName}.pojo.response.query.${table.classBodyName}QueryResponse;
import ${table.modulePackage}.business.${package.ModuleName}.pojo.response.save.${table.classBodyName}SaveResponse;
import ${table.modulePackage}.business.${package.ModuleName}.pojo.response.update.${table.classBodyName}UpdateResponse;
import com.lxzl.skull.database.common.Page;

/**
 * <p>
 * ${table.comment!} 逻辑类
 * </p>
 *
 * @author ${author}
 * @since ${cfg.date}
 */
public interface ${table.classBodyName}Logic {
    /**
     * <p>
     * 保存普通字段的数据
     * </p>
     *
     * @param request : 保存请求对象
     * @return Response
     * @author ${author}
     * @date ${cfg.date}
     */
    ${table.classBodyName}SaveResponse save(${table.classBodyName}SaveRequest request);

    /**
     * <p>
     * 更新普通字段的数据
     * </p>
     *
     * @param request : 更新请求对象
     * @return Response
     * @author ${author}
     * @date ${cfg.date}
     */
    ${table.classBodyName}UpdateResponse updateById(${table.classBodyName}UpdateByIdRequest request);

    /**
     * <p>
     * 根据分页查询条件查询分页数据
     * </p>
     *
     * @param request : 分页查询请求对象
     * @return Page<${table.classBodyName}PageItem>
     * @author ${author}
     * @date ${cfg.date}
     */
    Page<${table.classBodyName}PageItem> page(${table.classBodyName}PageQueryRequest request);

    /**
     * <p>
     * 根据查询条件获取详情数据
     * </p>
     *
     * @param request : 查询请求对象
     * @return Response
     * @author ${author}
     * @date ${cfg.date}
     */
    ${table.classBodyName}QueryResponse find(${table.classBodyName}CommonQueryRequest request);
}
