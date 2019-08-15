package com.emall.common.util;

import org.apache.commons.lang.StringUtils;

/**
 * @ClassName : DqBaseUtils
 * @Description : 基础工具类
 * @date 2017年12月6日 下午1:46:43
 */
public class BaseUtil {
    /**
     * <p>
     * 判断obj是否为空，为空返回true
     * </p>
     *
     * @param obj
     * @return true 对象为空
     * @author daiqi
     * @date 2017年12月6日 下午1:47:50
     */
    public static boolean isNull(Object obj) {
        if (obj == null) {
            return true;
        }
        if (obj instanceof  String){
            return StringUtils.isBlank(String.valueOf(obj));
        }
        return false;
    }

    /**
     * <p>
     * 判断obj是否不为空
     * </p>
     *
     * @param obj
     * @return
     * @author daiqi
     * @date 2017年12月6日 下午1:48:38
     */
    public static boolean isNotNull(Object obj) {
        return !isNull(obj);
    }




    /**
     * <p>
     * 比较两个对象是否相等、若为原始类型与包装类型比较则将原始类型放第二个参数
     * </p>
     *
     * @param obj1
     * @param obj2
     * @return
     * @author daiqi 创建时间 2018年2月7日 下午7:52:56
     */
    public static boolean equals(Object obj1, Object obj2) {
        if (isNull(obj1) || isNull(obj2)) {
            return false;
        }
        if (obj1.equals(obj2)) {
            return true;
        }
        return false;
    }

}
