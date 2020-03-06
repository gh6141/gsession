<%@page import="jp.groupsession.v2.prj.GSConstProject"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="/WEB-INF/ctag-css.tld" prefix="theme" %>
<%@ taglib uri="/WEB-INF/ctag-message.tld" prefix="gsmsg" %>

<%@ page import="jp.groupsession.v2.cmn.GSConst" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html:html>
<head>
<title>[GroupSession] <gsmsg:write key="main.man480.1" /></title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script language="JavaScript" src='../common/js/jquery-1.5.2.min.js?<%= GSConst.VERSION_PARAM %>'></script>
<script language="JavaScript" src="../common/js/cmn110.js?<%= GSConst.VERSION_PARAM %>"></script>
<script language="JavaScript" src="../common/js/cmd.js?<%= GSConst.VERSION_PARAM %>"></script>
<theme:css filename="theme.css"/>
<link rel=stylesheet href='../common/css/default.css?<%= GSConst.VERSION_PARAM %>' type='text/css'>
<link rel=stylesheet href='../main/css/main.css?<%= GSConst.VERSION_PARAM %>' type='text/css'>
<link rel=stylesheet href='../main/css/cybouzu.css?<%= GSConst.VERSION_PARAM %>' type='text/css'>
</head>

<body class="body_03" onunload="windowClose();">
<bean:parameter id="scrollY" name="man480scrollY" value="0"/>
<logic:greaterThan name="scrollY" value="0">
<script>
   $(function () {
       $(window).scrollTop(<bean:write name="scrollY" />);
   })
</script>
</logic:greaterThan>
<html:form action="/main/man480">
<input type="hidden" name="CMD" value="">
<html:hidden property="man440GrpSid"/>
<html:hidden property="man480scrollY" value=""/>

