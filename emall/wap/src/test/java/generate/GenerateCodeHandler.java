package generate;

import com.baomidou.mybatisplus.core.toolkit.StringPool;
import com.baomidou.mybatisplus.generator.AutoGenerator;
import com.baomidou.mybatisplus.generator.InjectionConfig;
import com.baomidou.mybatisplus.generator.config.*;
import com.baomidou.mybatisplus.generator.config.builder.ConfigBuilder;
import com.baomidou.mybatisplus.generator.config.po.TableField;
import com.baomidou.mybatisplus.generator.config.po.TableInfo;
import com.baomidou.mybatisplus.generator.config.rules.DbColumnType;
import com.baomidou.mybatisplus.generator.config.rules.NamingStrategy;
import com.baomidou.mybatisplus.generator.engine.FreemarkerTemplateEngine;
import org.springframework.beans.BeanUtils;

import java.text.SimpleDateFormat;
import java.util.*;

/**
 * 代码生成器助手类
 *
 * @author daiqi
 * @create 2019-05-09 15:33
 */
public class GenerateCodeHandler {

    private String moduleName;
    private String[] tableName;
    private String[] tablePrefix;
    /**
     * ----------------路径配置 begin------------------
     */
    private String entityPath;
    private String mapperPath;
    private String xmlPath;

    private String pojoPath;

    private String servicePath;
    private String serviceImplPath;
    private String corePath;

    private String controllerPath;
    private String apiPath;
    /**
     * ----------------路径配置 end------------------
     */
    private String parentPackage;
    private String[] extendsFields = {"id", "create_by", "update_by", "create_date", "update_date",
            "version", "available", "is_deleted", "remark"};
    /**
     * 代码生成器
     */
    AutoGenerator mpg = new AutoGenerator();
    /**
     * 全局配置
     */
    GlobalConfig gc = new GlobalConfig();
    /**
     * 数据源配置
     */
    DataSourceConfig dsc = new DataSourceConfig();

    /**
     * 包配置
     */
    PackageConfig pc = new PackageConfig();

    String projectPath = System.getProperty("user.dir");

    GeneratorCodeDTO generatorCodeDTO;
    /**
     * 策略配置
     */
    StrategyConfig strategy = new StrategyConfig();
    private boolean buildFieldFlag = false;

    // 入口
    public void generateCode(GeneratorCodeDTO generatorCodeDTO) {
        this.generatorCodeDTO = generatorCodeDTO;
        entityPath = generatorCodeDTO.getEntityPath();
        mapperPath = generatorCodeDTO.getMapperPath();
        xmlPath = generatorCodeDTO.getXmlPath();
        pojoPath = generatorCodeDTO.getPojoPath();
        servicePath = generatorCodeDTO.getServicePath();
        serviceImplPath = generatorCodeDTO.getServiceImplPath();
        corePath = generatorCodeDTO.getCorePath();
        controllerPath = generatorCodeDTO.getControllerPath();
        apiPath = generatorCodeDTO.getApiPath();

        parentPackage = generatorCodeDTO.getParentPackage();

        init(generatorCodeDTO.getTableName(), generatorCodeDTO.getSubPrefix(), generatorCodeDTO.getAuthor());
        generateJava();
        generateXml();
    }


    public void init(String[] tableName, String subPrefix, String author) {
        if (author == null) {
            author = "";
        }
        this.tableName = tableName;
        String[] tablePrefix = {subPrefix};
        this.tablePrefix = tablePrefix;
        gc.setAuthor(author);
        gc.setOpen(false);
        gc.setBaseResultMap(true);
        gc.setBaseColumnList(true);
        gc.setServiceName("%sService");
        gc.setEntityName("%sEntity");
        mpg.setGlobalConfig(gc);


        dsc.setUrl("jdbc:mysql://" + generatorCodeDTO.getDataBaseUrl() + ":" + generatorCodeDTO.getDataBasePort() + "/" + generatorCodeDTO.getDataBaseName() + "?useSSL=false&characterEncoding=utf8");
        // dsc.setSchemaName("public");
        dsc.setDriverName("com.mysql.jdbc.Driver");
        dsc.setUsername(generatorCodeDTO.getUsername());
        dsc.setPassword(generatorCodeDTO.getPassword());
        mpg.setDataSource(dsc);

        pc.setModuleName(moduleName);
        pc.setParent(parentPackage);
        mpg.setPackageInfo(pc);


        loadStrategy();
    }


