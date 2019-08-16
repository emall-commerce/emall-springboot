package generate;

import com.baomidou.mybatisplus.generator.config.po.TableInfo;
import lombok.Data;

/**
 * @author daiqi
 * @create 2019-05-07 13:56
 */
@Data
public class TableInfoExpand extends TableInfo {
    private String classBodyName;
    private String nameRemovePrefix;
    private String parentPackage;
    private String modulePackage;

}
