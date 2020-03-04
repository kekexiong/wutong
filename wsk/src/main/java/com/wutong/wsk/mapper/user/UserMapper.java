package com.wutong.wsk.mapper.user;
import java.util.*;
import java.util.Map;
import com.wutong.wsk.domain.user.User;
import com.wutong.wsk.mapper.user.UserMapper;
import org.springframework.stereotype.Component;

/**
 * @title  UserMapper
 * @author zhao_qg
 * @date   20200304 16:30:35
 */
@Component
public interface UserMapper {
	
	/**
	 * 根据条件查询
	 * @author zhao_qg
 	 * @date   20200304 16:30:35
	 * @param map
	 * @return
	 */
	public List<Map<String, Object>> findByCondition(Map<String,Object> map);
	/**
	 * 根据条件查询总数
	 * @author zhao_qg
 	 * @date   20200304 16:30:35
	 * @param map
	 * @return
	 */
	public int findByConditionCount(Map<String,Object> map);
	/**
	 * 根据主键查询详细
	 * @author zhao_qg
 	 * @date   20200304 16:30:35
	 * @param paramVo
	 * @return
	 */
	public User getByKey(User paramVo); 
	
	/**
	 * 更新
	 * @author zhao_qg
 	 * @date   20200304 16:30:35
	 * @param user
	 * @return
	 */
	public int update(User user);
	
	/**
	 * 插入
	 * @author zhao_qg
 	 * @date 20200304 16:30:35
	 * @param user
	 * @return
	 */	public int insert(User user);
	 
	/**
	 * 根据主键删除
	 * @author zhao_qg
 	 * @date   20200304 16:30:35
	 * @param map
	 * @return
	 */
	public int delete(Map<String,Object> map);

}