    <%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="/WEB-INF/ctag-css.tld" prefix="theme" %>
<%@ taglib uri="/WEB-INF/ctag-message.tld" prefix="gsmsg" %>
<%@ taglib uri="/WEB-INF/ctag-css.tld" prefix="theme" %>
<%@ taglib tagdir="/WEB-INF/tags/gsform" prefix="gsform" %>

<%@ page import="jp.groupsession.v2.cmn.GSConst" %>
<%@ page import="jp.groupsession.v2.cmn.GSConstApi"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html:html>
<head>
<title>[GroupSession] <gsmsg:write key="main.man510.1" />
</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script language="JavaScript" src="../common/js/cmd.js?<%= GSConst.VERSION_PARAM %>"></script>
<script language="JavaScript" src='../common/js/jquery-1.5.2.min.js?<%= GSConst.VERSION_PARAM %>'></script>
<script language="JavaScript" src="../common/js/userpopup.js?<%= GSConst.VERSION_PARAM %>"></script>
<script language="JavaScript" src="../common/js/grouppopup.js?<%= GSConst.VERSION_PARAM %>"></script>
<script language="JavaScript" src='./js/man510.js?<%= GSConst.VERSION_PARAM %>'></script>
<theme:css filename="theme.css"/>
<link rel=stylesheet href='../common/css/default.css?<%= GSConst.VERSION_PARAM %>' type='text/css'>
<link rel=stylesheet href='./css/main.css?<%= GSConst.VERSION_PARAM %>' type='text/css'>
</head>

<body class="body_03">
<html:form action="/main/man510">

<input type="hidden" name="CMD" value="">
<input type="hidden" name="scrollY" value="">

<% String scrollYStr = request.getParameter("scrollY"); %>
<% if (scrollYStr != null) {%>
<script><!--

    $(function () {
        $(window).scrollTop(<%=scrollYStr%>);
    });

--></script>
<% } %>
<%@ include file="/WEB-INF/plugin/common/jsp/header001.jsp" %>

