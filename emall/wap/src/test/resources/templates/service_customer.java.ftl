package ${package.Service};

import ${table.modulePackage}.business.${package.ModuleName}.pojo.request.${table.classBodyName}ModifyRequest;
import ${table.modulePackage}.business.${package.ModuleName}.pojo.request.${table.classBodyName}QueryRequest;
import ${table.modulePackage}.business.${package.ModuleName}.pojo.request.query.${table.classBodyName}PageQueryRequest;
import ${table.modulePackage}.business.${package.ModuleName}.pojo.response.${table.classBodyName}ModifyResponse;
import ${table.modulePackage}.business.${package.ModuleName}.pojo.response.query.${table.classBodyName}PageQueryResponse.${table.classBodyName}PageItem;
import ${table.modulePackage}.business.${package.ModuleName}.pojo.response.query.${table.classBodyName}QueryResponse;
import com.lxzl.skull.database.common.Page;

/**
 * <p>
 * ${table.comment!} 服务类
 * </p>
 *
 * @author ${author}
 * @since ${cfg.date}
 */
public interface ${table.serviceName} {
    /**
     * <p>
     * 保存数据
     * </p>
     *
     * @param request : 保存请求对象
     * @return Response
     * @author ${author}
     * @date ${cfg.date}
     */
    <Request extends ${table.classBodyName}ModifyRequest<Response>, Response extends ${table.classBodyName}ModifyResponse> Response save(Request request);

    /**
     * <p>
     * 更新数据
     * </p>
     *
     * @param request : 更新请求对象
     * @return Response
     * @author ${author}
     * @date ${cfg.date}
     */
    <Request extends ${table.classBodyName}ModifyRequest<Response>, Response extends ${table.classBodyName}ModifyResponse> Response update(Request request);

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
    <Request extends ${table.classBodyName}QueryRequest<Response>, Response extends ${table.classBodyName}QueryResponse> Response find(Request request);

    /**
     * <p>
     * 校验id对应的数据是否存在数据库，存在抛出异常
     * </p>
     *
     * @param id : 主键id
     * @return void
     * @author daiqi
     * @date 2019/5/13 13:11
     */
     void verifyExistById(Long id);

    /**
     * <p>
     * 校验id对应的数据是否不存在数据库，不存在抛出异常
     * </p>
     *
     * @param id : 主键id
     * @return void
     * @author daiqi
     * @date 2019/5/13 13:11
     */
     void verifyNotExistById(Long id);
}
