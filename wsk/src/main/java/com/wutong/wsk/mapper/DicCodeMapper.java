package com.wutong.wsk.mapper;
import java.util.*;
import java.util.Map;
import com.wutong.wsk.domain.DicCode;
import com.wutong.wsk.mapper.DicCodeMapper;
import org.springframework.stereotype.Component;

/**
 * @title  DicCodeMapper
 * @author zhao_qg
 * @date   20200218 20:14:06
 */
@Component
public interface DicCodeMapper {
	
	/**
	 * 根据条件查询
	 * @author zhao_qg
 	 * @date   20200218 20:14:06
	 * @param map
	 * @return
	 */
	public List<Map<String, Object>> findByCondition(Map<String,Object> map);
	/**
	 * 根据条件查询总数
	 * @author zhao_qg
 	 * @date   20200218 20:14:06
	 * @param map
	 * @return
	 */
	public int findByConditionCount(Map<String,Object> map);
	/**
	 * 根据主键查询详细
	 * @author zhao_qg
 	 * @date   20200218 20:14:06
	 * @param paramVo
	 * @return
	 */
	public DicCode getByKey(DicCode paramVo); 
	
	/**
	 * 更新
	 * @author zhao_qg
 	 * @date   20200218 20:14:06
	 * @param dicCode
	 * @return
	 */
	public int update(DicCode dicCode);
	
	/**
	 * 插入
	 * @author zhao_qg
 	 * @date 20200218 20:14:06
	 * @param dicCode
	 * @return
	 */	public int insert(DicCode dicCode);
	 
	/**
	 * 根据主键删除
	 * @author zhao_qg
 	 * @date   20200218 20:14:06
	 * @param map
	 * @return
	 */
	public int delete(Map<String,Object> map);

}