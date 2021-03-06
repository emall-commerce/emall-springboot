package ${package.Mapper};

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import ${package.Entity}.${entity};

/**
 * <p>
 * Mapper 接口
 * </p>
 *
 * @author ${author}
 * @since ${date}
 */
@Mapper
public interface ${table.mapperName} extends BaseMapper<${entity}> {


}