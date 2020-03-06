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
<title>[GroupSession] <gsmsg:write key="main.man470.1" /></title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script language="JavaScript" src="../common/js/cmn110.js?<%= GSConst.VERSION_PARAM %>"></script>
<script language="JavaScript" src="../common/js/cmd.js?<%= GSConst.VERSION_PARAM %>"></script>
<theme:css filename="theme.css"/>
<link rel=stylesheet href='../common/css/default.css?<%= GSConst.VERSION_PARAM %>' type='text/css'>
<link rel=stylesheet href='../main/css/main.css?<%= GSConst.VERSION_PARAM %>' type='text/css'>
<link rel=stylesheet href='../main/css/cybouzu.css?<%= GSConst.VERSION_PARAM %>' type='text/css'>
</head>

<body class="body_03" onunload="windowClose();">

<html:form action="/main/man470">
<input type="hidden" name="CMD" value="">
<html:hidden property="man440GrpSid"/>

<!-- BODY -->
<table width="100%">
<tr>
<td width="100%" align="center" cellpadding="5" cellspacing="0">
  <table width="70%" cellpadding="0" cellspacing="0">
  <tr>
  <td align="left">
    <table cellpadding="0" cellspacing="0" border="0" width="100%">
    <tr>
    <td width="0%"><img src="../common/images/header_ktool_01.gif" border="0" alt="<gsmsg:write key="cmn.admin.setting" />"></td>
    <td width="0%" class="header_ktool_bg_text2" align="left" valign="middle" nowrap><span class="settei_ttl"><gsmsg:write key="cmn.admin.setting" /></span></td>
    <td width="100%" class="header_ktool_bg_text2">[ <gsmsg:write key="main.man470.1" /> ]</td>
    <td width="0%"><img src="../common/images/header_ktool_05.gif" border="0" alt="<gsmsg:write key="cmn.admin.setting" />"></td>
    </tr>
    </table>

    <table cellpadding="0" cellspacing="0" border="0" width="100%">
    <tr>
    <td width="50%"></td>
    <td width="0%"><img src="../common/images/header_glay_1.gif" border="0" alt=""></td>
    <td class="header_glay_bg" width="50%">
      <input type="button" name="btn_add" class="btn_base1" value="<gsmsg:write key="cmn.import" />" onClick="buttonPush('Man470_Import');">
      <input type="button" name="btn_back" class="btn_back_n1" value="<gsmsg:write key="cmn.back" />" onClick="buttonPush('Man470_Back');">
    </td>
    <td width="0%"><img src="../common/images/header_glay_3.gif" border="0" alt=""></td>
    </tr>
    </table>

    <img src="../common/images/spacer.gif" width="1px" height="10px" border="0">
    <html:errors />
    <img src="../common/images/spacer.gif" width="1px" height="10px" border="0">

    <div class="attention_textbox">
        <p class="attention_title text_bold"><gsmsg:write key="main.man440.1" /></p>
        <ul class="text_base">
            <li><gsmsg:write key="main.man470.11" /></li>
            <li><gsmsg:write key="main.man470.12" /></li>
            <li><gsmsg:write key="main.man470.13" /></li>
            <li><gsmsg:write key="main.man470.14" /></li>
            <li><gsmsg:write key="main.man470.15" /></li>
        </ul>
    </div>
    <img src="../common/images/spacer.gif" border="0" height="10px" width="1px" />

    <table cellpadding="5" cellspacing="0" border="0" width="100%" class="tl_u2">
    <tr>
    <td valign="middle" align="left" class="table_bg_A5B4E1" width="0%" nowrap>
      <span class="text_bb1"><gsmsg:write key="main.man450.2" /></span><span class="text_r2"><gsmsg:write key="cmn.comments" /></span>
    </td>
    <td valign="middle" align="left" class="td_wt" width="0%">

      <input type="button" class="btn_attach" value="<gsmsg:write key="cmn.attached" />" name="attacheBtn" onClick="opnTemp('man470selectFiles', '<bean:write name="man470Form" property="man470pluginId" />', '1', '0');">
      &nbsp;<input type="button" class="btn_delete" value="<gsmsg:write key="cmn.delete" />" name="dellBtn" onClick="buttonPush('delete');"><br>
      <html:select property="man470selectFiles" styleClass="select01" multiple="false" size="1">
        <html:optionsCollection name="man470Form" property="man470FileLabelList" value="value" label="label" />
      </html:select>
    </td>
    </tr>

    <tr>
    <td valign="middle" align="left" class="table_bg_A5B4E1" nowrap>
      <!-- 登録対象フォーラム -->
      <span class="text_bb1"><gsmsg:write key="main.man470.2" /></span><span class="text_r2"><gsmsg:write key="cmn.comments" /></span>
    </td>
    <td valign="middle" align="left" class="td_wt">
      <!-- 新規フォーラム作成 -->
      <html:radio name="man470Form" property="man470mode" value="<%= String.valueOf(jp.groupsession.v2.cmn.GSConst.CMDMODE_ADD) %>" styleId="mode1"/><label for="mode1" class="text_base"><gsmsg:write key="main.man470.3" /></label><br>
      <div>
        <span class="text_base text_bold"><gsmsg:write key="bbs.4" /></span><br>
        <html:text property="man470forumName" style="width:333px;" maxlength="70" /><br>
        <br>
        <span class="text_base text_bold"><gsmsg:write key="main.man470.5" /></span><br>
        <span class="text_base"><bean:write name="man470Form" property="man470grpName" /></span><br>
      </div>
      <br/>
      <!-- 登録済みフォーラム -->
      <html:radio name="man470Form" property="man470mode" value="<%= String.valueOf(jp.groupsession.v2.cmn.GSConst.CMDMODE_EDIT) %>" styleId="mode2"/><label for="mode2" class="text_base"><gsmsg:write key="main.man470.4" /></label>
      <div>
        <!-- フォーラム選択 -->
        <html:select property="man470forumSid" styleClass="select02">
          <html:optionsCollection name="man470Form" property="man470forumLabelList" value="value" label="label" />
        </html:select>
      </div>
    </td>
    </tr>

    </table>

    <img src="../common/images/spacer.gif" width="1px" height="10px" border="0">

    <table width="100%">
    <tr>
    <td width="100%" align="right" cellpadding="5" cellspacing="0">
      <input type="button" name="btn_add" class="btn_base1" value="<gsmsg:write key="cmn.import" />" onClick="buttonPush('Man470_Import');">
      <input type="button" name="btn_back" class="btn_back_n1" value="<gsmsg:write key="cmn.back" />" onClick="buttonPush('Man470_Back');">
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