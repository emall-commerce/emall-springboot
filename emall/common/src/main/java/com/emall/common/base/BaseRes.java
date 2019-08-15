package com.emall.common.base;

import lombok.Data;

/**
 * @Author: xiaobin
 * @Date: 2019/8/13 20:34
 * @Desc: 基础返回类
 */
@Data
public class BaseRes {

    /**
     * 返回编码
     */
    private String retCode;

    /**
     * 返回消息
     */
    private String retMsg;

    /**
     * 返回数据信息
     */
    private Object data;

    public BaseRes(Object data) {
        this.retCode = ReturnConstant.SUCCESS_CODE;
        this.retMsg = ReturnConstant.SUCCESS_MSG;
        this.data = data;
    }

    public BaseRes() {
        this.retCode = ReturnConstant.SUCCESS_CODE;
        this.retMsg = ReturnConstant.SUCCESS_MSG;
    }
}
