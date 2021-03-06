package ${package.Controller};

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.emall.common.base.BaseRes;
import com.emall.common.base.SqlConstant;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import ${package.Service}.${table.serviceName};
import ${package.Entity}.${entity};

/**
 *
 * @author ${author}
 * @since ${date}
 */
@RestController
@RequestMapping(value = "/${table.name}")
public class ${table.controllerName} {

    @Autowired
    private ${table.serviceName} targetService;

    /**
    * 分页查询数据
    *
    * @param req
    * @return
    */
    @ResponseBody
    @PostMapping("/page")
    public BaseRes pageList(@RequestBody IPage<${entity}> req){
        return new BaseRes(targetService.page(req));
    }

    /**
    * 添加
    * @param req
    * @return BaseRes
    */
    @PostMapping(value = "/add")
    @ResponseBody
    public BaseRes add(@RequestBody ${entity} req){
        return new BaseRes(targetService.save(req));
    }

    /**
    * 修改
    * @param req
    * @return BaseRes
    */
    @PostMapping(value = "/modify")
    @ResponseBody
    public BaseRes modify(@RequestBody ${entity} req){
        return new BaseRes(targetService.updateById(req));
    }

    /**
    * 删除--修改状态
    * @param req
    * @return BaseRes
    */
    @PostMapping(value = "/deleted")
    @ResponseBody
    public BaseRes delete(@RequestBody ${entity} req){
        req.setDeleteFlag(SqlConstant.YES);
        req.setStatusFlag(SqlConstant.NO);
        return new BaseRes(targetService.updateById(req));
    }

    /**
    * 删除
    * @param req
    * @return BaseRes
    */
    @PostMapping(value = "/remove")
    @ResponseBody
    public BaseRes remove(@RequestBody ${entity} req){
        return new BaseRes(targetService.removeById(req.getId()));
    }

    /**
    * 获取单个
    * @param req
    * @return BaseRes
    */
    @PostMapping(value = "/get_one")
    @ResponseBody
    public BaseRes getOne(@RequestBody Wrapper<${entity}> req){
        return new BaseRes(targetService.getOne(req));
    }

}