    private void loadStrategy() {

        strategy.setNaming(NamingStrategy.underline_to_camel);
        strategy.setColumnNaming(NamingStrategy.underline_to_camel);
//        strategy.setSuperEntityClass("com.baomidou.mybatisplus.samples.generator.common.BaseEntity");
        strategy.setEntityLombokModel(true);
        strategy.setRestControllerStyle(true);
//        strategy.setSuperControllerClass("com.baomidou.mybatisplus.samples.generator.common.BaseController");
        strategy.setInclude(tableName);
        strategy.setSuperEntityColumns(extendsFields);
        strategy.setControllerMappingHyphenStyle(false);
        strategy.setTablePrefix(tablePrefix);
        mpg.setStrategy(strategy);
        // 选择 freemarker 引擎需要指定如下加，注意 pom 依赖必须有！
        mpg.setTemplateEngine(new FreemarkerTemplateEngine());
    }


    private void generateJava() {
        generateToCommon();
        generateToDataaccess();
        generateToCore();
        generateToWeb();
    }

    private void generateToCommon() {
        generateDTO();
        generateQuery();
        generateConstant();
        generateErrorCodeEnum();
    }

    private void generateToDataaccess() {
        generateEntity();
        generateMapper();
    }

    private void generateToCore() {
        generateConvert();
        generateService();
        generateServiceImpl();
        generateLogic();
        generateLogicImpl();

        generateBasePojo();
        generateCommonQueryRequest();
        generateUpdateByIdRequest();
        generateModifyRequest();
        generateModifyResponse();
        generatePageQueryRequest();
        generatePageQueryResponse();
        generateQueryRequest();
        generateQueryResponse();
        generateSaveRequest();
        generateSaveResponse();
        generateUpdateResponse();
    }

    private void generateToWeb() {
        generateController();
    }


    private void generateXml() {
        generateMapperXml();
    }

    public void generateEntity() {
        String templatePath = "/templates/entity_customer.java.ftl";
        String filePath = entityPath + "/" + moduleName + "/entity/";
        String classBodySuffix = "Entity";
        String packageKey = "Entity";
        String subPackage = "entity";

        generateCodeCoreForCustomer(templatePath, filePath, classBodySuffix, packageKey, subPackage);
//        generateCodeCoreForDefault(entityPath, ConstVal.ENTITY_PATH);
    }

    public void generateMapper() {
        String templatePath = "/templates/mapper_customer.java.ftl";
        String filePath = mapperPath + "/" + moduleName + "/mapper/";
        String classBodySuffix = "Mapper";
        String packageKey = "Mapper";
        String subPackage = "mapper";

        generateCodeCoreForCustomer(templatePath, filePath, classBodySuffix, packageKey, subPackage);
//        generateCodeCoreForDefault(mapperPath, ConstVal.MAPPER_PATH);
    }

    public void generateService() {
        String templatePath = "/templates/service_customer.java.ftl";
        String filePath = corePath + "/" + moduleName + "/service/";
        String classBodySuffix = "Service";
        String packageKey = "Service";
        String subPackage = "service";

        generateCodeCoreForCustomer(templatePath, filePath, classBodySuffix, packageKey, subPackage);
//        generateCodeCoreForDefault(servicePath, ConstVal.SERVICE_PATH);
    }

    public void generateServiceImpl() {
        String templatePath = "/templates/serviceImpl_customer.java.ftl";
        String filePath = corePath + "/" + moduleName + "/service/impl/";
        String classBodySuffix = "ServiceImpl";
        String packageKey = "ServiceImpl";
        String subPackage = "service.impl";

        generateCodeCoreForCustomer(templatePath, filePath, classBodySuffix, packageKey, subPackage);
//        generateCodeCoreForDefault(serviceImplPath, ConstVal.SERVICE_IMPL_PATH);

    }

    public void generateController() {
        String templatePath = "/templates/controller_customer.java.ftl";
        String filePath = controllerPath + "/" + moduleName + "/controller/";
        String classBodySuffix = "Controller";
        String packageKey = "Controller";
        String subPackage = "controller";

        generateCodeCoreForCustomer(templatePath, filePath, classBodySuffix, packageKey, subPackage);
//        generateCodeCoreForDefault(controllerPath, ConstVal.CONTROLLER_PATH);

    }

