package com.wutong.wsk.mapper.system;
import java.util.*;
import java.util.Map;

import com.wutong.wsk.domain.system.Menu;
import com.wutong.wsk.domain.system.Role;
import com.wutong.wsk.mapper.system.RoleMapper;
import org.springframework.stereotype.Component;

/**
 * @title  RoleMapper
 * @author zhao_qg
 * @date   20200228 18:40:05
 */
@Component
public interface RoleMapper {
	
	/**
	 * 根据条件查询
	 * @author zhao_qg
 	 * @date   20200228 18:40:05
	 * @param map
	 * @return
	 */
	public List<Map<String, Object>> findByCondition(Map<String,Object> map);

	/**
	 * 根据条件查询
	 * @author zhao_qg
	 * @date   20200228 18:40:05
	 * @param map
	 * @return
	 */
	public List<Menu> getMenu(Menu menu);

	/**
	 * 根据条件查询总数
	 * @author zhao_qg
 	 * @date   20200228 18:40:05
	 * @param map
	 * @return
	 */
	public int findByConditionCount(Map<String,Object> map);
	/**
	 * 根据主键查询详细
	 * @author zhao_qg
 	 * @date   20200228 18:40:05
	 * @param paramVo
	 * @return
	 */
	public Role getByKey(Role paramVo); 
	
	/**
	 * 更新
	 * @author zhao_qg
 	 * @date   20200228 18:40:05
	 * @param role
	 * @return
	 */
	public int update(Role role);
	
	/**
	 * 插入
	 * @author zhao_qg
 	 * @date 20200228 18:40:05
	 * @param role
	 * @return
	 */	public int insert(Role role);
	 
	/**
	 * 根据主键删除
	 * @author zhao_qg
 	 * @date   20200228 18:40:05
	 * @param map
	 * @return
	 */
	public int delete(Map<String,Object> map);

}