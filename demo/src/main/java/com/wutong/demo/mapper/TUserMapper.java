package com.wutong.demo.mapper;
import java.util.*;
import java.util.Map;
import com.wutong.demo.domain.TUser;
import com.wutong.demo.mapper.TUserMapper;
import org.springframework.stereotype.Component;

/**
 * @title  TUserMapper
 * @author zhao_qg
 * @date   20200213 20:56:33
 */
@Component
public interface TUserMapper {
	
	/**
	 * 根据条件查询
	 * @author zhao_qg
 	 * @date   20200213 20:56:33
	 * @param map
	 * @return
	 */
	public List<Map<String, Object>> findByCondition(Map<String,Object> map);
	/**
	 * 根据条件查询总数
	 * @author zhao_qg
 	 * @date   20200213 20:56:33
	 * @param map
	 * @return
	 */
	public int findByConditionCount(Map<String,Object> map);
	/**
	 * 根据主键查询详细
	 * @author zhao_qg
 	 * @date   20200213 20:56:33
	 * @param paramVo
	 * @return
	 */
	public TUser getByKey(TUser paramVo); 
	
	/**
	 * 更新
	 * @author zhao_qg
 	 * @date   20200213 20:56:33
	 * @param tUser
	 * @return
	 */
	public int update(TUser tUser);
	
	/**
	 * 插入
	 * @author zhao_qg
 	 * @date 20200213 20:56:33
	 * @param tUser
	 * @return
	 */	public int insert(TUser tUser);
	 
	/**
	 * 根据主键删除
	 * @author zhao_qg
 	 * @date   20200213 20:56:33
	 * @param map
	 * @return
	 */
	public int delete(Map<String,Object> map);
	/**
	 * 批量插入
	 * @author zhao_qg
 	 * @date   20200213 20:56:33
	 * @param map
	 * @return
	 */
	public int insertBatch(List<TUser> list);

}