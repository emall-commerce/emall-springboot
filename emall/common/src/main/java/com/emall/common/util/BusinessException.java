package com.emall.common.util;

import lombok.AllArgsConstructor;

/**
 * @Author: xiaobin
 * @Date: 2019/8/15 15:15
 * @Desc:
 */
@AllArgsConstructor
public class BusinessException extends RuntimeException {
    /**
     * 返回编码
     */
    private String retCode;

    /**
     * 返回消息
     */
    private String retMsg;

    public String getRetCode() {
        return retCode;
    }

    public void setRetCode(String retCode) {
        this.retCode = retCode;
    }

    public String getRetMsg() {
        return retMsg;
    }

    public void setRetMsg(String retMsg) {
        this.retMsg = retMsg;
    }
}
