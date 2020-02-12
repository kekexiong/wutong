package ${mapperPackage};
import java.util.*;
import java.util.Map;
import ${domainPackage}.${classNameD};
import ${mapperPackage}.${classNameD}Mapper;
import org.springframework.stereotype.Component;

/**
 * @title  ${classNameD}Mapper
 * @author ${classAuthor}
 * @date   ${classTime}
 */
@Component
public interface ${classNameD}Mapper {
	
	<#list tableCarrays as tableCarray>
	<#if (tableCarray.queryRule??) && tableCarray.queryRule == "05">
	/**
	 * @description: 获取付款类型字段
	 * @return map
	 * @author ${classAuthor}
	 * @data ${classTime}
	 */
	public List<Map<String, Object>> get${tableCarray.columnNameD}();
	</#if>
	</#list>
	<#if isQuery == "01">
	/**
	 * 根据条件查询
	 * @author ${classAuthor}
 	 * @date   ${classTime}
	 * @param map
	 * @return
	 */
	public List<Map<String, Object>> findByCondition(Map<String,Object> map);
	</#if>
	<#if isQuery == "01">
	/**
	 * 根据条件查询总数
	 * @author ${classAuthor}
 	 * @date   ${classTime}
	 * @param map
	 * @return
	 */
	public int findByConditionCount(Map<String,Object> map);
	</#if>
	<#if isQuery == "01">
	/**
	 * 根据主键查询详细
	 * @author ${classAuthor}
 	 * @date   ${classTime}
	 * @param paramVo
	 * @return
	 */
	public ${classNameD} getByKey(${classNameD} paramVo); 
	</#if>
	
	<#if isUpdate=="01">
	/**
	 * 更新
	 * @author ${classAuthor}
 	 * @date   ${classTime}
	 * @param ${classNameX}
	 * @return
	 */
	public int update(${classNameD} ${classNameX});
	</#if>
	
	<#if isAdd == "01">
	/**
	 * 插入
	 * @author ${classAuthor}
 	 * @date ${classTime}
	 * @param ${classNameX}
	 * @return
	 */	public int insert(${classNameD} ${classNameX});
	 </#if>
	 
	 <#if isDetele=="01">
	/**
	 * 根据主键删除
	 * @author ${classAuthor}
 	 * @date   ${classTime}
	 * @param map
	 * @return
	 */
	public int delete(Map<String,Object> map);
	</#if>
	<#if isImport=="01">
	/**
	 * 批量插入
	 * @author ${classAuthor}
 	 * @date   ${classTime}
	 * @param map
	 * @return
	 */
	public int insertBatch(List<${classNameD}> list);
	</#if>

}