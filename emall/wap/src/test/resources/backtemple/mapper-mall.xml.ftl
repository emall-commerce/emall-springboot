<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="${package.Mapper}.${table.mapperName}">

    <!-- 通用查询映射结果 -->
    <resultMap id="ResultMap" type="${package.Entity}.${entity}">
<#list table.fields as field>
<#if field.keyFlag><#--生成主键排在第一位-->
        <id column="${field.name}" property="${field.propertyName ? uncap_first}" />
</#if>
</#list>
<#list table.commonFields as field><#--生成公共字段 -->
        <result column="${field.name}" property="${field.propertyName ? uncap_first}" />
</#list>
<#list table.fields as field>
<#if !field.keyFlag><#--生成普通字段 -->
        <result column="${field.name}" property="${field.propertyName ? uncap_first}" />
</#if>
</#list>
    </resultMap>

    <!-- 通用查询结果列 -->
    <sql id="columnList">
        <#list table.commonFields as field>${field.name}, </#list>${table.fieldNames}
    </sql>


    <!-- 获取列表信息 -->
    <select id="listByQuery" resultMap="ResultMap" parameterType="${table.Entity}" >
        SELECT <include refid="columnList" />
        FROM ${table.name}
        <where>
            1 = 1
            <include refid="query_sql" />
        </where>
    </select>

    <!-- 获取单个-->
    <select id="findByQuery" resultMap="ResultMap" parameterType="${table.Entity}" >
        SELECT <include refid="columnList" />
        FROM ${table.name}
        <where>
            1 = 1
            <include refid="query_sql" />
        </where>
        LIMIT 1
    </select>


    <!-- 根据查询条件获取分页信息 -->
    <select id="pageByQuery" resultMap="ResultMap" parameterType="${table.Entity}" >
        SELECT <include refid="columnList" />
        FROM ${table.name}
        <where>
            1 = 1
            <include refid="query_sql" />
        </where>
        LIMIT  0, 10
    </select>

    <!-- 根据查询条件获取总数量信息 -->
    <select id="totalCountByQuery" resultType="Integer" parameterType="${table.Entity}" >
        SELECT count(*)
        FROM ${table.name}
        <where>
            1 = 1
            <include refid="query_sql" />
        </where>
    </select>

    <!-- 根据查询条件SQL -->
    <sql id="query_sql" >
        <if test="${table.classBodyName?uncap_first}Id != null">AND id = ${r"#{"}${table.classBodyName?uncap_first}Id${r"}"}</if>
        <#list table.fields as field>
        <#if !field.keyFlag>
        <if test="${field.propertyName ? uncap_first} != null">AND ${field.name} = ${r"#{"}${field.propertyName ? uncap_first}${r"}"}</if>
        </#if>
        </#list>
    </sql>




</mapper>