    public void generateLogic() {
        String templatePath = "/templates/logic.java.ftl";
        String filePath = corePath + "/" + moduleName + "/logic/";
        String classBodySuffix = "Logic";
        String packageKey = "Logic";
        String subPackage = "logic";

        generateCodeCoreForCustomer(templatePath, filePath, classBodySuffix, packageKey, subPackage);
    }

    public void generateLogicImpl() {
        String templatePath = "/templates/logicImpl.java.ftl";
        String filePath = corePath + "/" + moduleName + "/logic/impl/";
        String classBodySuffix = "LogicImpl";
        String packageKey = "LogicImpl";
        String subPackage = "logic.impl";

        generateCodeCoreForCustomer(templatePath, filePath, classBodySuffix, packageKey, subPackage);
    }

    public void generateDTO() {
        // 自定义配置
        String templatePath = "/templates/dto.java.ftl";
        String filePath = pojoPath + "/" + moduleName + "/pojo/dto/";
        String classBodySuffix = "DTO";
        String packageKey = "DTO";
        String subPackage = "pojo.dto";
        buildFieldFlag = true;
        generateCodeCoreForCustomer(templatePath, filePath, classBodySuffix, packageKey, subPackage);
    }

    public void generateQuery() {
        // 自定义配置
        String templatePath = "/templates/query.java.ftl";
        String filePath = pojoPath + "/" + moduleName + "/pojo/query/";
        String classBodySuffix = "Query";
        String packageKey = "Query";
        String subPackage = "pojo.query";
        buildFieldFlag = true;
        generateCodeCoreForCustomer(templatePath, filePath, classBodySuffix, packageKey, subPackage);
    }

    public void generateConvert() {
        // 自定义配置
        String templatePath = "/templates/convert.java.ftl";
        String filePath = corePath + "/" + moduleName + "/convert/";
        String classBodySuffix = "Convert";
        String packageKey = "Convert";
        String subPackage = "convert";

        generateCodeCoreForCustomer(templatePath, filePath, classBodySuffix, packageKey, subPackage);
    }

    public void generateBasePojo() {
        // 自定义配置
        String templatePath = "/templates/domain.java.ftl";
        String filePath = corePath + "/" + moduleName + "/pojo/domain/";
        String classBodySuffix = "Domain";
        String packageKey = "Domain";
        String subPackage = "pojo.domain";

        generateCodeCoreForCustomer(templatePath, filePath, classBodySuffix, packageKey, subPackage);
    }

    public void generateCommonQueryRequest() {
        // 自定义配置
        String templatePath = "/templates/commonQueryRequest.java.ftl";
        String filePath = corePath + "/" + moduleName + "/pojo/request/query/";
        String classBodySuffix = "CommonQueryRequest";
        String packageKey = "CommonQueryRequest";
        String subPackage = "pojo.request.query";

        generateCodeCoreForCustomer(templatePath, filePath, classBodySuffix, packageKey, subPackage);
    }

    public void generateUpdateByIdRequest() {
        // 自定义配置
        String templatePath = "/templates/updateByIdRequest.java.ftl";
        String filePath = corePath + "/" + moduleName + "/pojo/request/update/";
        String classBodySuffix = "UpdateByIdRequest";
        String packageKey = "UpdateByIdRequest";
        String subPackage = "pojo.request.update";

        generateCodeCoreForCustomer(templatePath, filePath, classBodySuffix, packageKey, subPackage);
    }

    public void generateModifyRequest() {
        // 自定义配置
        String templatePath = "/templates/modifyRequest.java.ftl";
        String filePath = corePath + "/" + moduleName + "/pojo/request/";
        String classBodySuffix = "ModifyRequest";
        String packageKey = "ModifyRequest";
        String subPackage = "pojo.request";

        generateCodeCoreForCustomer(templatePath, filePath, classBodySuffix, packageKey, subPackage);
    }

    public void generateModifyResponse() {
        // 自定义配置
        String templatePath = "/templates/modifyResponse.java.ftl";
        String filePath = corePath + "/" + moduleName + "/pojo/response/";
        String classBodySuffix = "ModifyResponse";
        String packageKey = "ModifyResponse";
        String subPackage = "pojo.response";

        generateCodeCoreForCustomer(templatePath, filePath, classBodySuffix, packageKey, subPackage);
    }

