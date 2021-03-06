<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="/WEB-INF/ctag-css.tld" prefix="theme" %>
<%@ taglib uri="/WEB-INF/ctag-message.tld" prefix="gsmsg" %>

<%@ page import="jp.groupsession.v2.cmn.GSConst" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<% String key = jp.groupsession.v2.cmn.GSConst.SESSION_KEY; %>

<html:html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script language="JavaScript" src="../common/js/cmd.js?<%= GSConst.VERSION_PARAM %>"></script>
<theme:css filename="theme.css"/>
<link rel=stylesheet href='../common/css/default.css?<%= GSConst.VERSION_PARAM %>' type='text/css'>
<link rel=stylesheet href='../user/css/user.css?<%= GSConst.VERSION_PARAM %>' type='text/css'>
<title>[GroupSession] <gsmsg:write key="user.usr060.1" /></title>
</head>

<body class="body_03">
<html:form action="/user/usr061">
<input type="hidden" name="CMD" value="dsp">

<%@ include file="/WEB-INF/plugin/common/jsp/header001.jsp" %>
<!-- BODY -->
<table width="100%" cellpadding="5" cellspacing="0">
<tr>
<td  width="100%" align="center">
  <table width="70%"  cellpadding="0" cellspacing="0">
  <tr>
  <td align="left">
    <table cellpadding="0" cellspacing="0" border="0"  width="100%" >
    <tr>
    <td width="0%" ><img src="../common/images/header_pset_01.gif" border="0" alt="<gsmsg:write key="cmn.admin.setting" />"></td>
    <td width="0%" class="header_ktool_bg_text2 " align="left" valign="middle" nowrap><span class="settei_ttl"><gsmsg:write key="cmn.admin.setting" /></span></td>
    <td width="100%" class="header_ktool_bg_text2 ">[ <gsmsg:write key="user.usr060.1" /> ]</td>
    <td width="0%"><img src="../common/images/header_ktool_05.gif" border="0" alt="<gsmsg:write key="cmn.admin.setting" />"></td>
    </tr>
    </table>

    <table width="100%" cellpadding="0" cellspacing="0" border="0" >
    <tr>
    <td width="50%" ></td>
    <td width="0%" ><img src="../common/images/header_glay_1.gif" border="0" alt=""></td>
    <td width="50%" class="header_glay_bg" >
      <button type="button" class="btn_ok1" value="OK" onClick="return buttonPush('usr061Ok');">OK</button>
      <button type="button" class="btn_back_n1" value="<gsmsg:write key="cmn.back" />" onClick="return buttonPush('usr061Back');"><gsmsg:write key="cmn.back" /></button>
    <td class="width0"><img src="../common/images/header_glay_3.gif" border="0" alt=""></td>
    </tr>
    </table>

    <div class="spacer margin_top10px" />
    <logic:messagesPresent message="false"><html:errors /></logic:messagesPresent>
    <div class="spacer margin_top10px" />


    <table cellpadding="5" cellspacing="0" border="0" width="100%" class="tl_u2">
    <%-- ワンタイムパスワード通知先メールアドレス --%>
    <tr>
    <th width="0%" valign="middle" align="left" class="table_bg_A5B4E1"  nowrap>
      <span class="text_bb1"><gsmsg:write key="user.usr060.4" /></span><span class="text_r2">※</span>
    </th>
    <td width="100%" valign="middle" align="left" class="td_wt"  colspan="5">
        <html:text name="usr061Form" property="usr060SendToAddress" styleClass="width350px" maxlength="256"/>
    </td>
    </tr>
    </table>

    <div class="spacer margin_top10px" />

    <table width="100%"  cellpadding="5" cellspacing="0">
    <tr>
    <td width="100%"  align="right">
      <button type="button" class="btn_ok1" value="OK" onClick="return buttonPush('usr061Ok');">OK</button>
      <button type="button" class="btn_back_n1" value="<gsmsg:write key="cmn.back" />" onClick="return buttonPush('usr061Back');"><gsmsg:write key="cmn.back" /></button>
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