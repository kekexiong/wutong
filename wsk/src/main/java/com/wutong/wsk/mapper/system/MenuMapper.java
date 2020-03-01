package com.wutong.wsk.mapper.system;
import java.util.*;
import java.util.Map;
import com.wutong.wsk.domain.system.Menu;
import com.wutong.wsk.mapper.system.MenuMapper;
import org.springframework.stereotype.Component;

/**
 * @title  MenuMapper
 * @author zhao_qg
 * @date   20200229 21:33:58
 */
@Component
public interface MenuMapper {
	
	/**
	 * 根据条件查询
	 * @author zhao_qg
 	 * @date   20200229 21:33:58
	 * @param map
	 * @return
	 */
	public List<Map<String, Object>> findByCondition(Map<String,Object> map);
	/**
	 * 根据条件查询总数
	 * @author zhao_qg
 	 * @date   20200229 21:33:58
	 * @param map
	 * @return
	 */
	public int findByConditionCount(Map<String,Object> map);
	/**
	 * 根据主键查询详细
	 * @author zhao_qg
 	 * @date   20200229 21:33:58
	 * @param paramVo
	 * @return
	 */
	public Menu getByKey(Menu paramVo); 
	
	/**
	 * 更新
	 * @author zhao_qg
 	 * @date   20200229 21:33:58
	 * @param menu
	 * @return
	 */
	public int update(Menu menu);
	
	/**
	 * 插入
	 * @author zhao_qg
 	 * @date 20200229 21:33:58
	 * @param menu
	 * @return
	 */	public int insert(Menu menu);
	 
	/**
	 * 根据主键删除
	 * @author zhao_qg
 	 * @date   20200229 21:33:58
	 * @param map
	 * @return
	 */
	public int delete(Map<String,Object> map);

}