package generate;

import lombok.Data;
import lombok.experimental.Accessors;

/**
 * @author daiqi
 * @create 2019-05-15 15:10
 */
@Data
@Accessors(chain = true)
public class GeneratorCodeDTO {
    /** 父包 */
    private String parentPackage;
    /** 实体类path */
    private String entityPath;
    /** mapper类path */
    private String mapperPath;
    /** xmlpath */
    private String xmlPath;
    /** pojo类的path */
    private String pojoPath;

    /** service类path */
    private String servicePath;
    /** serviceImpl类path */
    private String serviceImplPath;
    /** core包path */
    private String corePath;

    /** controller的path */
    private String controllerPath;
    /** api的path */
    private String apiPath;

    /** 数据库url */
    private String dataBaseUrl;
    /** 数据库名称 */
    private String dataBaseName;
    /** 数据库端口 */
    private String dataBasePort;
    /** 数据库用户名 */
    private String username;
    /** 数据库密码 */
    private String password;

    /** 表名 */
    private String[] tableName;
    /** 表前缀 */
    private String subPrefix;
    /** 作者 */
    private String author;

    /** 模块的统一包名 */
    private String modulePackage;
}