<!-- BODY -->
<table width="100%">
<tr>
<td width="100%" align="center" cellpadding="5" cellspacing="0">
  <table width="70%" cellpadding="0" cellspacing="0">
  <tr>
  <td align="left">

    <table cellpadding="0" cellspacing="0" border="0" width="100%">
    <tr>




    <td width="0%"><img src="../common/images/header_pset_01.gif" border="0" alt="<gsmsg:write key="cmn.preferences2" />"></td>
    <td width="0%" class="header_ktool_bg_text2" align="left" valign="middle" nowrap><span class="settei_ttl"><gsmsg:write key="cmn.preferences2" /></span></td>
    <td width="100%" class="header_ktool_bg_text2">[ <gsmsg:write key="main.man480.1" /> ]</td>
    <td width="0%"><img src="../common/images/header_ktool_05.gif" border="0" alt="<gsmsg:write key="cmn.preferences2" />"></td>
    </tr>
    </table>

    <table cellpadding="0" cellspacing="0" border="0" width="100%">
    <tr>
    <td width="50%"></td>
    <td width="0%"><img src="../common/images/header_glay_1.gif" border="0" alt=""></td>
    <td class="header_glay_bg" width="50%">
      <input type="button" name="btn_add" class="btn_base1" value="<gsmsg:write key="cmn.import" />" onClick="buttonPush('Man480_Import');">
      <input type="button" name="btn_back" class="btn_back_n1" value="<gsmsg:write key="cmn.back" />" onClick="buttonPush('Man480_Back');">
    </td>
    <td width="0%"><img src="../common/images/header_glay_3.gif" border="0" alt=""></td>
    </tr>
    </table>

    <div class="margin_top10px" />
    <html:errors />
    <div class="margin_top10px" />
    <div class="attention_textbox">
        <p class="attention_title text_bold"><gsmsg:write key="main.man440.1" /></p>
        <ul class="text_base">
            <li><gsmsg:write key="main.man480.9" /></li>
            <li><gsmsg:write key="main.man480.10" /></li>
            <li><gsmsg:write key="main.man480.11" /></li>
            <li><gsmsg:write key="main.man480.12" /></li>
            <li><gsmsg:write key="main.man480.13" /></li>
        </ul>
    </div>
    <div class="margin_top10px" />

    <table cellpadding="5" cellspacing="0" border="0" width="100%" class="tl_u2">
    <tr>
    <td valign="middle" align="left" class="table_bg_A5B4E1" width="0%" nowrap>
      <span class="text_bb1"><gsmsg:write key="main.man450.2" /></span><span class="text_r2"><gsmsg:write key="cmn.comments" /></span>
    </td>

    <td valign="middle" align="left" class="td_wt" width="0%">
      <input type="button" class="btn_attach" value="<gsmsg:write key="cmn.attached" />" name="attacheBtn" onClick="opnTemp('man480selectFiles', '<%=GSConst.PLUGINID_MAIN%>', '1', '0');">
      &nbsp;<input type="button" class="btn_delete" value="<gsmsg:write key="cmn.delete" />" name="dellBtn" onClick="buttonPush('delete');"><br>
      <html:select name="man480Form" property="man480selectFiles" styleClass="select01" multiple="false" size="1">
        <logic:notEmpty name="man480Form" property="man480FileLabelList">
        <html:optionsCollection name="man480Form" property="man480FileLabelList" value="value" label="label" />
        </logic:notEmpty>
      </html:select>
    </td>
    </tr>
    <%--登録対象プロジェクト --%>
    <tr>
    <td valign="middle" align="left" class="table_bg_A5B4E1" width="0%" nowrap>
      <span class="text_bb1"><gsmsg:write key="main.man480.2" /></span><span class="text_r2"><gsmsg:write key="cmn.comments" /></span>
    </td>

    <td valign="middle" align="left" class="td_wt" width="0%">
      <!-- 新規プロジェクト作成 -->
      <html:radio name="man480Form" property="man480mode" value="<%= String.valueOf(jp.groupsession.v2.cmn.GSConst.CMDMODE_ADD) %>" styleId="mode1" onchange="document.man480Form.man480scrollY.value = $(window).scrollTop();buttonPush('dsp');" /><label for="mode1" class="text_base"><gsmsg:write key="main.man480.3" /></label><br>
      <div class="padding_left10px">
        <span class="text_base text_bold"><gsmsg:write key="project.31" /></span><br />
        <html:text property="man480projectID" styleClass="width300px" maxlength="<%=String.valueOf(GSConstProject.MAX_LENGTH_PRJ_ID) %>" /><br>
        <br>
        <span class="text_base text_bold"><gsmsg:write key="project.40" /></span><br>
        <html:text property="man480projectName" styleClass="width500px" maxlength="<%=String.valueOf(GSConstProject.MAX_LENGTH_PRJ_NAME) %>" /><br>
        <br>
        <span class="text_base text_bold"><gsmsg:write key="project.41" /></span><br />
        <html:text property="man480projectShortName" styleClass="width500px" maxlength="<%=String.valueOf(GSConstProject.MAX_LENGTH_PRJ_SHORT_NAME) %>" /><br>
        <br>
        <span class="text_base text_bold"><gsmsg:write key="main.man480.5" /></span><br>
        <span class="text_base"><bean:write name="man480Form" property="man480grpName" /></span><br>
      </div>
      <br/>
      <!-- 登録済みプロジェクト -->
      <html:radio name="man480Form" property="man480mode" value="<%= String.valueOf(jp.groupsession.v2.cmn.GSConst.CMDMODE_EDIT) %>" styleId="mode2" onchange="document.man480Form.man480scrollY.value = $(window).scrollTop();buttonPush('dsp');" /><label for="mode2" class="text_base"><gsmsg:write key="main.man480.4" /></label>
      <div class="padding_left10px">
        <!-- プロジェクト選択 -->
        <html:select property="man480selectProject" styleClass="select02" onchange="document.man480Form.man480scrollY.value = $(window).scrollTop();buttonPush('dsp');">
          <logic:notEmpty name="man480Form" property="man480projectLabelList">
            <html:optionsCollection name="man480Form" property="man480projectLabelList" value="value" label="label" />
          </logic:notEmpty>
        </html:select>
        <div>
          <span class="text_base">※<gsmsg:write key="main.man480.7" /></span>
        </div>
      </div>
    </td>
    </tr>

    <%--進捗設定 --%>
    <logic:equal name="man480Form" property="man480fileOk" value="true">
    <tr>
    <td valign="middle" align="left" class="table_bg_A5B4E1" width="0%" nowrap>
      <span class="text_bb1"><gsmsg:write key="main.man480.6" /></span><span class="text_r2"><gsmsg:write key="cmn.comments" /></span>
    </td>

    <td valign="middle" align="left" class="td_wt" width="0%">
      <div>
        <span class="text_base">※<gsmsg:write key="main.man480.8" /></span>
      </div>
      <table>
        <tr class="padding_bottom3px">
          <td class="alignLeft">未着手</td>
          <td class="alignRight" >0%</td>
        </tr>
        <logic:notEmpty name="man480Form" property="man480svStatusLabelList">
          <logic:iterate name="man480Form" property="man480svStatusLabelList" id="statusLabel" indexId="idx">
            <tr class="padding_bottom3px">
              <td class="alignLeft"><bean:write name="statusLabel" property="label"/></td>
              <td class="alignRight" >
                <bean:write name="statusLabel" property="value"/>%
              </td>
            </tr>
          </logic:iterate>
        </logic:notEmpty>
        <logic:notEmpty name="man480Form" property="man480statusNames">
          <logic:iterate name="man480Form" property="man480statusNames" id="statusName" indexId="idx">
            <tr class="padding_bottom3px">
              <td class="alignLeft"><bean:write name="statusName" /></td>
              <td class="alignRight" >
                <html:text styleClass="width50" maxlength="<%=String.valueOf(GSConstProject.MAX_LENGTH_RATE) %>"
                    name="man480Form" property="<%=\"man480statusValue(\" + idx + \")\" %>" />%
              </td>
            </tr>
          </logic:iterate>
        </logic:notEmpty>
        <tr class="padding_bottom3px">
          <td class="alignLeft">完了</td>
          <td class="alignRight" >100%</td>
        </tr>
      </table>
    </td>
    </tr>
    </logic:equal>


    </table>

    <div class="margin_top10px" />

    <table width="100%">
    <tr>
    <td width="100%" align="right" cellpadding="5" cellspacing="0">
      <input type="button" name="btn_add" class="btn_base1" value="<gsmsg:write key="cmn.import" />" onClick="buttonPush('Man480_Import');">
      <input type="button" name="btn_back" class="btn_back_n1" value="<gsmsg:write key="cmn.back" />" onClick="buttonPush('Man480_Back');">
    </td>
    </tr>
    </table>
  </td>
  </tr>
  </table>
</td>
</tr>
</table>


</html:form>

<%@ include file="/WEB-INF/plugin/common/jsp/footer001.jsp" %>
</body>
</html:html>