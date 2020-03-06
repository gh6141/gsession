<%@page import="jp.groupsession.v2.cmn.GSConstApi"%>
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
<title>[GroupSession] <gsmsg:write key="api.1" />&nbsp;<gsmsg:write key="api.api020.1" /><gsmsg:write key="cmn.check" /></title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script language="JavaScript" src="../common/js/cmd.js?<%= GSConst.VERSION_PARAM %>"></script>
<theme:css filename="theme.css"/>
<link rel=stylesheet href='../common/css/default.css?<%= GSConst.VERSION_PARAM %>' type='text/css'>
<link rel=stylesheet href='../api/css/api.css?<%= GSConst.VERSION_PARAM %>' type='text/css'>

</head>

<body class="body_03">
<html:form action="/api/api020">
<input type="hidden" name="CMD" value="dsp">
<html:hidden property="backScreen" />


<%@ include file="/WEB-INF/plugin/common/jsp/header001.jsp" %>

<!--　BODY -->
<table width="100%" cellpadding="5" cellspacing="0">
<tr>
<td width="100%" align="center">

  <table width="70%" cellpadding="0" cellspacing="0">
  <tr>
  <td align="left">

    <!-- タイトル -->
    <table cellpadding="0" cellspacing="0" border="0" width="100%">
    <tr>
    <td width="0%"><img src="../common/images/header_ktool_01.gif" border="0" alt="<gsmsg:write key="cmn.admin.setting" />"></td>
    <td width="0%" class="header_ktool_bg_text2" align="left" valign="middle" nowrap><span class="settei_ttl"><gsmsg:write key="cmn.admin.setting" /></span></td>
    <td width="100%" class="header_ktool_bg_text2">[ <gsmsg:write key="api.1" />&nbsp;<gsmsg:write key="api.api020.1" /> ]</td>
    <td width="0%"><img src="../common/images/header_ktool_05.gif" border="0" alt="<gsmsg:write key="cmn.admin.setting" />"></td>
    </tr>
    </table>

    <table width="100%" cellpadding="0" cellspacing="0" border="0" >
    <tr>
    <td width="50%" ></td>
    <td width="0%" ><img src="../common/images/header_glay_1.gif" border="0" alt=""></td>
    <td width="50%" class="header_glay_bg" >
      <input type="button" class="btn_ok1" value="OK" onClick="return buttonPush('api020Ok');">
      <input type="button" class="btn_back_n1" value="<gsmsg:write key="cmn.back" />" onClick="return buttonPush('api020Back');">
    <td width="0%"><img src="../common/images/header_glay_3.gif" border="0" alt=""></td>
    </tr>
    </table>

    <div class="spacer margin_top10px" />
    <logic:messagesPresent message="false"><html:errors /></logic:messagesPresent>
    <div class="spacer margin_top10px" />


    <table cellpadding="5" cellspacing="0" border="0" width="100%" class="tl_u2">
    <%-- トークン認証 --%>
    <tr>
    <th width="0%" valign="middle" align="left" class="table_bg_A5B4E1"  nowrap>
      <span class="text_bb1"><gsmsg:write key="api.api020.3" /></span>
    </th>
    <td width="100%" valign="middle" align="left" class="td_wt"  colspan="5"><span class="text_base">
      <div><gsmsg:write key="api.api020.4"/></div>
      <div><gsmsg:write key="api.api020.5"/></div>
      <div class="text_r2"><gsmsg:write key="api.api020.6"/></div>
      <div class="padding_bottom10px"><gsmsg:write key="api.api020.7"/></div>
      <div class="padding_bottom10px">
      <logic:equal name="api020Form" property="api020useOtp" value="true">
      <html:radio name="api020Form" property="api020useToken" styleId="api020useToken_0" value="<%= String.valueOf(GSConstApi.USEKBN_AUTH_NOUSE) %>" onchange="buttonPush('dsp');" disabled="true"/>
        <label for="api020useToken_0"><span class="mukouser "><gsmsg:write key="api.api020.8" /></span></label>
      </logic:equal>
      <logic:notEqual name="api020Form" property="api020useOtp" value="true">
      <html:radio name="api020Form" property="api020useToken" styleId="api020useToken_0" value="<%= String.valueOf(GSConstApi.USEKBN_AUTH_NOUSE) %>" onchange="buttonPush('dsp');"/>
        <label for="api020useToken_0"><gsmsg:write key="api.api020.8" /></label>
      </logic:notEqual>

      <html:radio name="api020Form" property="api020useToken" styleId="api020useToken_1" value="<%= String.valueOf(GSConstApi.USEKBN_AUTH_USE) %>"  onchange="buttonPush('dsp');"/>
        <label for="api020useToken_1"><gsmsg:write key="api.api020.9" /></label>
      <html:radio name="api020Form" property="api020useToken" styleId="api020useToken_2" value="<%= String.valueOf(GSConstApi.USEKBN_AUTH_USEIP) %>"  onchange="buttonPush('dsp');"/>
        <label for="api020useToken_2"><gsmsg:write key="api.api020.10" /></label>
      </div>
      <bean:define id="nonDsp" value="" />
      <logic:notEqual name="api020Form" property="api020useToken" value="<%= String.valueOf(GSConstApi.USEKBN_AUTH_USEIP)%>">
        <bean:define id="nonDsp" value="nonDsp" />
      </logic:notEqual>
      <div class="padding_bottom10px <bean:write name="nonDsp"/>">
        <html:textarea name="api020Form" property="api020tokenIpArea" style="width:500px;" rows="6"/>
        <div class="text_r2"><gsmsg:write key="main.man430.7" /></div>
        <div class="text_r2"><gsmsg:write key="main.man430.8" /></div>
      </div>
      <bean:define id="nonDsp" value="" />
      <logic:equal name="api020Form" property="api020useToken" value="<%= String.valueOf(GSConstApi.USEKBN_AUTH_NOUSE)%>">
        <bean:define id="nonDsp" value="nonDsp" />
      </logic:equal>
      <div class="padding_bottom10px <bean:write name="nonDsp"/>">
         <gsmsg:write key="api.api020.11"/>:
         <html:select name="api020Form" property="api020tokenLimit">
            <html:optionsCollection name="api020Form" property="api020tokenLimitOption" />
         </html:select>
      </div>
    </td>
    </tr>
    <%-- ベーシック認証 --%>
    <tr>
    <th width="0%" valign="middle" align="left" class="table_bg_A5B4E1" nowrap>
      <span class="text_bb1"><gsmsg:write key="api.api020.12" /></span>
    </th>
    <td width="100%" valign="middle" align="left" class="td_wt"  colspan="5"><span class="text_base">
      <div><gsmsg:write key="api.api020.13"/></div>
      <div><gsmsg:write key="api.api020.14"/></div>
      <div class="padding_bottom10px"><gsmsg:write key="api.api020.15"/></div>
      <div class="padding_bottom10px">
      <html:radio name="api020Form" property="api020useBasic" styleId="api020useBasic_0" value="<%= String.valueOf(GSConstApi.USEKBN_AUTH_NOUSE) %>" onchange="buttonPush('dsp');"/>
        <label for="api020useBasic_0"><gsmsg:write key="api.api020.8" /></label>
      <logic:equal name="api020Form" property="api020useOtp" value="true">
      <html:radio name="api020Form" property="api020useBasic" styleId="api020useBasic_1" value="<%= String.valueOf(GSConstApi.USEKBN_AUTH_USE) %>"  onchange="buttonPush('dsp');" disabled="true"/>
        <label for="api020useBasic_1"><span class="mukouser"><gsmsg:write key="api.api020.9" /></span></label>
      </logic:equal>
      <logic:notEqual name="api020Form" property="api020useOtp" value="true">
      <html:radio name="api020Form" property="api020useBasic" styleId="api020useBasic_1" value="<%= String.valueOf(GSConstApi.USEKBN_AUTH_USE) %>"  onchange="buttonPush('dsp');"/>
        <label for="api020useBasic_1"><gsmsg:write key="api.api020.9" /></label>
      </logic:notEqual>
      <html:radio name="api020Form" property="api020useBasic" styleId="api020useBasic_2" value="<%= String.valueOf(GSConstApi.USEKBN_AUTH_USEIP) %>"  onchange="buttonPush('dsp');"/>
        <label for="api020useBasic_2"><gsmsg:write key="api.api020.10" /></label>
      </div>
      <bean:define id="nonDsp" value="" />
      <logic:notEqual name="api020Form" property="api020useBasic" value="<%= String.valueOf(GSConstApi.USEKBN_AUTH_USEIP)%>">
        <bean:define id="nonDsp" value="nonDsp" />
      </logic:notEqual>

      <div class="padding_bottom10px <bean:write name="nonDsp"/>">
        <html:textarea name="api020Form" property="api020basicIpArea" style="width:500px;" rows="6"/>
        <div class="text_r2"><gsmsg:write key="main.man430.7" /></div>
        <div class="text_r2"><gsmsg:write key="main.man430.8" /></div>
      </div>
    </span>
    </td>
    </tr>
    </table>

    <div class="spacer margin_top10px" />

    <table width="100%"  cellpadding="5" cellspacing="0">
    <tr>
    <td width="100%"  align="right">
      <input type="button" class="btn_ok1" value="OK" onClick="return buttonPush('api020Ok');">
      <input type="button" class="btn_back_n1" value="<gsmsg:write key="cmn.back" />" onClick="return buttonPush('api020Back');">
    </td>
    </tr>
    </table>
  </td>
  </tr>
  </table>
</td>
</tr>
</table>


<%@ include file="/WEB-INF/plugin/common/jsp/footer001.jsp" %>
</html:form>
</body>
</html:html>