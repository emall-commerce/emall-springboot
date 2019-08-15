import com.baomidou.mybatisplus.annotation.DbType;
import com.baomidou.mybatisplus.generator.AutoGenerator;
import com.baomidou.mybatisplus.generator.config.*;
import com.baomidou.mybatisplus.generator.config.rules.NamingStrategy;
import com.baomidou.mybatisplus.generator.engine.AbstractTemplateEngine;

import java.util.Map;

/**
 * @Author: xiaobin
 * @Date: 2019/8/14 20:07
 * @Desc: 代码生成工具类
 */
public class GenerateCode extends AbstractTemplateEngine {
    private static final String AUTHOR = "xiaoxiao";
    // 多张表使用逗号分隔
    private static final  String[]  tables = new String[]{"emall_user"};

    /**
     *
     * @Title: main
     * @Description: 生成
     * @param args
     */
    public static void main(String[] args) {
        AutoGenerator autoGenerator = new AutoGenerator();
        // 全局配置
        GlobalConfig globalConfig = new GlobalConfig();
        globalConfig.setOutputDir("emall\\wap\\src\\main\\java");//输出文件路径
        globalConfig.setFileOverride(true);
        globalConfig.setAuthor(AUTHOR);
        globalConfig.setFileOverride(true);
        globalConfig.setActiveRecord(false);// 不需要ActiveRecord特性的请改为false
        globalConfig.setEnableCache(false);// XML 二级缓存
        globalConfig.setBaseResultMap(true);// XML ResultMap
        globalConfig.setBaseColumnList(false);// XML columList
        // 自定义文件命名，注意 %s 会自动填充表实体属性！
        globalConfig.setControllerName("%sController");
        globalConfig.setServiceName("%sService");
        globalConfig.setServiceImplName("%sServiceImpl");
        globalConfig.setMapperName("%sMapper");
        globalConfig.setXmlName("%sMapper");
        globalConfig.setEntityName("%s");

        globalConfig.setOpen(false);
        autoGenerator.setGlobalConfig(globalConfig);

        // 数据源配置
        DataSourceConfig dataSourceConfig = new DataSourceConfig();
        dataSourceConfig.setDbType(DbType.MYSQL)
                .setUrl("jdbc:mysql://xiaoxia1.mysql.rds.aliyuncs.com:3306/emall_wap")
                .setDriverName("com.mysql.cj.jdbc.Driver")
                .setUsername("xiaoxiao")
                .setPassword("Java@2018");
        autoGenerator.setDataSource(dataSourceConfig);

        // 策略配置
        StrategyConfig strategyConfig = new StrategyConfig();
        strategyConfig.setNaming(NamingStrategy.underline_to_camel)// 表名生成策略
                .setInclude(tables) // 需要生成的表
                .setEntityLombokModel(false)
                .setEntityColumnConstant(true);


        autoGenerator.setStrategy(strategyConfig);

        // 模板配置
        TemplateConfig templateConfig = new TemplateConfig();
        templateConfig.setController("/templates/controller_mall.java");
        templateConfig.setMapper("/templates/mapper_mall.java");
        autoGenerator.setTemplate(templateConfig);

        // 包配置
        PackageConfig pc = new PackageConfig();
        pc.setParent("com.emall.wap");
        pc.setController("controller");
        pc.setService("service");
        pc.setServiceImpl("service.impl");
        pc.setMapper("mapper");
        pc.setEntity("entity");
        pc.setXml("mapper.xml");
        autoGenerator.setPackageInfo(pc);
        // 执行生成
        autoGenerator.execute();

    }

    @Override
    public void writer(Map<String, Object> objectMap, String templatePath, String outputFile) throws Exception {


    }

    @Override
    public String templateFilePath(String filePath) {
        return null;
    }


}
