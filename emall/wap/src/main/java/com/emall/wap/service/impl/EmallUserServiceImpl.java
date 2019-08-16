package com.emall.wap.service.impl;

import com.emall.wap.entity.EmallUser;
import com.emall.wap.mapper.EmallUserMapper;
import com.emall.wap.service.EmallUserService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author xiaoxiao
 * @since 2019-08-15
 */
@Service
public class EmallUserServiceImpl extends ServiceImpl<EmallUserMapper, EmallUser> implements EmallUserService {

    @Autowired
    private EmallUserMapper emallUserMapper;

    public void getName(EmallUser req){
        boolean save = super.save(req);
        boolean update = super.updateById(req);
        boolean remove = super.removeById(req.getId());


    }
}