    public void generatePageQueryRequest() {
        // 自定义配置
        String templatePath = "/templates/pageQueryRequest.java.ftl";
        String filePath = corePath + "/" + moduleName + "/pojo/request/query/";
        String classBodySuffix = "PageQueryRequest";
        String packageKey = "PageQueryRequest";
        String subPackage = "pojo.request.query";

        generateCodeCoreForCustomer(templatePath, filePath, classBodySuffix, packageKey, subPackage);
    }

    public void generatePageQueryResponse() {
        // 自定义配置
        String templatePath = "/templates/pageQueryResponse.java.ftl";
        String filePath = corePath + "/" + moduleName + "/pojo/response/query/";
        String classBodySuffix = "PageQueryResponse";
        String packageKey = "PageQueryResponse";
        String subPackage = "pojo.response.query";

        generateCodeCoreForCustomer(templatePath, filePath, classBodySuffix, packageKey, subPackage);
    }

    public void generateQueryRequest() {
        // 自定义配置
        String templatePath = "/templates/queryRequest.java.ftl";
        String filePath = corePath + "/" + moduleName + "/pojo/request/";
        String classBodySuffix = "QueryRequest";
        String packageKey = "QueryRequest";
        String subPackage = "pojo.request";

        generateCodeCoreForCustomer(templatePath, filePath, classBodySuffix, packageKey, subPackage);
    }

    public void generateQueryResponse() {
        // 自定义配置
        String templatePath = "/templates/queryResponse.java.ftl";
        String filePath = corePath + "/" + moduleName + "/pojo/response/query/";
        String classBodySuffix = "QueryResponse";
        String packageKey = "QueryResponse";
        String subPackage = "pojo.response.query";

        generateCodeCoreForCustomer(templatePath, filePath, classBodySuffix, packageKey, subPackage);
    }

    public void generateSaveRequest() {
        // 自定义配置
        String templatePath = "/templates/saveRequest.java.ftl";
        String filePath = corePath + "/" + moduleName + "/pojo/request/save/";
        String classBodySuffix = "SaveRequest";
        String packageKey = "SaveRequest";
        String subPackage = "pojo.request.save";

        generateCodeCoreForCustomer(templatePath, filePath, classBodySuffix, packageKey, subPackage);
    }

    public void generateSaveResponse() {
        // 自定义配置
        String templatePath = "/templates/saveResponse.java.ftl";
        String filePath = corePath + "/" + moduleName + "/pojo/response/save/";
        String classBodySuffix = "SaveResponse";
        String packageKey = "SaveResponse";
        String subPackage = "pojo.response.save";

        generateCodeCoreForCustomer(templatePath, filePath, classBodySuffix, packageKey, subPackage);
    }

    public void generateUpdateRequest() {
        // 自定义配置
        String templatePath = "/templates/updateRequest.java.ftl";
        String filePath = corePath + "/" + moduleName + "/pojo/request/update/";
        String classBodySuffix = "UpdateRequest";
        String packageKey = "UpdateRequest";
        String subPackage = "pojo.request.update";

        generateCodeCoreForCustomer(templatePath, filePath, classBodySuffix, packageKey, subPackage);
    }

    public void generateUpdateResponse() {
        // 自定义配置
        String templatePath = "/templates/updateResponse.java.ftl";
        String filePath = corePath + "/" + moduleName + "/pojo/response/update/";
        String classBodySuffix = "UpdateResponse";
        String packageKey = "UpdateResponse";
        String subPackage = "pojo.response.update";

        generateCodeCoreForCustomer(templatePath, filePath, classBodySuffix, packageKey, subPackage);
    }

    public void generateConstant() {
        // 自定义配置
        String templatePath = "/templates/constant.java.ftl";
        String filePath = pojoPath + "/" + moduleName + "/constant/";
        String classBodySuffix = "Constant";
        String packageKey = "Constant";
        String subPackage = "constant";

        generateCodeCoreForCustomer(templatePath, filePath, classBodySuffix, packageKey, subPackage);
    }

