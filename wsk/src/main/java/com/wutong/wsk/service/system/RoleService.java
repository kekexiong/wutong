package com.wutong.wsk.service.system;

import com.wutong.wsk.domain.system.Menu;
import com.wutong.wsk.domain.system.Role;
import com.wutong.wsk.mapper.system.RoleMapper;
import com.wutong.wsk.util.DateUtil;
import com.wutong.wsk.util.LoginUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * @author zhao_qg
 * @title RoleService
 * @date 20200228 18:40:05
 */
@Service
public class RoleService {

    private static final Logger LOGGER = LoggerFactory.getLogger(RoleService.class);

    @Autowired
    private RoleMapper roleMapper;

    /**
     * 根据条件查询
     *
     * @param map
     * @return
     * @author zhao_qg
     * @date 20200228 18:40:05
     */
    public List<Map<String, Object>> findByCondition(Map<String, Object> map) {
        return roleMapper.findByCondition(map);
    }


    /**
     * 根据条件查询
     *
     * @param map
     * @return
     * @author zhao_qg
     * @date 20200228 18:40:05
     */
    public List<Map<String, Object>> getTreeData(String scope) {
        String[] scopes = scope.split(",");
        return getTreeChildren(Arrays.asList(scopes), null, "root");
    }

    public List<Map<String, Object>> getTreeChildren(List<String> selectScope, String menuId, String type) {
        List<Map<String, Object>> treeDataList = new ArrayList<>();
        Menu menu = new Menu();
        menu.setParentId(menuId);
        menu.setType(type);
        List<Menu> list = roleMapper.getMenu(menu);
        list.forEach(data -> {
            Map<String, Object> tree = new HashMap<>();
            tree.put("id", data.getMenuId());
            tree.put("text", data.getMenuName());
            tree.put("type", data.getType());
            Map<String, Object> treeState = new HashMap<>();
            treeState.put("opened", true);
            treeState.put("disabled", 0);
            treeState.put("loaded", true);
            if (selectScope.contains(data.getMenuId())){
                treeState.put("selected", true);
            }else{
                treeState.put("selected", false);
            }
            tree.put("state", treeState);
            tree.put("li_attr", new ArrayList<>());
            tree.put("a_attr", new ArrayList<>());
            tree.put("children", getTreeChildren(selectScope, data.getMenuId(), ""));
            treeDataList.add(tree);
        });

        return treeDataList;
    }


    /**
     * 根据条件查询总数
     *
     * @param map
     * @return
     * @author zhao_qg
     * @date 20200228 18:40:05
     */
    public int findByConditionCount(Map<String, Object> map) {
        return roleMapper.findByConditionCount(map);
    }

    /**
     * 根据主键查询详细
     *
     * @param paramVo
     * @return
     * @author zhao_qg
     * @date 20200228 18:40:05
     */
    public Role getByKey(Role paramVo) {
        return roleMapper.getByKey(paramVo);
    }

    /**
     * 更新
     *
     * @param role
     * @return
     * @author zhao_qg
     * @date 20200228 18:40:05
     */
    public int update(Role role) {
        role.setUteUserNo(LoginUtils.getLoginName());
        role.setUteDt(DateUtil.getDate());
        return roleMapper.update(role);
    }

    /**
     * 插入
     *
     * @param role
     * @return
     * @author zhao_qg
     * @date 20200228 18:40:05
     */
    public int insert(Role role) {
        role.setCteUserNo(LoginUtils.getLoginName());
        role.setCteDt(DateUtil.getDate());
        return roleMapper.insert(role);
    }

    /**
     * 根据主键删除
     *
     * @param map
     * @return
     * @author zhao_qg
     * @date 20200228 18:40:05
     */
    public int delete(Map<String, Object> map) {
        return roleMapper.delete(map);
    }
}