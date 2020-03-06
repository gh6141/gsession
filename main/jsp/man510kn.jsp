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
<title>[GroupSession] <gsmsg:write key="main.man510kn.1" />
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
<html:form action="/main/man510kn">

<input type="hidden" name="CMD" value="">

<%@ include file="/WEB-INF/plugin/common/jsp/header001.jsp" %>

<table width="100%">
<tr>
<td  width="100%" align="center">

  <table width="70%" class="tl0 ">
  <tr>
  <td align="left">

    <!-- タイトル -->
    <table cellpadding="0" cellspacing="0" border="0" class="width100">
    <tr>
    <td  width="0%" ><img src="../common/images/header_ktool_01.gif" border="0" alt="<gsmsg:write key="cmn.admin.setting" />"></td>
    <td  width="0%" class="header_ktool_bg_text2 " align="left" valign="middle" nowrap><span class="settei_ttl"><gsmsg:write key="cmn.admin.setting" /></span></td>
    <td  width="100%" class="header_ktool_bg_text2" >[<gsmsg:write key="main.man510kn.1" /> ]</td>
    <td  width="0%" ><img src="../common/images/header_ktool_05.gif" border="0" alt="<gsmsg:write key="cmn.admin.setting" />"></td>
    </tr>
    </table>

    <table cellpadding="0" cellspacing="0" border="0" width="100%" >
    <tr>
    <td  width="50%" ></td>
    <td  width="0%" ><img src="../common/images/header_glay_1.gif" border="0" alt=""></td>
    <td  width="50%" class="header_glay_bg ">
      <button type="button" value="OK" class="btn_ok1" onclick="buttonPush('man510knOk');">OK</button>
      <button type="button" class="btn_back_n1" value="<gsmsg:write key="cmn.back2" />" onClick="buttonPush('man510knBack');"><gsmsg:write key="cmn.back2" /></button>
    </td>
    <td  width="0%" ><img src="../common/images/header_glay_3.gif" border="0" alt=""></td>
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
    <table cellpadding="10" cellspacing="0" border="0"  width="100%" class="tl_u2 ">
    <%-- ワンタイムパスワードログイン機能 --%>
    <tr>
    <th valign="middle" align="left" class="table_bg_A5B4E1"  width="15%" nowrap>
      <span class="text_bb1"><gsmsg:write key="main.man510.3"  /></span>
    </th>
    <td valign="middle" align="left" class="td_wt" ><span class="text_base">
      <html:hidden name="man510knForm" property="man510useOtp"/>
      <logic:equal name="man510knForm" property="man510useOtp" value="<%= String.valueOf(jp.groupsession.v2.man.GSConstMain.OTP_USE) %>">
      <span class="text_base"><gsmsg:write key="main.man510.13" /></span>
      </logic:equal>
      <logic:notEqual name="man510knForm" property="man510useOtp" value="<%= String.valueOf(jp.groupsession.v2.man.GSConstMain.OTP_USE) %>">
      <span class="text_base"><gsmsg:write key="main.man510.14" /></span>
      </logic:notEqual>
    </td>
    </tr>
      <bean:define id="otpUseConfDsp" value="nonDsp"/>
      <logic:equal name="man510knForm" property="man510useOtp" value="<%= String.valueOf(jp.groupsession.v2.man.GSConstMain.OTP_USE) %>">
      <bean:define id="otpUseConfDsp" value=""/>
      </logic:equal>
    <%-- ワンタイムパスワード使用設定 --%>
    <tr class="js_otpuse_conf <bean:write name="otpUseConfDsp"/>">
    <th valign="middle" align="left" class="table_bg_A5B4E1" width="15%"  nowrap>
      <span class="text_bb1"><gsmsg:write key="main.man510.9" /></span>
    </th>
    <td valign="middle" align="left" class="td_wt" >
      <table>
        <tr>
          <td class="text_base alignTop"><gsmsg:write key="cmn.target"/>:
          </td>
          <td class="text_base alignTop padding_bottom10px">
                  <html:hidden name="man510knForm" property="man510otpUser"/>
                  <html:hidden name="man510knForm" property="man510otpUserKbn"/>
                  <logic:equal name="man510knForm" property="man510otpUser" value="<%= String.valueOf(jp.groupsession.v2.man.GSConstMain.OTP_TARGET_ALL) %>">
                  <gsmsg:write key="cmn.alluser" />
                  </logic:equal>
                  <logic:notEqual name="man510knForm" property="man510otpUser" value="<%= String.valueOf(jp.groupsession.v2.man.GSConstMain.OTP_TARGET_ALL) %>">
                  <gsmsg:write key="cmn.named.user" />
                  <gsform:usrgrpselect name="man510knForm" property="man510targetUser"
                    onchange="buttonPush('dsp');" kakunin="kakunin"
                  ></gsform:usrgrpselect>
                  </logic:notEqual>
          </td></tr>
        <tr>
          <td class ="text_base alignTop">
              <gsmsg:write key="cmn.conditions"/>:
          </td>
          <td class="text_base alignTop padding_bottom10px">
              <div class="padding_bottom10px">
              <html:hidden name="man510knForm" property="man510otpCond"/>
              <logic:equal name="man510knForm" property="man510otpCond" value="<%= String.valueOf(jp.groupsession.v2.man.GSConstMain.OTP_IPCOND_ALL) %>">
              <gsmsg:write key="main.man510.15" />
              </logic:equal>
              <logic:notEqual name="man510knForm" property="man510otpCond" value="<%= String.valueOf(jp.groupsession.v2.man.GSConstMain.OTP_IPCOND_ALL) %>">
              <gsmsg:write key="main.man510.16" />
              </logic:notEqual>
              </div>
              <html:hidden name="man510knForm" property="man510otpIpArea"/>
              <logic:notEqual name="man510knForm" property="man510otpCond" value="<%= String.valueOf(jp.groupsession.v2.man.GSConstMain.OTP_IPCOND_ALL) %>">
              <div>
                  <bean:write name="man510knForm" property="man510otpIpDsp" filter="false"/>
              </div>
              </logic:notEqual>
          </td></tr>

      </table>
    </td>
    </tr>
    <%-- SMTPサーバ --%>
    <tr class="js_otpuse_conf <bean:write name="otpUseConfDsp"/>">
    <th valign="middle" align="left" width="15%"  class="table_bg_A5B4E1" nowrap>
      <span class="text_bb1"><gsmsg:write key="sml.sml110.06" /></span>
    </th>
    <td valign="middle" align="left" class="td_wt" >
      <table class="tl0" width="100%"  cellpadding="5">
        <tr>
          <th  width="0%"  align="right" nowrap><span class="text_base"><gsmsg:write key="sml.sml110.07" /></span>&nbsp;</th>
          <td  width="100%" ><span class="text_base"><html:hidden name="man510knForm" property="man510SmtpUrl" /><bean:write name="man510knForm" property="man510SmtpUrl" />
          </span></td>
        </tr>
        <tr>
          <th  width="0%"  align="right" nowrap><span class="text_base"><gsmsg:write key="sml.sml110.08" /></span>&nbsp;</th>
          <td  width="100%" ><span class="text_base"><html:hidden name="man510knForm"   property="man510SmtpPort"  /><bean:write name="man510knForm"   property="man510SmtpPort"  />
          </span></td>
        </tr>
        <tr>
          <th  width="0%"  align="right" nowrap><span class="text_base"/></th>
          <td  width="100%" ><span class="text_base">
          <html:hidden name="man510knForm"   property="man510SmtpEncrypt"  />
          <gsmsg:write key="cmn.ango" />:
          <bean:write name="man510knForm" property="man510knSendEncrypt" />
          </td>
        </tr>
        <tr>
          <th  width="0%"  align="right" nowrap><span class="text_base"><gsmsg:write key="sml.sml110.17" /></span>&nbsp;</th>
          <td  width="100%" ><span class="text_base"><html:hidden name="man510knForm"   property="man510FromAddress"  /><bean:write name="man510knForm"   property="man510FromAddress"  />
          </span></td>
        </tr>
        <tr>
          <th  width="0%"  align="right" nowrap><span class="text_base"><gsmsg:write key="sml.sml110.22" /></span>&nbsp;</th>
          <td  width="100%" ><span class="text_base">
          <html:hidden name="man510knForm" property="man510SmtpUser"  />
          <html:hidden name="man510knForm" property="man510SmtpPass"  />
          <bean:write name="man510knForm" property="man510SmtpUser"  />
          </span></td>
        </tr>
      </table>
    </td>
    </tr>
    <%-- ワンタイムパスワード通知先メールアドレス --%>
    <tr class="js_otpuse_conf <bean:write name="otpUseConfDsp"/>">
    <th width="0%" valign="middle" align="left" class="table_bg_A5B4E1" nowrap>
      <span class="text_bb1"><gsmsg:write key="user.usr060.4" /></span>
    </th>
    <td width="100%" valign="middle" align="left" class="td_wt"  colspan="5">
        <span class="text_base">
            <html:hidden name="man510Form" property="man510sendToAddress" />
            <bean:write name="man510Form" property="man510sendToAddress" />
        </span>
    </td>
    </tr>
    <%-- トークン認証 --%>
    <tr  class="js_otpuse_conf <bean:write name="otpUseConfDsp"/>">
    <th width="0%" valign="middle" align="left" class="table_bg_A5B4E1"  nowrap>
      <span class="text_bb1"><gsmsg:write key="user.usr060.4" /></span>
    </th>
    <td width="100%" valign="middle" align="left" class="td_wt"  colspan="5"><span class="text_base">
      <div class="padding_bottom10px">
      <html:hidden name="man510knForm" property="man510useToken"/>
      <logic:equal name="man510knForm" property="man510useToken" value="<%= String.valueOf(GSConstApi.USEKBN_AUTH_NOUSE) %>">
            <gsmsg:write key="api.api020.8" />
      </logic:equal>
      <logic:equal name="man510knForm" property="man510useToken" value="<%= String.valueOf(GSConstApi.USEKBN_AUTH_USE) %>">
        <gsmsg:write key="api.api020.9" />
      </logic:equal>
      <logic:equal name="man510knForm" property="man510useToken" value="<%= String.valueOf(GSConstApi.USEKBN_AUTH_USEIP) %>">
        <gsmsg:write key="api.api020.10" />
      </logic:equal>
      </div>
      <bean:define id="nonDsp" value="" />
      <logic:notEqual name="man510knForm" property="man510useToken" value="<%= String.valueOf(GSConstApi.USEKBN_AUTH_USEIP)%>">
        <bean:define id="nonDsp" value="nonDsp" />
      </logic:notEqual>
      <div class="padding_bottom10px <bean:write name="nonDsp"/>">
        <html:hidden name="man510knForm" property="man510tokenIpArea"/>
        <bean:write name="man510knForm" property="man510tokenIpAreaDsp"  filter="false"/>
      </div>
      <bean:define id="nonDsp" value="" />
      <logic:equal name="man510knForm" property="man510useToken" value="<%= String.valueOf(GSConstApi.USEKBN_AUTH_NOUSE)%>">
        <bean:define id="nonDsp" value="nonDsp" />
      </logic:equal>
      <div class="padding_bottom10px <bean:write name="nonDsp"/>">
         <html:hidden name="man510knForm" property="man510tokenLimit"/>
         <gsmsg:write key="api.api020.11"/>:<bean:write name="man510knForm" property="man510tokenLimitDsp" />
      </div>
    </td>
    </tr>
    <%-- ベーシック認証 --%>
    <tr class="js_otpuse_conf <bean:write name="otpUseConfDsp"/>">
    <th width="0%" valign="middle" align="left" class="table_bg_A5B4E1" nowrap>
      <span class="text_bb1"><gsmsg:write key="api.api020.12" /></span>
    </th>
    <td width="100%" valign="middle" align="left" class="td_wt"  colspan="5"><span class="text_base">
      <div class="padding_bottom10px">
        <html:hidden name="man510knForm" property="man510useBasic"/>
      <logic:equal name="man510knForm" property="man510useBasic" value="<%= String.valueOf(GSConstApi.USEKBN_AUTH_NOUSE) %>">
            <gsmsg:write key="api.api020.8" />
      </logic:equal>
      <logic:equal name="man510knForm" property="man510useBasic" value="<%= String.valueOf(GSConstApi.USEKBN_AUTH_USE) %>">
        <gsmsg:write key="api.api020.9" />
      </logic:equal>
      <logic:equal name="man510knForm" property="man510useBasic" value="<%= String.valueOf(GSConstApi.USEKBN_AUTH_USEIP) %>">
        <gsmsg:write key="api.api020.10" />
      </logic:equal>
      </div>
      <bean:define id="nonDisp" value="" />
      <logic:notEqual name="man510knForm" property="man510useBasic" value="<%= String.valueOf(GSConstApi.USEKBN_AUTH_USEIP)%>">
        <bean:define id="nonDsp" value="nonDsp" />
      </logic:notEqual>
      <div class="padding_bottom10px <bean:write name="nonDsp"/>">
        <html:hidden name="man510knForm" property="man510basicIpArea" />
        <bean:write name="man510knForm" property="man510basicIpAreaDsp" filter="false"/>
      </div>
    </span>
    </td>
    </tr>


    </table>

  </td>
  </tr>

  <tr>
  <td>
    <table cellpadding="0" cellspacing="0"  width="100%" >
    <tr>
    <td>
      <table cellpadding="0" cellspacing="0" border="0"  width="100%" class="margin_top10px">
      <tr>
      <td  width="100%"  align="right">
      <button type="button" value="OK" class="btn_ok1" onclick="buttonPush('man510knOk');">OK</button>
      <button type="button" class="btn_back_n1" value="<gsmsg:write key="cmn.back2" />" onClick="buttonPush('man510knBack');"><gsmsg:write key="cmn.back2" /></button>
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