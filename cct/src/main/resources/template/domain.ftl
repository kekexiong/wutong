package ${domainPackage};
<#list domainImportPackageList as importPackage>
import ${importPackage};
</#list>
import lombok.Data;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * @description ${classNameD}domain
 * @author ${classAuthor}
 * @date ${classTime}
 */
@Data
public class ${classNameD} {
<#list tableCarrays as tableCarray>
    /**
     * <#if tableCarray.comments??>${tableCarray.comments}</#if>
     */
    <#if (tableCarray.queryType)?? && tableCarray.queryType == "01" && tableCarray.queryRule == "02">
    private ${tableCarray.dataType} ${tableCarray.columnNameX}Start;
    private ${tableCarray.dataType} ${tableCarray.columnNameX}End;
    private ${tableCarray.dataType} ${tableCarray.columnNameX};
    <#else>
    private ${tableCarray.dataType} ${tableCarray.columnNameX};
    </#if>
</#list>
    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this, ToStringStyle.SHORT_PREFIX_STYLE);
    }
}
