package com.wutong.cct.util;

import com.wutong.cct.domain.TableDomain;
import com.wutong.cct.domain.TableItem;

import java.util.ArrayList;
import java.util.List;



public class TableUtil {

	public static final List<TableDomain> getTables(TableDomain tableDomain, List<TableItem> itemList) throws Exception {
		List<TableDomain> tables = new ArrayList<TableDomain>();
			String stringCarrayNames1 = "";
			String stringCarrayNames2 = "";
			String stringCarrayNames3 = "";
			String stringCarrayNames4 = "";
			String stringCarrayNames5 = "";
			String stringCarrayNames6 = "";
			for (TableItem item : itemList) {
				if (!"".endsWith(stringCarrayNames1)) {
					stringCarrayNames1 += ", ";
				}
				if (!"".endsWith(stringCarrayNames2)) {
					stringCarrayNames2 += ", ";
				}
				if (!"".endsWith(stringCarrayNames3) && !"1".equals(item.getIsAddColumnName())) {
					stringCarrayNames3 += ", ";
				}
				if (!"".endsWith(stringCarrayNames4)) {
					stringCarrayNames4 += ", ";
				}
				/*
				 * if (!"".endsWith(stringCarrayNames5)) { stringCarrayNames5 +=
				 * ", "; }
				 */
				stringCarrayNames1 += item.getColumnName();
				stringCarrayNames2 += item.getDataType() + " " + item.getColumnName();
				if(!"1".equals(item.getIsAddColumnName())){
					stringCarrayNames3 += item.getColumnName();
				}
				stringCarrayNames4 += String.format("#{%s}", item.getColumnName());
				stringCarrayNames5 += "<if test=" + '\"' +  item.getColumnNameX()+ "!= null and "+ item.getColumnNameX()+ "!= ''"+ '\"'+ ">" 
						+ String.format("%s=#{%s}", item.getColumnName(), item.getColumnNameX())  + "</if>";
				stringCarrayNames6 += "<if test=" + '\"' +  item.getColumnNameX()+ "!= null and "+ item.getColumnNameX()+ "!= '"+ '\"' 
						+ String.format("%s=#{%s}", item.getColumnName(), item.getColumnNameX()) + ""
						+ "</isNotEmpty>";
			}
			tableDomain.setStringCarrayNames1(stringCarrayNames1);
			tableDomain.setStringCarrayNames2(stringCarrayNames2);
			tableDomain.setStringCarrayNames3(stringCarrayNames3);
			tableDomain.setStringCarrayNames4(stringCarrayNames4);
			tableDomain.setStringCarrayNames5(stringCarrayNames5);
			tableDomain.setStringCarrayNames6(stringCarrayNames6);
			tableDomain.setStringCarrayNames7("select * from(select a.*,rownum rn from(");//<!-- 分页前缀  --> 
			//tableDomain.setStringCarrayNames8(") a where rownum &lt;= #{endRow}) where rn &gt;#{startRow}");//<!-- 分页后缀  -->	oracle
			tableDomain.setStringCarrayNames8("limit #{startRow}, #{endRow}");//<!-- 分页后缀  -->

		return tables;
	}
}
