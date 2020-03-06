<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="jp.groupsession.v2.usr.model.UsrLabelValueBean"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags/gsform" prefix="gsform" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="/WEB-INF/ctag-message.tld" prefix="gsmsg" %>
<%@ page import="jp.groupsession.v2.cmn.formmodel.UserGroupSelectModel"%>
<!-- 再描画用リクエストパラメータ -->
<bean:define id="usrgrpsel" name="UsrGrpSelDialogForm" property="usrgrpsel" type="UserGroupSelectModel" />
<gsform:usrgrpsel_dialogparams bean="<%=usrgrpsel %>" inDialog="in"></gsform:usrgrpsel_dialogparams>
<div>
<logic:notEqual value="<%=String.valueOf(UserGroupSelectModel.FLG_MULTI_OFF) %>"  name="usrgrpsel" property="multiFlg">
    <gsform:usrgrpselect name="UsrGrpSelDialogForm" property="usrgrpsel" size="15" onchange="$(this).parent().parent().usrgrpselect({cmd:'openDialog'});" ></gsform:usrgrpselect>
</logic:notEqual>
<logic:equal value="<%=String.valueOf(UserGroupSelectModel.FLG_MULTI_OFF) %>"  name="usrgrpsel" property="multiFlg">
    <gsform:grpselect name="UsrGrpSelDialogForm" property="usrgrpsel.group" onchange="$(this).parent().parent().usrgrpselect({cmd:'openDialog'});"></gsform:grpselect>
    <input type="hidden" name="<%="usrgrpsel.selected(" + UserGroupSelectModel.KEY_DEFAULT + ")" %>" value="<%=usrgrpsel.getSelectedSingle() %>" />
    <table class=" usersinglselect tl0" cellpadding="5" cellspacing="0" border="0" width="100%">
    <logic:notEmpty name="usrgrpsel" property="allList">
    <% String[] tdColors = {"td_type1", "td_type25_2"}; %>
    <% String checked = ""; %>
    <logic:iterate id="user" name="usrgrpsel" property="allList" indexId="idx" type="UsrLabelValueBean">
    <tr>
    <%
      checked = "";
      if (StringUtils.equals(usrgrpsel.getSelectedSingle(), user.getValue())) {
          checked = "checked " ;
      }
      String selectEv = "";
      selectEv += " $(this).parent().parent().parent().prev().val($(this).attr('value'));";
      selectEv += " $( this ).parents('.usrgrpsel_dialog').siblings('.ui-dialog-buttonpane').find('button:eq(0)').click();";

    %>
    <td align="left" class="<%= tdColors[idx.intValue() % 2] %> <%=checked %>" width="100%" onclick="<%=selectEv%>" value="<%=user.getValue()%>">
<%--
          <% if (user.getUseIconFlg() == UsrLabelValueBean.ICON_FLG_DEF) { %>
             <img  class="comment_Img" src="../user/images/photo.gif" name="userImage" alt="<gsmsg:write key="cmn.photo" />" border="1" style="max-width:25px; max-height:28px;" />
          <% } %>
          <% if (user.getUseIconFlg() == UsrLabelValueBean.ICON_FLG_NOTPUBLIC) { %>
             <div align="center" class="photo_hikokai4" style="display:inline-block;"><span style="color:#fc2929;"><gsmsg:write key="cmn.private" /></span></div>
          <% } %>
          <% if (user.getUseIconFlg() == UsrLabelValueBean.ICON_FLG_USE) { %>
             <img class="comment_Img" src="../common/cmn100.do?CMD=getImageFile&cmn100binSid=<bean:write name='user' property='iconBinSid' />" alt="<gsmsg:write key="cmn.photo" />" style="max-width:25px; max-height:28px;" />
          <% } %>
--%>
           <a href="javaScript:void(0);" >
           <span class="text_link2 <%=user.getCSSClassNameOption() %>"><bean:write name="user" property="label" /></span>
           </a>
    </td>
    </tr>
    </logic:iterate>

    </logic:notEmpty>
    </table>
</logic:equal>
</div>
