package ${package.Convert};

import ${package.Entity}.${entity};
import ${package.DTO}.${table.classBodyName}DTO;
import ${package.Query}.${table.classBodyName}Query;
import com.lxzl.standard.base.convert.BaseConvert;
import ${table.modulePackage}.business.${package.ModuleName}.pojo.request.query.${table.classBodyName}CommonQueryRequest;
import ${table.modulePackage}.business.${package.ModuleName}.pojo.request.query.${table.classBodyName}PageQueryRequest;
import ${table.modulePackage}.business.${package.ModuleName}.pojo.request.save.${table.classBodyName}SaveRequest;
import ${table.modulePackage}.business.${package.ModuleName}.pojo.request.update.${table.classBodyName}UpdateByIdRequest;
import ${table.modulePackage}.business.${package.ModuleName}.pojo.response.query.${table.classBodyName}PageQueryResponse.${table.classBodyName}PageItem;
import ${table.modulePackage}.business.${package.ModuleName}.pojo.response.query.${table.classBodyName}QueryResponse.${table.classBodyName}QueryVO;
import ${table.modulePackage}.business.${package.ModuleName}.pojo.response.save.${table.classBodyName}SaveResponse.${table.classBodyName}SaveVO;
import ${table.modulePackage}.business.${package.ModuleName}.pojo.response.update.${table.classBodyName}UpdateResponse.${table.classBodyName}UpdateVO;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.Mappings;
import org.mapstruct.ReportingPolicy;
import org.mapstruct.factory.Mappers;

import java.util.List;
/**
 * <p>
 * ${table.comment!} 转换类
 * </p>
 *
 * @author ${author}
 * @since ${cfg.date}
 */
@Mapper(unmappedTargetPolicy = ReportingPolicy.IGNORE)
public interface ${table.classBodyName}Convert extends BaseConvert<${table.entityName}, ${table.classBodyName}DTO> {
    /**
     * <p>
     * 转化类的单例对象
     * </p>
     */
    ${table.classBodyName}Convert INSTANCE = Mappers.getMapper(${table.classBodyName}Convert.class);

    /**
     * <p>
     * 将实体对象转化为DTO对象
     * </p>
     *
     * @param ${table.entityName?uncap_first} : 实体对象
     * @return ${table.classBodyName?uncap_first}DTO : 数据传输对象
     * @author ${author}
     * @date ${cfg.date}
     */
    @Override
    @Mappings({@Mapping(source = "id", target = "${table.classBodyName?uncap_first}Id")})
    ${table.classBodyName}DTO convertToDTO(${table.entityName} ${table.entityName?uncap_first});

    /**
     * <p>
     * 将DTO对象转化为实体对象
     * </p>
     *
     * @param ${table.classBodyName?uncap_first}DTO : 数据传输对象
     * @return ${table.entityName?uncap_first} : 实体对象
     * @author ${author}
     * @date ${cfg.date}
     */
    @Override
    @Mappings({@Mapping(source = "${table.classBodyName?uncap_first}Id", target = "id")})
    ${table.entityName} convertToEntity(${table.classBodyName}DTO ${table.classBodyName?uncap_first}DTO);

    /**
     * <p>
     * 将公共查询请求对象转化为查询对象
     * </p>
     *
     * @param request : 公共查询对象
     * @return ${table.classBodyName}Query
     * @author ${author}
     * @date ${cfg.date}
     */
    ${table.classBodyName}Query convertToQuery(${table.classBodyName}CommonQueryRequest request);

    /**
     * <p>
     * 将分页查询请求对象转化为查询对象
     * </p>
     *
     * @param request : 分页查询对象
     * @return ${table.classBodyName}Query
     * @author ${author}
     * @date ${cfg.date}
     */
    ${table.classBodyName}Query convertToQuery(${table.classBodyName}PageQueryRequest request);

    /**
     * <p>
     * 将保存请求对象转化为DTO对象
     * </p>
     *
     * @param request : 保存请求对象
     * @return ${table.classBodyName}DTO
     * @author ${author}
     * @date ${cfg.date}
     */
    ${table.classBodyName}DTO convertToDTO(${table.classBodyName}SaveRequest request);

    /**
     * <p>
     * 更新请求对象转化为DTO对象
     * </p>
     *
     * @param request : 根据Id更新请求对象
     * @return ${table.classBodyName}DTO
     * @author ${author}
     * @date ${cfg.date}
     */
    ${table.classBodyName}DTO convertToDTO(${table.classBodyName}UpdateByIdRequest request);

    /**
     * <p>
     * dto转换为分页item
     * </p>
     *
     * @param dto : 数据传输对象
     * @return ${table.classBodyName}PageItem
     * @author ${author}
     * @date ${cfg.date}
     */
    ${table.classBodyName}PageItem convertToPageItem(${table.classBodyName}DTO dto);

    /**
     * <p>
     * dto列表转换为分页item列表
     * </p>
     *
     * @param dtos : 数据传输对象列表
     * @return ${table.classBodyName}PageItem
     * @author ${author}
     * @date ${cfg.date}
     */
    List<${table.classBodyName}PageItem> convertToPageItems(List<${table.classBodyName}DTO> dtos);

    /**
     * <p>
     * dto转换为查询VO对象
     * </p>
     *
     * @param dto : 数据传输对象
     * @return ${table.classBodyName}QueryVO
     * @author ${author}
     * @date ${cfg.date}
     */
    ${table.classBodyName}QueryVO convertToQueryVO(${table.classBodyName}DTO dto);

    /**
     * <p>
     * dto转换为保存VO对象
     * </p>
     *
     * @param dto : 数据传输对象
     * @return ${table.classBodyName}QueryVO
     * @author ${author}
     * @date ${cfg.date}
     */
    ${table.classBodyName}SaveVO convertToSaveVO(${table.classBodyName}DTO dto);

    /**
     * <p>
     * dto转换为更新VO对象
     * </p>
     *
     * @param dto : 数据传输对象
     * @return ${table.classBodyName}QueryVO
     * @author ${author}
     * @date ${cfg.date}
     */
    ${table.classBodyName}UpdateVO convertToUpdateVO(${table.classBodyName}DTO dto);

}
