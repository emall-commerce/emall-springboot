package ${package.ModifyResponse};

import ${package.DTO}.${table.classBodyName}DTO;
import ${table.modulePackage}.business.${package.ModuleName}.pojo.domain.${table.classBodyName}Domain;
import com.lxzl.standard.base.pojo.response.BaseStandardResponse;
import lombok.Data;
import lombok.experimental.Accessors;

/**
 * <p>
 * ${table.comment!} 修改响应抽象类
 * </p>
 *
 * @author ${author}
 * @since ${cfg.date}
 */
@Data
@Accessors(chain = true)
public abstract class ${table.classBodyName}ModifyResponse implements BaseStandardResponse<${table.classBodyName}DTO>, ${table.classBodyName}Domain {

}