    public void generateErrorCodeEnum() {
        // 自定义配置
        String templatePath = "/templates/errorCodeEnum.java.ftl";
        String filePath = pojoPath + "/" + moduleName + "/constant/";
        String classBodySuffix = "ErrorCodeEnum";
        String packageKey = "ErrorCodeEnum";
        String subPackage = "constant";

        generateCodeCoreForCustomer(templatePath, filePath, classBodySuffix, packageKey, subPackage);
    }


    public void generateMapperXml() {
        AutoGenerator mpg = copeAutoGenerator();
        // 自定义配置
        InjectionConfig cfg = getInjectionConfigDefault();
        List<FileOutConfig> focList = new ArrayList<>();
        FileOutConfig fileOutConfig = new FileOutConfig("/templates/mapper_customer.xml.ftl") {
            @Override
            public String outputFile(TableInfo tableInfo) {
                // 自定义输入文件名称
                return projectPath + xmlPath + "/" + tableInfo.getName() + StringPool.DOT_XML;
            }
        };
        focList.add(fileOutConfig);
        cfg.setFileOutConfigList(focList);
        strategy.setSuperEntityColumns(null);
        mpg.setStrategy(strategy);
        mpg.setCfg(cfg);
        mpg.setTemplate(new TemplateConfig().setXml(null));
        buildConfigBuilderDefault(mpg, ConstVal.XML_PATH);
        mpg.execute();
    }

    private void generateCodeCoreForDefault(String javaSrcPath, String retainKey) {
        AutoGenerator mpg = copeAutoGenerator();
        // 自定义配置
        InjectionConfig cfg = getInjectionConfigDefault();
        mpg.setCfg(cfg);
        gc.setOutputDir(projectPath + javaSrcPath);
        mpg.setGlobalConfig(gc);

        buildConfigBuilderDefault(mpg, retainKey);
        mpg.execute();
        buildFieldFlag = false;
    }

    private void generateCodeCoreForCustomer(String templatePath, String filePath, String classBodySuffix, String packageKey, String subPackege) {
        AutoGenerator mpg = copeAutoGenerator();

        buildInjectionConfig(mpg, templatePath, filePath, classBodySuffix);
        buildConfigBuilderCustom(mpg, packageKey, subPackege);
        mpg.execute();
        buildFieldFlag = false;
    }

    private void buildInjectionConfig(AutoGenerator mpg, String templatePath, String filePath, String classBodySuffix) {
        // 自定义配置
        InjectionConfig cfg = getInjectionConfigDefault();

        List<FileOutConfig> focList = getFileOutConfigForJava(templatePath, filePath, classBodySuffix);

        cfg.setFileOutConfigList(focList);
        mpg.setCfg(cfg);
    }

    private void buildConfigBuilderDefault(AutoGenerator mpg, String retainKey) {
        buildConfigBuilder(mpg, retainKey, null, null);
    }

    private void buildConfigBuilderCustom(AutoGenerator mpg, String customPackageKey, String subPackage) {
        buildConfigBuilder(mpg, null, customPackageKey, subPackage);
    }

    /**
     * <p>
     * 简要说明
     * </p>
     *
     * @param mpg              代码生成器
     * @param customPackageKey : 包名的key
     * @param subPackage       : 子包名
     * @return void
     * @author daiqi
     * @date 2019/5/7 15:31
     */
    private void buildConfigBuilder(AutoGenerator mpg, String retainKey, String customPackageKey, String subPackage) {
        ConfigBuilder configBuilder = new ConfigBuilder(mpg.getPackageInfo(), mpg.getDataSource(), mpg.getStrategy(), mpg.getTemplate(), mpg.getGlobalConfig());

        TableInfo tableInfo = configBuilder.getTableInfoList().get(0);
        TableInfoExpand tableInfoExpand = expandTableInfo(tableInfo);
        tableInfoExpand.setModulePackage(generatorCodeDTO.getModulePackage());
        tableInfoExpand.setParentPackage(parentPackage);
        tableInfoExpand.setClassBodyName(getClassBody(tableInfoExpand));
        tableInfoExpand.setNameRemovePrefix(NamingStrategy.removePrefix(tableInfoExpand.getName(), tablePrefix));
        if (customPackageKey != null && subPackage != null) {
            if (!subPackage.startsWith(".")) {
                subPackage = "." + subPackage;
            }
            configBuilder.getPackageInfo().put(customPackageKey, pc.getParent() + subPackage);
        }
        if (this.mpg.getConfig() != null) {
            configBuilder.getPackageInfo().putAll(this.mpg.getConfig().getPackageInfo());
        }
//        {
//            "capitalName": "CertificateUploadStatus",
//                "columnType": "INTEGER",
//                "comment": "企业授权书上传状态[0:未上传,1:已上传]",
//                "convert": false,
//                "keyFlag": false,
//                "keyIdentityFlag": false,
//                "name": "certificate_upload_status",
//                "propertyName": "certificateUploadStatus",
//                "propertyType": "Integer",
//                "type": "int(4)"
//        },
        if (buildFieldFlag) {
            buildFieldId(tableInfo);
        }
        List<TableInfo> list = new ArrayList<>();
        list.add(tableInfoExpand);
        configBuilder.setTableInfoList(list);
        retainKey(retainKey, configBuilder.getPathInfo());
        mpg.setConfig(configBuilder);
        this.mpg.setConfig(configBuilder);
    }

