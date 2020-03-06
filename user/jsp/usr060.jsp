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
<logic:equal name="usr060Form" property="usr060AddMode" value="true">
<title>[GroupSession] <gsmsg:write key="user.usr060.3" /></title>
</logic:equal>
<logic:notEqual name="usr060Form" property="usr060AddMode" value="true">
<title>[GroupSession] <gsmsg:write key="user.usr060.1" /></title>
</logic:notEqual>
</head>

<body class="body_03">
<html:form action="/user/usr060">
<input type="hidden" name="CMD" value="dsp">
<html:hidden property="url" />
<html:hidden name="usr060Form" property="usr060Token" />
<html:hidden name="usr060Form" property="usr060otpSended" />
<html:hidden name="usr060Form" property="usr060AddMode" />

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
    <td width="0%" ><img src="../common/images/header_pset_01.gif" border="0" alt="<gsmsg:write key="cmn.preferences2" />"></td>
    <logic:equal name="usr060Form" property="usr060AddMode" value="true">
    <td width="0%" class="header_ktool_bg_text2" align="left" valign="middle" nowrap></td>
    <td width="100%" class="header_ktool_bg_text2 "><span class="settei_ttl"><gsmsg:write key="user.usr060.3" /></span></td>
    </logic:equal>
    <logic:notEqual name="usr060Form" property="usr060AddMode" value="true">
    <td width="0%" class="header_ktool_bg_text2 " align="left" valign="middle" nowrap><span class="settei_ttl"><gsmsg:write key="cmn.preferences2" /></span></td>
    <td width="100%" class="header_ktool_bg_text2 ">[ <gsmsg:write key="user.usr060.1" /> ]</td>
    </logic:notEqual>
    <td width="0%"><img src="../common/images/header_ktool_05.gif" border="0" alt="<gsmsg:write key="cmn.preferences2" />"></td>
    </tr>
    </table>

    <table width="100%" cellpadding="0" cellspacing="0" border="0" >
    <tr>
    <td width="50%" ></td>
    <td width="0%" ><img src="../common/images/header_glay_1.gif" border="0" alt=""></td>
    <td width="50%" class="header_glay_bg" >
    <logic:equal name="usr060Form" property="usr060otpSended" value="true">
      <button type="button" class="btn_ok1" value="OK" onClick="return buttonPush('usr060Ok');">OK</button>
    </logic:equal>
    <logic:notEqual name="usr060Form" property="usr060otpSended" value="true">
      <button type="button" class="btn_ok1 mukouser" value="OK" onClick="return buttonPush('usr060Ok');" disabled="disabled">OK</button>
    </logic:notEqual>
      <button type="button" class="btn_back_n1" value="<gsmsg:write key="cmn.back" />" onClick="return buttonPush('usr060Back');"><gsmsg:write key="cmn.back" /></button>
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
    <td width="100%" valign="middle" align="left" class="td_wt " colspan="5">
      <logic:notEqual name="usr060Form" property="usr060otpSended" value="true">
        <html:text name="usr060Form" property="usr060SendToAddress" styleClass="width350px" maxlength="256"/>
        <button type="submit" name="usr060SendOtp" value="usr060SendOtp" class="btn_base0 valignTop" ><img style="margin-top: -3px;margin-left:-3px; "  alt="mail" src="../user/images/mail_eml_icon.gif"><span class="valignTop"><gsmsg:write key="user.usr060.7" /></span></button>
        <button type="submit" name="usr060Reenter" value="usr060Reenter" class="btn_base1 valignTop nonDsp" ><gsmsg:write key="anp.reenter" /></button>
      </logic:notEqual>
      <logic:equal name="usr060Form" property="usr060otpSended" value="true">
        <html:text name="usr060Form" property="usr060SendToAddress" styleClass="width350px" maxlength="256" disabled="true"/>
        <button  type="submit" name="usr060SendOtp" value="usr060SendOtp" class="btn_base0 valignTop nonDsp"><img style="margin-top: -3px;margin-left:-3px; " alt="mail" src="../user/images/mail_eml_icon.gif"><span class="valignTop"><gsmsg:write key="user.usr060.7" /></span></button>
        <button  type="submit" name="usr060Reenter" value="usr060Reenter" class="btn_base1 valignTop " ><gsmsg:write key="anp.reenter" /></button>
      </logic:equal>
    </td>
    </tr>
    <%-- ワンタイムパスワード --%>
    <tr>
    <th width="0%" valign="middle" align="left" class="table_bg_A5B4E1" nowrap>
      <span class="text_bb1"><gsmsg:write key="user.usr060.5" /></span><span class="text_r2">※</span>
    </th>
    <td width="100%" valign="middle" align="left" class="td_wt"  colspan="5">
      <logic:notEqual name="usr060Form" property="usr060otpSended" value="true">
      <html:password name="usr060Form" property="usr060KakuninPass" maxlength="4" disabled="true"/>
      </logic:notEqual>
      <logic:equal name="usr060Form" property="usr060otpSended" value="true">
      <html:password name="usr060Form" property="usr060KakuninPass" maxlength="4" />
      </logic:equal>
    </td>
    </tr>
    </table>

    <div class="spacer margin_top10px" />

    <table width="100%"  cellpadding="5" cellspacing="0">
    <tr>
    <td width="100%"  align="right">
    <logic:equal name="usr060Form" property="usr060otpSended" value="true">
      <button type="button" class="btn_ok1" value="OK" onClick="return buttonPush('usr060Ok');">OK</button>
    </logic:equal>
    <logic:notEqual name="usr060Form" property="usr060otpSended" value="true">
      <button type="button" class="btn_ok1 mukouser" value="OK" onClick="return buttonPush('usr060Ok');" disabled="disabled">OK</button>
    </logic:notEqual>
      <button type="button" class="btn_back_n1" value="<gsmsg:write key="cmn.back" />" onClick="return buttonPush('usr060Back');"><gsmsg:write key="cmn.back" /></button>
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