<table width="100%">
<tr>
<td width="100%" align="center">

  <table width="70%" class="tl0">
  <tr>
  <td align="left">

    <!-- タイトル -->
    <table cellpadding="0" cellspacing="0" border="0" width="100%">
    <tr>
    <td width="0%"><img src="../common/images/header_ktool_01.gif" border="0" alt="<gsmsg:write key="cmn.admin.setting" />"></td>
    <td width="0%" class="header_ktool_bg_text2" align="left" valign="middle" nowrap><span class="settei_ttl"><gsmsg:write key="cmn.admin.setting" /></span></td>
    <td width="100%" class="header_ktool_bg_text2">[<gsmsg:write key="main.man510.1" /> ]</td>
    <td width="0%"><img src="../common/images/header_ktool_05.gif" border="0" alt="<gsmsg:write key="cmn.admin.setting" />"></td>
    </tr>
    </table>

    <table cellpadding="0" cellspacing="0" border="0" class="width100">
    <tr>
    <td width="50%"></td>
    <td width="0%"><img src="../common/images/header_glay_1.gif" border="0" alt=""></td>
    <td width="50%" class="header_glay_bg " >
      <button type="button" value="OK" class="btn_ok1" onclick="buttonPush('man510Ok');">OK</button>
      <button type="button" class="btn_back_n3" value="<gsmsg:write key="cmn.back.admin.setting" />" onClick="buttonPush('man510Back');"><gsmsg:write key="cmn.back.admin.setting" /></button>
    <td width="0%"><img src="../common/images/header_glay_3.gif" border="0" alt=""></td>
    </tr>
    </table>

  </td>
  </tr>

  <tr>
  <td>
    <logic:messagesPresent message="false"><html:errors /></logic:messagesPresent>
    <div class="spacer margin_top10px" />
  </td>
  </tr>

  <tr>
  <td>
    <table width="100%"cellpadding="10" cellspacing="0" border="0"  class="tl_u2 ">
    <%-- ワンタイムパスワードログイン機能 --%>
    <tr>
    <th width="15%" valign="middle" align="left" class="table_bg_A5B4E1" nowrap>
      <span class="text_bb1"><gsmsg:write key="main.man510.3"  /></span><span class="text_r2">※</span>
    </th>
    <td valign="middle" align="left" class="td_wt" ><span class="text_base">
      <html:radio name="man510Form" styleId="man510useOtp_use" property="man510useOtp" value="<%= String.valueOf(jp.groupsession.v2.man.GSConstMain.OTP_USE) %>" />
        <label for="man510useOtp_use"><gsmsg:write key="main.man510.13" /></label>
      <html:radio name="man510Form" styleId="man510useOtp_nouse" property="man510useOtp" value="<%= String.valueOf(jp.groupsession.v2.man.GSConstMain.OTP_NOUSE) %>" />
        <label for="man510useOtp_nouse"><gsmsg:write key="main.man510.14" /></label>&nbsp;
      </span>
    </td>
    </tr>
      <bean:define id="otpUseConfDsp" value="nonDsp"/>
      <logic:equal name="man510Form" property="man510useOtp" value="<%= String.valueOf(jp.groupsession.v2.man.GSConstMain.OTP_USE) %>">
      <bean:define id="otpUseConfDsp" value=""/>
      </logic:equal>
    <%-- ワンタイムパスワード使用設定 --%>
    <tr class="js_otpuse_conf <bean:write name="otpUseConfDsp"/>">
    <th valign="middle" align="left" class="table_bg_A5B4E1 width15" nowrap>
      <span class="text_bb1"><gsmsg:write key="main.man510.9" /></span><span class="text_r2">※</span>
    </th>
    <td valign="middle" align="left" class="td_wt" >
      <table>
        <tr>
          <td class="text_base alignTop"><gsmsg:write key="cmn.target"/>:
          </td>
          <td class="text_base alignTop">
              <div class="padding_bottom10px">
                  <html:radio name="man510Form" styleId="man510otpUser_01" property="man510otpUser" value="<%= String.valueOf(jp.groupsession.v2.man.GSConstMain.OTP_TARGET_ALL) %>" /><label for="man510otpUser_01"><gsmsg:write key="cmn.alluser" /></label>&nbsp;
                  <html:radio name="man510Form" styleId="man510otpUser_02" property="man510otpUser" value="<%= String.valueOf(jp.groupsession.v2.man.GSConstMain.OTP_TARGET_SELECT) %>" /><label for="man510otpUser_02"><gsmsg:write key="cmn.named.user" /></label>
              </div>
              <bean:define id="otpUserSelDsp" value=""/>
              <logic:equal name="man510Form" property="man510otpUser" value="<%= String.valueOf(jp.groupsession.v2.man.GSConstMain.OTP_TARGET_ALL) %>">
              <bean:define id="otpUserSelDsp" value="nonDsp"/>
              </logic:equal>

              <span class="js_otpuser_sel <bean:write name="otpUserSelDsp"/>">
              <div class="padding_bottom10px">
                  <html:radio name="man510Form" styleId="man510otpUserKbn_01" property="man510otpUserKbn" value="<%= String.valueOf(jp.groupsession.v2.man.GSConstMain.OTP_USRTYPE_USE) %>" /><label for="man510otpUserKbn_01"><gsmsg:write key="main.man510.10" /></label>&nbsp;
                  <html:radio name="man510Form" styleId="man510otpUserKbn_02" property="man510otpUserKbn" value="<%= String.valueOf(jp.groupsession.v2.man.GSConstMain.OTP_USRTYPE_NOUSE) %>" /><label for="man510otpUserKbn_02"><gsmsg:write key="main.man510.11" /></label>
              </div>
              <div class="padding_bottom10px">
                  <gsform:usrgrpselect name="man510Form" property="man510targetUser"
                    onchange="buttonPush('dsp');"
                  ></gsform:usrgrpselect>
              </div>
              </span>
          </td></tr>
        <tr>
          <td class ="text_base alignTop">
              <gsmsg:write key="cmn.conditions"/>:
          </td>
          <td class="text_base alignTop ">
              <div class="padding_bottom10px">
                  <html:radio name="man510Form" styleId="man510otpCond_01" property="man510otpCond" value="<%= String.valueOf(jp.groupsession.v2.man.GSConstMain.OTP_IPCOND_ALL) %>" /><label for="man510otpCond_01"><gsmsg:write key="main.man510.15" /></label>&nbsp;
                  <html:radio name="man510Form" styleId="man510otpCond_02" property="man510otpCond" value="<%= String.valueOf(jp.groupsession.v2.man.GSConstMain.OTP_IPCOND_OUTIP) %>" /><label for="man510otpCond_02"><gsmsg:write key="main.man510.16" /></label>
              </div>
              <bean:define id="otpIpDsp" value=""/>
              <logic:equal name="man510Form" property="man510otpCond" value="<%= String.valueOf(jp.groupsession.v2.man.GSConstMain.OTP_IPCOND_ALL) %>">
              <bean:define id="otpIpDsp" value="nonDsp"/>
              </logic:equal>
              <div class="js_otpip_sel padding_bottom10px <bean:write name="otpIpDsp"/>">
                   <html:textarea name="man510Form" property="man510otpIpArea" style="width:500px;" rows="6"/>
              </div>
          </td></tr>

      </table>
    </td>
    </tr>
    <%-- SMTPサーバ --%>
    <tr class="js_otpuse_conf <bean:write name="otpUseConfDsp"/>">
    <th valign="middle" align="left" class="table_bg_A5B4E1 width15" nowrap>
      <span class="text_bb1"><gsmsg:write key="sml.sml110.06" /></span><span class="text_r2">※</span>
    </th>
    <td valign="middle" align="left" class="td_wt" >
      <div class="text_base padding_bottom10px"><gsmsg:write key="main.man510.12" /></div>
      <div class="padding_bottom10px">
          <table width="100%"class="tl0 "  cellpadding="5">
            <tr>
              <th width="0%" align="right" nowrap><span class="text_base"><gsmsg:write key="sml.sml110.07" /></span>&nbsp;</th>
              <td width="100%"><html:text name="man510Form"  maxlength="200" property="man510SmtpUrl" styleClass="text_base width350px" /></td>
            </tr>
            <tr>
              <th width="0%" align="right" nowrap><span class="text_base"><gsmsg:write key="sml.sml110.08" /></span>&nbsp;</th>
              <td width="100%"><html:text name="man510Form"  maxlength="5" property="man510SmtpPort" styleClass="text_base  width50px" />&nbsp;&nbsp;<span class="text_base6"><gsmsg:write key="sml.sml110.05" /></span></td>
            </tr>
            <tr>
              <th width="0%" align="right" nowrap><span class="text_base"></th>
              <td width="100%">
              <span class="text_base">
              <gsmsg:write key="cmn.ango" />:
              <html:select name="man510Form" property="man510SmtpEncrypt" style="height: 23px;">
                <html:optionsCollection name="man510Form" property="man510AngoProtocolCombo" value="value" label="label" />
              </html:select>&nbsp;<span class="text_base6"><gsmsg:write key="cmn.check.portnumber" /></span>
              </span>

              </td>
            </tr>
            <tr>
              <th width="0%" align="right" nowrap><span class="text_base"><gsmsg:write key="sml.sml110.17" /></span>&nbsp;</th>
              <td width="100%"><html:text name="man510Form"  maxlength="256" property="man510FromAddress" styleClass="text_base  width500px" /></td>
            </tr>
            <tr><td width="100%" colspan="2"></td></tr>
            <tr>
              <th width="0%" align="right" nowrap></th>
              <td class="td_type3" nowrap>
                <table width="100%" class="tl0"  cellpadding="5">
                  <tr><td width="100%"  colspan="2"><span class="text_base"><gsmsg:write key="sml.sml110.12" /></span><br><span class="text_base6"><gsmsg:write key="sml.sml110.02" /></span></td></tr>
                  <tr><th width="0%" align="right" nowrap><span class="text_base"><gsmsg:write key="sml.sml110.22" /></span>&nbsp;</th><td width="100%"><html:text name="man510Form"  maxlength="100" property="man510SmtpUser" styleClass="text_base width300px" /></td></tr>
                  <tr><th width="0%" align="right" nowrap><span class="text_base"><gsmsg:write key="sml.sml110.21" /></span>&nbsp;</th><td width="100%"><html:password name="man510Form"  maxlength="100" property="man510SmtpPass" styleClass="text_base width300px" /></td></tr>
                </table>
              </td>
            </tr>
          </table>
        </div>
    </td>
    </tr>

    <%-- ワンタイムパスワード通知先メールアドレス --%>
    <tr class="js_otpuse_conf <bean:write name="otpUseConfDsp"/>">
    <th width="0%" valign="middle" align="left" class="table_bg_A5B4E1" nowrap>
      <span class="text_bb1"><gsmsg:write key="user.usr060.4" /></span><span class="text_r2">※</span>
    </th>
    <td width="100%" valign="middle" align="left" class="td_wt"  colspan="5"><span class="text_base">
        <div class="padding_bottom10px"><gsmsg:write key="main.man510.20"/></div>
        <div class="padding_bottom10px">
            <html:text name="man510Form" property="man510sendToAddress" styleClass="width350px" maxlength="256"/>
        </div>
        </span>
    </td>
    </tr>
    <%-- トークン認証--%>
    <tr class="js_otpuse_conf <bean:write name="otpUseConfDsp"/>">
    <th width="0%" valign="middle" align="left" class="table_bg_A5B4E1"  nowrap>
      <span class="text_bb1">
      <gsmsg:write key="api.api020.3" /></span><span class="text_r2">※</span>
    </th>
    <td width="100%" valign="middle" align="left" class="td_wt"  colspan="5"><span class="text_base">
      <div><gsmsg:write key="api.api020.4"/></div>
      <div class="padding_bottom10px"><gsmsg:write key="api.api020.5"/></div>
      <div class="padding_bottom10px">
      <html:radio name="man510Form" property="man510useToken" styleId="man510useToken_1" value="<%= String.valueOf(GSConstApi.USEKBN_AUTH_USE) %>"  />
        <label for="man510useToken_1"><gsmsg:write key="api.api020.9" /></label>
      <html:radio name="man510Form" property="man510useToken" styleId="man510useToken_2" value="<%= String.valueOf(GSConstApi.USEKBN_AUTH_USEIP) %>"  />
        <label for="man510useToken_2"><gsmsg:write key="api.api020.10" /></label>
      <span class="nonDsp">
          <html:radio name="man510Form" property="man510useToken" styleId="man510useToken_0" value="<%= String.valueOf(GSConstApi.USEKBN_AUTH_NOUSE) %>"  />
            <label for="man510useToken_0"><gsmsg:write key="api.api020.10" /></label>
      </span>
      </div>

      <bean:define id="nonDsp" value="" />
      <logic:notEqual name="man510Form" property="man510useToken" value="<%= String.valueOf(GSConstApi.USEKBN_AUTH_USEIP)%>">
        <bean:define id="nonDsp" value="nonDsp" />
      </logic:notEqual>
      <div class="padding_bottom10px <bean:write name="nonDsp"/>">
        <html:textarea name="man510Form" property="man510tokenIpArea" style="width:500px;" rows="6"/>
        <div class="text_r2"><gsmsg:write key="main.man430.7" /></div>
        <div class="text_r2"><gsmsg:write key="main.man430.8" /></div>
      </div>
      <div class="padding_bottom10px">
         <gsmsg:write key="api.api020.11"/>:
         <html:select name="man510Form" property="man510tokenLimit">
            <html:optionsCollection name="man510Form" property="man510tokenLimitOption" />
         </html:select>
      </div>
      <div><gsmsg:write key="main.man510.21"/></div>
    </td>
    </tr>
    <%-- ベーシック認証 --%>
    <tr class="js_otpuse_conf <bean:write name="otpUseConfDsp"/>">
    <th width="0%" valign="middle" align="left" class="table_bg_A5B4E1" nowrap>
      <span class="text_bb1">
      <gsmsg:write key="api.api020.12" /></span><span class="text_r2">※</span>
    </th>
    <td width="100%" valign="middle" align="left" class="td_wt"  colspan="5"><span class="text_base">
      <div class="padding_bottom10px"><gsmsg:write key="main.man510.19"/></div>
      <div class="padding_bottom10px">
      <html:radio name="man510Form" property="man510useBasic" styleId="man510useBasic_0" value="<%= String.valueOf(GSConstApi.USEKBN_AUTH_NOUSE) %>" />
        <label for="man510useBasic_0"><gsmsg:write key="api.api020.8" /></label>
      <html:radio name="man510Form" property="man510useBasic" styleId="man510useBasic_2" value="<%= String.valueOf(GSConstApi.USEKBN_AUTH_USEIP) %>" />
        <label for="man510useBasic_2"><gsmsg:write key="api.api020.10" /></label>
      <span class="nonDsp">
          <html:radio name="man510Form" property="man510useBasic" styleId="man510useBasic_1" value="<%= String.valueOf(GSConstApi.USEKBN_AUTH_USE) %>"  />
            <label for="man510useBasic_1"><gsmsg:write key="api.api020.10" /></label>
      </span>
      </div>
      <bean:define id="nonDsp" value="" />
      <logic:notEqual name="man510Form" property="man510useBasic" value="<%= String.valueOf(GSConstApi.USEKBN_AUTH_USEIP)%>">
        <bean:define id="nonDsp" value="nonDsp" />
      </logic:notEqual>
      <div class="padding_bottom10px <bean:write name="nonDsp"/>">
        <html:textarea name="man510Form" property="man510basicIpArea" style="width:500px;" rows="6"/>
        <div class="text_r2"><gsmsg:write key="main.man430.7" /></div>
        <div class="text_r2"><gsmsg:write key="main.man430.8" /></div>
      </div>
      <div><gsmsg:write key="main.man510.21"/></div>
    </span>
    </td>
    </tr>

    </table>

  </td>
  </tr>

  <tr>
  <td>
    <table cellpadding="0" cellspacing="0" width="100%">
    <tr>
    <td>
      <table cellpadding="0" cellspacing="0" border="0" width="100%"class=" margin_top10px">
      <tr>
      <td width="100%"align="right">
      <button type="button" value="OK" class="btn_ok1" onclick="buttonPush('man510Ok');">OK</button>
      <button type="button" class="btn_back_n3" value="<gsmsg:write key="cmn.back.admin.setting" />" onClick="buttonPush('man510Back');"><gsmsg:write key="cmn.back.admin.setting" /></button>
      </td>
      </tr>
      </table>
    </td>
    </tr>
    </table>
  </td>
  </tr>

  </table>
</table>

  <%@ include file="/WEB-INF/plugin/common/jsp/footer001.jsp" %>
  </html:form>
  </body>
  </html:html>