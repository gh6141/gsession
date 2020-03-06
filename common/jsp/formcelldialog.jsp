<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags/formbuilder" prefix="fb" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ page import="jp.groupsession.v2.cmn.GSConst" %>

<script language="JavaScript" src="../common/js/formdialog_prefarence.js?<%= GSConst.VERSION_PARAM %>"></script>
<script>
$(function() {
    <logic:equal parameter="CMD" value="dialogSubmit">
    <logic:messagesNotPresent message="false">
    $('#form_dialog').data('submitClose')();
    </logic:messagesNotPresent>
    </logic:equal>
});

</script>
<script language="JavaScript" src="../common/js/cmn110.js?<%= GSConst.VERSION_PARAM %>"></script>
<logic:messagesPresent message="false">
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr><td align="left"><html:errors/><br></td></tr>
</table>
</logic:messagesPresent>
<fb:form_prefarence name="FormCellDialogForm" property="cell"></fb:form_prefarence>
