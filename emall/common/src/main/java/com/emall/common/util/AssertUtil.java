package com.emall.common.util;

import com.emall.common.base.ReturnConstant;

/**
 * @Author: xiaobin
 * @Date: 2019/8/15 15:11
 * @Desc: 断言类 可用作参数校验
 */
public class AssertUtil {
    public static void verifyObjNull(Object obj, String msg) {
        if (BaseUtil.isNull(obj)) {
            throw new BusinessException(ReturnConstant.FAIL_CODE, msg);
        }
    }
}
