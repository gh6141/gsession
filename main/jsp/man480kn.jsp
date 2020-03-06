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
<title>[GroupSession] <gsmsg:write key="main.man460.1" /></title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script language="JavaScript" src="../common/js/cmd.js?<%= GSConst.VERSION_PARAM %>"></script>
<theme:css filename="theme.css"/>
<link rel=stylesheet href='../common/css/default.css?<%= GSConst.VERSION_PARAM %>' type='text/css'>
<link rel=stylesheet href='../main/css/main.css?<%= GSConst.VERSION_PARAM %>' type='text/css'>
</head>

<body class="body_03">

<html:form action="/main/man480kn">
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
    <td width="0%"><img src="../common/images/header_pset_01.gif" border="0" alt="<gsmsg:write key="cmn.preferences2" />"></td>
    <td width="0%" class="header_ktool_bg_text2" align="left" valign="middle" nowrap><span class="settei_ttl"><gsmsg:write key="cmn.preferences2" /></span></td>
    <td width="100%" class="header_ktool_bg_text2">[ <gsmsg:write key="main.man480kn.1" /> ]</td>
    <td width="0%"><img src="../common/images/header_ktool_05.gif" border="0" alt="<gsmsg:write key="cmn.preferences2" />"></td>
    </tr>
    </table>

    <table cellpadding="0" cellspacing="0" border="0" width="100%">
    <tr>
    <td width="50%"></td>
    <td width="0%"><img src="../common/images/header_glay_1.gif" border="0" alt=""></td>
    <td class="header_glay_bg" width="50%">
      <input type="button" name="btn_add" class="btn_base1" value="<gsmsg:write key="cmn.run" />" onClick="buttonPush('Man480kn_Import');">
      <input type="button" name="btn_back" class="btn_back_n1" value="<gsmsg:write key="cmn.back" />" onClick="buttonPush('Man480kn_Back');">
    </td>
    <td width="0%"><img src="../common/images/header_glay_3.gif" border="0" alt=""></td>
    </tr>
    </table>

    <img src="../common/images/spacer.gif" width="1px" height="10px" border="0">
    <logic:messagesPresent message="false"><html:errors /></logic:messagesPresent>
    <img src="../common/images/spacer.gif" width="1px" height="10px" border="0">

    <table cellpadding="3" cellspacing="0" border="0" width="100%" align="center">
    <tr>
    <td><span class="text_r1"><gsmsg:write key="cmn.capture.file.sure" /></span></td>
    </tr>
    </table>

    <!-- <gsmsg:write key="cmn.capture.file" /> -->
    <table cellpadding="5" cellspacing="0" border="0" width="100%" class="tl2" align="center">
    <tr>
    <td valign="middle" align="left" class="table_bg_A5B4E1" width="0%" nowrap>
      <span class="text_bb1"><gsmsg:write key="cmn.capture.file" /></span>
    </td>
    <td valign="middle" align="left" class="td_wt" width="100%">
      <span class="text_base">
        <logic:notEmpty name="man480knForm" property="man480FileLabelList">
        <logic:iterate name="man480knForm" property="man480FileLabelList" id="file">
            <bean:write name="file" property="label"/><br />
        </logic:iterate>
        </logic:notEmpty>

      </span>
    </td>
    </tr>

    <tr>
    <td valign="middle" align="left" class="table_bg_A5B4E1" width="0%" nowrap>
      <span class="text_bb1"><gsmsg:write key="cmn.capture.item.count" /></span>
    </td>
    <td valign="middle" align="left" class="td_wt" width="100%">
      <span class="text_base"><bean:write name="man480knForm" property="man480impCount" /><gsmsg:write key="cmn.number" /></span><br>
    </td>
    </tr>

    <%--登録対象プロジェクト --%>
    <tr>
    <td valign="middle" align="left" class="table_bg_A5B4E1" width="0%" nowrap>
      <span class="text_bb1"><gsmsg:write key="main.man480.2" /></span><span class="text_r2"><gsmsg:write key="cmn.comments" /></span>
    </td>

    <td valign="middle" align="left" class="td_wt" width="0%">
      <span class="text_base">
      <html:hidden name="man480knForm" property="man480mode"/>
      <!-- 新規プロジェクト作成 -->
      <logic:equal name="man480knForm" property="man480mode" value="<%=String.valueOf(jp.groupsession.v2.cmn.GSConst.CMDMODE_ADD)%>">
          <gsmsg:write key="main.man480.3" />
          <div class="padding_left10px">
            <span class="text_base text_bold"><gsmsg:write key="project.31" /></span>:<bean:write name="man480knForm" property="man480projectID"/>
            <html:hidden name="man480knForm" property="man480projectID"  /><br>
            <br>
            <span class="text_base text_bold"><gsmsg:write key="project.40" /></span>:<bean:write name="man480knForm" property="man480projectName"/>
            <html:hidden name="man480knForm" property="man480projectName" /><br>
            <br>
            <span class="text_base text_bold"><gsmsg:write key="project.41" /></span>:<bean:write name="man480knForm" property="man480projectShortName"/>
            <html:hidden name="man480knForm" property="man480projectShortName" /><br>
            <br>
            <span class="text_base text_bold"><gsmsg:write key="main.man480.5" /></span><br>
            <span class="text_base"><bean:write name="man480knForm" property="man480grpName" /></span><br>
          </div>
      </logic:equal>
      <!-- 登録済みプロジェクト -->
      <logic:equal name="man480knForm" property="man480mode" value="<%=String.valueOf(jp.groupsession.v2.cmn.GSConst.CMDMODE_EDIT) %>">
          <gsmsg:write key="main.man480.4" />
          <div class="padding_left10px">
            <!-- プロジェクト選択 -->
            <bean:define name="man480knForm" property="man480selectProject" id="selectPrj" />
            <logic:notEmpty name="man480knForm" property="man480projectLabelList">
            <logic:iterate name="man480knForm" property="man480projectLabelList" id="label">
              <logic:equal value="<%=String.valueOf(selectPrj) %>" name="label" property="value">
                <html:hidden name="man480knForm" property="man480selectProject"/>
                <bean:write name="label" property="label"/>
              </logic:equal>
            </logic:iterate>
            </logic:notEmpty>
            <div>
              <span class="text_base">※<gsmsg:write key="main.man480.7" /></span>
            </div>
          </div>
      </logic:equal>
      </span>
    </td>
    </tr>

    <%--進捗設定 --%>
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
        <logic:notEmpty name="man480knForm" property="man480svStatusLabelList">
          <logic:iterate name="man480knForm" property="man480svStatusLabelList" id="statusLabel" indexId="idx">
            <tr class="padding_bottom3px">
              <td class="alignLeft"><bean:write name="statusLabel" property="label"/></td>
              <td class="alignRight" >
                <bean:write name="statusLabel" property="value"/>%
              </td>
            </tr>
          </logic:iterate>
        </logic:notEmpty>
        <logic:notEmpty name="man480knForm" property="man480statusNames">
          <logic:iterate name="man480knForm" property="man480statusNames" id="statusName" indexId="idx">
            <tr class="padding_bottom3px">
              <td class="alignLeft"><bean:write name="statusName" /></td>
              <td class="alignRight" >
                <html:hidden name="man480knForm" property="<%=\"man480statusValue(\" + idx + \")\" %>" />
                <bean:write name="man480knForm" property="<%=\"man480statusValue(\" + idx + \")\" %>" />%
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

    </table>

    <img src="../common/images/spacer.gif" width="1px" height="10px" border="0">

    <table width="100%">
    <tr>
    <td width="100%" align="right" cellpadding="5" cellspacing="0">
      <input type="button" name="btn_add" class="btn_base1" value="<gsmsg:write key="cmn.run" />" onClick="buttonPush('Man480kn_Import');">
      <input type="button" name="btn_back" class="btn_back_n1" value="<gsmsg:write key="cmn.back" />" onClick="buttonPush('Man480kn_Back');">
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