<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">

<mapper namespace="${mapperPackage}.${classNameD}Mapper">
    <resultMap id="${classNameX}Map" type="${domainPackage}.${classNameD}" >
     <#list tableCarrays as tableCarray>
     <result column="${tableCarray.columnName}" property="${tableCarray.columnNameX}"/>
    </#list>
    </resultMap>
    
    <sql id="whereQueryCondition">
        <where>
        <#list tableCarrays as tableCarray>
        <#if (tableCarray.queryType)?? && tableCarray.queryType == "01" && tableCarray.queryRule != "02">
            <if test="${classNameX}.${tableCarray.columnNameX}!= null<#if (tableCarray.dataType??) && (tableCarray.dataType != "Date")> and  ${classNameX}.${tableCarray.columnNameX}!= ''</#if>">
            <#if (tableCarray.isLike)?? && tableCarray.isLike == "01">
                and ${tableCarray.columnName} like '%${specific2}{${classNameX}.${tableCarray.columnNameX}}%'
            <#else>
                and ${tableCarray.columnName}=${specific}{${classNameX}.${tableCarray.columnNameX}}
            </#if>
            </if>
        </#if>
        <#if (tableCarray.queryType)?? && tableCarray.queryType == "01" && tableCarray.queryRule == "02">
            <if test="${classNameX}.${tableCarray.columnNameX}Start!= null">
                and ${tableCarray.columnName}&gt;=${specific}{${classNameX}.${tableCarray.columnNameX}Start}
            </if>
            <if test="${classNameX}.${tableCarray.columnNameX}End!= null">
                and ${tableCarray.columnName}&lt;=${specific}{${classNameX}.${tableCarray.columnNameX}End}
            </if>
        </#if>
        </#list>
        </where>
    </sql>
    
    <#if isQuery == "01">
    <select id="findByCondition" parameterType="java.util.Map" resultType="Map">
        <#--${stringCarrayNames7}-->
        SELECT
<#list tableCarrays as tableCarray>
    <#if (tableCarray.columnName??)>
        <#if (tableCarray.isAddColumnName??) && tableCarray.isAddColumnName == "0">
            t.${tableCarray.columnName} as "${tableCarray.columnNameX}"<#if (tableCarray_has_next)>,</#if>
        </#if>
        <#if (tableCarray.isAddColumnName??) && tableCarray.isAddColumnName == "1">
            '' as "${tableCarray.columnNameX}"<#if (tableCarray_has_next)>,</#if>
        </#if>
    </#if>
</#list>
            <!-- 请在此关联查询表 -->
            FROM <#if dbType = 'ORACLE'>${dbUser}.</#if>${tableName} t
            <include refid="whereQueryCondition"></include>
            ${stringCarrayNames8}
    </select>
    </#if>
    <#if isQuery == "01">
    <select id="findByConditionCount" parameterType="java.util.Map" resultType="java.lang.Integer">
        SELECT
            COUNT(*) 
        FROM <#if dbType = 'ORACLE'>${dbUser}.</#if>${tableName}
        <include refid="whereQueryCondition"></include>
    </select>
    </#if>
    <#if isQuery == "01">
    <select id="getByKey" parameterType="${domainPackage}.${classNameD}" resultMap="${classNameX}Map">
        SELECT
            ${stringCarrayNames3}
        FROM 
            <#if dbType = 'ORACLE'>${dbUser}.</#if>${tableName}
        WHERE
            ${primaryKey.columnName}=${specific}{${primaryKey.columnNameX}}
    </select>
    </#if>
   <#if isAdd == "01">
    <insert id="insert" parameterType="${domainPackage}.${classNameD}">
        INSERT INTO <#if dbType = 'ORACLE'>${dbUser}.</#if>${tableName} (
            <#list tableCarrays as tableCarray>
                <#if tableCarray.isAddColumnName == "0">
                ${tableCarray.columnName}<#if (tableCarray_has_next)>,</#if>
                </#if>
            </#list>
        ) VALUES (
            <#list tableCarrays as tableCarray>
                <#if tableCarray.isAddColumnName == "0">
                ${specific}{${tableCarray.columnNameX},jdbcType=VARCHAR}<#if (tableCarray_has_next)>,</#if>
                </#if>
            </#list>
        )
    </insert>
   </#if>
    <#if isImport == "01">
    <insert id="insertBatch" parameterType="java.util.List">
        INSERT INTO <#if dbType = 'ORACLE'>${dbUser}.</#if>${tableName}(
            <#list tableCarrays as tableCarray>
                <#if tableCarray.isAddColumnName == "0">
                    ${tableCarray.columnName}<#if (tableCarray_has_next)>,</#if>
                </#if>
            </#list>)
        <foreach collection="list" item="item" index="index" separator="union all">
            SELECT
            <#list tableCarrays as tableCarray>
                <#if tableCarray.isAddColumnName == "0">
                    ${specific}{item.${tableCarray.columnNameX},jdbcType=VARCHAR}<#if (tableCarray_has_next)>,</#if>
                </#if>
            </#list>
            FROM DUAL
        </foreach>
    </insert>
       </#if>
    <#if isUpdate=="01">
    <update id="update" parameterType="${domainPackage}.${classNameD}">
        UPDATE <#if dbType = 'ORACLE'>${dbUser}.</#if>${tableName}
        SET
        <#list updateCarrays as tableCarray>
            <#if (tableCarray.isPrimaryKey??) || (tableCarray.isPrimaryKey != "√")>
              <if test="${tableCarray.columnNameX}!= null<#if (tableCarray.dataType??) && (tableCarray.dataType != "Date")> and ${tableCarray.columnNameX}!= ''</#if>">
                  ${tableCarray.columnName}=${specific}{${tableCarray.columnNameX}}<#if (tableCarray_has_next)>,</#if>
              </if>
            </#if>
        </#list>
        WHERE
            ${primaryKey.columnName}=${specific}{${primaryKey.columnNameX}}
    </update>
    </#if>
    <#if isDetele=="01">
    <delete id="delete" parameterType="java.util.Map">
         delete from <#if dbType = 'ORACLE'>${dbUser}.</#if>${tableName}
         where
            ${primaryKey.columnName}
           in 
        <foreach item="item" index="index" collection="keys" open="(" separator="," close=")">
              ${specific}{item}
        </foreach>
    </delete>
    </#if>
    <#list tableCarrays as tableCarray>
    <#if (tableCarray.queryRule??) && tableCarray.queryRule == "05">
    <select id="get${tableCarray.columnNameD}" resultType="Map">
    <!-- 请在此处拼写查询sql 查询字段替代“”-->
        select "" as "${tableCarray.columnNameX}_Code",
               "" as "${tableCarray.columnNameX}_Name" 
        from T t
    </select>
        
    </#if>
    </#list>
</mapper>
