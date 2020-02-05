package com.wutong.cct.mapper;

import com.wutong.cct.domain.TableDomain;
import com.wutong.cct.domain.TableItem;
import org.springframework.stereotype.Component;

import java.util.List;


@Component
public interface TableMapper {
	List<TableItem> getTableItem(TableDomain param);
	List<TableItem> getTableItemForMysql(TableDomain param);
}
