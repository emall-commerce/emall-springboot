import generate.GenerateCodeHandler;
import generate.GeneratorCodeDTO;

/**
 * @Author: xiaobin
 * @Date: 2019年8月16日 20:40:40
 * @Desc: 代码生成工具类
 */
public class GenerateCodeS {
    // 前缀
    private static String subPrefix = "";
    private static final String[] tablesName = new String[]{"emall_user"};
    private static String author = "xiaobin";

    public static void main(String[] args) {
        new GenerateCodeHandler().generateCode(buildGeneratorCodeDTO());
    }


    public static GeneratorCodeDTO buildGeneratorCodeDTO() {
        GeneratorCodeDTO generatorCodeDTO = new GeneratorCodeDTO();
        /** 父包 */
        generatorCodeDTO.setParentPackage("com.lxzl.risk.system.business")
                .setModulePackage("com.lxzl.risk.system")
                /** 实体类path */
                .setEntityPath("/lxzl-risk-system-dataaccess/src/main/java/com/lxzl/risk/system/business")
                /** mapper类path */
                .setMapperPath("/lxzl-risk-system-dataaccess/src/main/java/com/lxzl/risk/system/business")
                /** xmlpath */
                .setXmlPath("/lxzl-risk-system-dataaccess/src/main/resources/mapper")
                /** pojo类的path */
                .setPojoPath("/lxzl-risk-system-common/src/main/java/com/lxzl/risk/system/business")

                /** service类path */
                .setServicePath("/lxzl-risk-system-core/src/main/java/com/lxzl/risk/system/business")
                /** serviceImpl类path */
                .setServiceImplPath("/lxzl-risk-system-core/src/main/java/com/lxzl/risk/system/business")
                /** core包path */
                .setCorePath("/lxzl-risk-system-core/src/main/java/com/lxzl/risk/system/business")

                /** controller的path */
                .setControllerPath("/lxzl-risk-system-web/src/main/java/com/lxzl/risk/system/business")
                /** api的path */
                .setApiPath("/lxzl-risk-system-api/src/main/java/com/lxzl/risk/system/business")

                .setDataBaseUrl("192.168.10.205")
                .setDataBaseName("lxzl_risk_system")
                .setDataBasePort("3306")
                .setUsername("lxzldev")
                .setPassword("lxzldev")

                /** 表名 */
                .setTableName(tablesName)
                /** 表前缀 */
                .setSubPrefix(subPrefix)
                /** 作者 */
                .setAuthor(author);

        return generatorCodeDTO;
    }
}
