package ${domainPackage};
<#list domainImportPackageList as importPackage>
import ${importPackage};
</#list>
import lombok.Data;

/**
 * @description  ${classNameD}domain
 * @author ${classAuthor}
 * @date   ${classTime}
 * @review ${reviewAuthor}/${reviewDate}
 */
@Data
public class ${classNameD} {
<#list tableCarrays as tableCarray>
    /**
     * <#if tableCarray.comments??>${tableCarray.comments}</#if>
     */
    <#if (tableCarray.queryType)?? && tableCarray.queryType == "01" && tableCarray.queryRule == "02">
    private ${tableCarray.dataType} ${tableCarray.columnNameX}beginDt;
    private ${tableCarray.dataType} ${tableCarray.columnNameX}endDt;
    private ${tableCarray.dataType} ${tableCarray.columnNameX};
    <#else>
    private ${tableCarray.dataType} ${tableCarray.columnNameX};
    </#if>
</#list>
}