    private void buildFieldId(TableInfo tableInfo) {
        TableField tableField = new TableField();
        tableField.setConvert(false);
        tableField.setKeyFlag(false);
        tableField.setKeyIdentityFlag(false);
        tableField.setColumnType(DbColumnType.LONG);
        tableField.setPropertyName((NamingStrategy.removePrefixAndCamel(tableInfo.getName(), strategy.getTablePrefix())) + "Id");
        tableField.setComment("数据表id");
        tableInfo.getFields().add(0, tableField);
    }

    private InjectionConfig getInjectionConfigDefault() {
        return new InjectionConfig() {
            @Override
            public void initMap() {
                Map<String, Object> tempMap = new HashMap<>();
                tempMap.put("date", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
                setMap(tempMap);
            }
        };
    }

    private List<FileOutConfig> getFileOutConfigForJava(String templatePath, String filePath, String classBodySuffix) {
        List<FileOutConfig> focList = new ArrayList<>();
        focList.add(new FileOutConfig(templatePath) {
            @Override
            public String outputFile(TableInfo tableInfo) {
                if (tableInfo instanceof TableInfoExpand) {
                    // 自定义输入文件名称
                    return projectPath + filePath + ((TableInfoExpand) tableInfo).getClassBodyName() + classBodySuffix + StringPool.DOT_JAVA;
                }
                return null;
            }
        });
        return focList;
    }

    private AutoGenerator copeAutoGenerator() {
        AutoGenerator autoGenerator = new AutoGenerator();
        BeanUtils.copyProperties(mpg, autoGenerator);
        return autoGenerator;
    }

    private String getClassBody(TableInfo tableInfo) {
        return NamingStrategy.capitalFirst(NamingStrategy.removePrefixAndCamel(tableInfo.getName(), strategy.getTablePrefix()));
    }

    private TableInfoExpand expandTableInfo(TableInfo tableInfo) {
        TableInfoExpand tableInfoExpand = new TableInfoExpand();
        tableInfoExpand.setName(tableInfo.getName());
        for (String importPackages : tableInfo.getImportPackages()) {
            tableInfoExpand.setImportPackages(importPackages);
        }
        tableInfoExpand.setCommonFields(tableInfo.getCommonFields());
        tableInfoExpand.setComment(tableInfo.getComment());
        tableInfoExpand.setEntityName(tableInfo.getEntityName());
        tableInfoExpand.setMapperName(tableInfo.getMapperName());
        tableInfoExpand.setXmlName(tableInfo.getXmlName());
        tableInfoExpand.setServiceName(tableInfo.getServiceName());
        tableInfoExpand.setServiceImplName(tableInfo.getServiceImplName());
        tableInfoExpand.setControllerName(tableInfo.getControllerName());
        tableInfoExpand.setFields(tableInfo.getFields());

        return tableInfoExpand;
    }

    private void retainKey(String key, Map<String, String> paramsMap) {
        String value = paramsMap.get(key);
        paramsMap.clear();
        if (key != null && value != null) {
            paramsMap.put(key, value);
        }
    }

//    private void generateCode(String[] tableName, String subPrefix, String author) {
//        init(tableName, subPrefix, author);
//        generateJava();
//        generateXml();
//    }
}
