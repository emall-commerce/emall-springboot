package ${package.ErrorCodeEnum};

import com.lxzl.skull.basic.errorcode.BaseErrorCode;

/**
 * <p>
 * ${table.comment!} 错误枚举类
 * </p>
 *
 * @author ${author}
 * @since ${cfg.date}
 */
public enum ${table.classBodyName}ErrorCodeEnum implements BaseErrorCode {
    /**
     * 错误枚举示例 --- ${table.classBodyName?upper_case}_000001
     */
    ${table.classBodyName?upper_case}_ERROR_CODE_ENUM("${table.classBodyName?upper_case}_000001", "错误枚举示例")
    ;
    ${table.classBodyName}ErrorCodeEnum(String code, String message) {
        this.code = code;
        this.message = message;
    }

    /**
     * 错误码
     */
    private String code;
    /**
     * 错误信息
     */
    private String message;

    @Override
    public String getCode() {
        return this.code;
    }

    @Override
    public String getMessage() {
        return this.message;
    }
}
