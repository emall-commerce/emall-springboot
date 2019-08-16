package com.emall.wap.controller;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.emall.common.base.BaseRes;
import com.emall.common.base.SqlConstant;
import com.emall.wap.entity.EmallUser;
import com.emall.wap.service.EmallUserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 *
 * @author xiaoxiao
 * @since 2019-08-15
 */
@RestController
@RequestMapping(value = "/emall_user")
@Slf4j
public class EmallUserController {

    @Autowired
    private EmallUserService targetService;


    /**
    * 分页查询数据
    *
    * @param req
    * @return
    */
    @ResponseBody
    @PostMapping("/page")
    public BaseRes pageList(IPage<EmallUser> req){
        return new BaseRes(targetService.page(req));
    }

    /**
    * 添加
    * @param req
    * @return BaseRes
    */
    @PostMapping(value = "/add")
    @ResponseBody
    public BaseRes add(@RequestBody EmallUser req){
        return new BaseRes(targetService.save(req));
    }

    /**
    * 修改
    * @param req
    * @return BaseRes
    */
    @PostMapping(value = "/modify")
    @ResponseBody
    public BaseRes modify(@RequestBody EmallUser req){
        return new BaseRes(targetService.updateById(req));
    }

    /**
    * 删除--修改状态
    * @param req
    * @return BaseRes
    */
    @PostMapping(value = "/deleted")
    @ResponseBody
    public BaseRes delete(@RequestBody EmallUser req){
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
    public BaseRes remove(@RequestBody EmallUser req){
        return new BaseRes(targetService.removeById(req.getId()));
    }

    /**
    * 获取单个
    * @param req
    * @return BaseRes
    */
    @PostMapping(value = "/get_one")
    @ResponseBody
    public BaseRes getOne(@RequestBody Wrapper<EmallUser> req){
        return new BaseRes(targetService.getOne(req));
    }


}