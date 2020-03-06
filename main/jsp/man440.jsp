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
<title>[GroupSession] <gsmsg:write key="cmn.import.cybozu" /></title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script language="JavaScript" src="../common/js/cmd.js?<%= GSConst.VERSION_PARAM %>"></script>
<script language="JavaScript" src="../common/js/jquery-1.6.4.min.js?<%= GSConst.VERSION_PARAM %>"></script>
<theme:css filename="theme.css"/>
<link rel=stylesheet href='../common/css/default.css?<%= GSConst.VERSION_PARAM %>' type='text/css'>
<link rel=stylesheet href='../main/css/cybouzu.css?<%= GSConst.VERSION_PARAM %>' type='text/css'>
</head>

<body class="body_03">
<html:form action="/main/man440">
<input type="hidden" name="CMD" value="">
<html:hidden property="man440InitFlg"/>


<!--　BODY -->
<table width="100%">
<tr>
<td width="100%" align="center" cellpadding="5" cellspacing="0">

  <table width="70%" cellpadding="0" cellspacing="0">
  <tr>
  <td>

    <table cellpadding="0" cellspacing="0" border="0" width="100%">
    <tr>
    <td width="0%"><img src="../common/images/header_ktool_01.gif" border="0" alt="<gsmsg:write key="cmn.admin.setting" />"></td>
    <td width="0%" class="header_ktool_bg_text2" align="left" valign="middle" nowrap><span class="settei_ttl"><gsmsg:write key="cmn.admin.setting" /></span></td>
    <td width="50%" class="header_ktool_bg_text2">[ <gsmsg:write key="cmn.import.cybozu" /> ]</td>
    <td width="50%" class="header_ktool_bg" align="right"></td>
    <td width="0%"><img src="../common/images/header_ktool_05.gif" border="0" alt=""></td>
    </tr>
    </table>


    <table cellpadding="0" cellspacing="0" border="0" width="100%">
    <tr>
    <td width="50%"></td>
    <td width="0%"><img src="../common/images/header_glay_1.gif" border="0" alt=""></td>
    <td class="header_glay_bg" width="50%">
      <input type="button" value="<gsmsg:write key="cmn.back2" />" class="btn_back_n1" onClick="buttonPush('440_back');">
    <td width="0%"><img src="../common/images/header_glay_3.gif" border="0" alt=""></td>
    </tr>
    </table>

    <img src="../common/images/spacer.gif" border="0" height="10px" width="1px" />

    <span class="TXT02"><html:errors/></span>

<!-- 本体 -->

    <div class="attention_textbox">
        <p class="attention_title text_bold"><gsmsg:write key="main.man440.1" /></p>
        <ul class="text_base">
            <li><gsmsg:write key="main.man440.2" /></li>
            <li><gsmsg:write key="main.man440.3" /></li>
            <li><gsmsg:write key="main.man440.4" /></li>
        </ul>
    </div>

    <img src="../common/images/spacer.gif" border="0" height="10px" width="1px" />

    <table cellpadding="10" cellspacing="0" border="0" class="step_list_table tl_u2">

    <tr>
    <td class="table_bg_A5B4E1" nowrap>
      <span class="text_bb1"><gsmsg:write key="main.man440.5" />1</span>
    </td>
    <td valign="middle" align="left" class="td_wt" >
      <span class="text_base"><gsmsg:write key="main.man440.6" /></span><br/>
      <br/>
      <a href="#" onclick="return buttonPush('grouplist');"><span class="text_link"><gsmsg:write key="user.44" /></span></a>
    </td>
    </tr>

    <tr>
    <td width="15%" valign="middle" align="left" class="table_bg_A5B4E1" nowrap>
      <span class="text_bb1"><gsmsg:write key="main.man440.5" />2</span>
    </td>
    <td valign="middle" align="left" class="td_wt" >
      <span class="text_base"><gsmsg:write key="main.man440.7" /></span><br/>
      <br/>
        <span class="text_bb1"><gsmsg:write key="main.man440.8" /></span><span class="text_r2"><gsmsg:write key="cmn.comments" /></span>

        <!-- グループ選択 -->
        <html:select property="man440GrpSid" styleClass="select02">
          <html:optionsCollection name="man440Form" property="grpLabelList" value="value" label="label" />
        </html:select>

        <br/>
      <br/>
      <table class="step2_text_list">
      <tr>
        <td style="padding:4px;"><span class="text_base">1. </td>
        <td style="padding:4px;"><a href="#" onclick="return buttonPush('memberImport');"><span class="text_link"><gsmsg:write key="main.man440.9" /></span></a></td>
        <td style="padding:4px;"><span class="text_base"><gsmsg:write key="rng.rng130.19" /><gsmsg:write key="main.man440.10" /></span></td>
      </tr>
      <tr>
        <td style="padding:4px;"><span class="text_base">2. </span></td>
        <td style="padding:4px;"><a href="#" onclick="return buttonPush('eventImport');"><span class="text_link"><gsmsg:write key="main.man440.11" /></span></a></td>
        <td style="padding:4px;"><span class="text_base"><gsmsg:write key="rng.rng130.19" /><gsmsg:write key="main.man440.12" /></span></td>
      </tr>
      <tr>
        <td style="padding:4px;"><span class="text_base">3. </span></td>
        <td style="padding:4px;"><a href="#" onclick="return buttonPush('boardImport');"><span class="text_link"><gsmsg:write key="cmn.bulletin" /></span></a></td>
        <td style="padding:4px;"><span class="text_base"><gsmsg:write key="rng.rng130.19" /><gsmsg:write key="main.man440.13" /></span></td>
      </tr>
      <tr>
        <td style="padding:4px;"><span class="text_base">4. </span></td>
        <td style="padding:4px;"><a href="#" onclick="return buttonPush('todoImport');"><span class="text_link"><gsmsg:write key="main.man440.14" /></span></a></td>
        <td style="padding:4px;"><span class="text_base"><gsmsg:write key="rng.rng130.19" /><gsmsg:write key="main.man440.15" /></span></td>
      </tr>
      </table>
    </td>
    </tr>

    <tr>
    <td width="15%" valign="middle" align="left" class="table_bg_A5B4E1" nowrap>
      <span class="text_bb1"><gsmsg:write key="main.man440.5" />3</span>
    </td>
    <td valign="middle" align="left" class="td_wt" >
      <span class="text_base"><gsmsg:write key="main.man440.16" /></span><br/>
      <br/>
      <a href="#" onclick="return buttonPush('sisetuSettei');"><span class="text_link"><gsmsg:write key="reserve.rsv070.1" /></span></a>
      <span class="text_base"><gsmsg:write key="rng.rng130.19" /><gsmsg:write key="main.man440.17" /></span>
    </td>
    </tr>

    <tr>
    <td width="15%" valign="middle" align="left" class="table_bg_A5B4E1" nowrap>
      <span class="text_bb1"><gsmsg:write key="main.man440.5" />4</span>
    </td>
    <td valign="middle" align="left" class="td_wt" >
      <span class="text_base"><gsmsg:write key="main.man440.18" /></span><br/>
      <br/>
      <a href="#" onclick="return buttonPush('fileManager');"><span class="text_link"><gsmsg:write key="cmn.filekanri" /></span></a>
      <span class="text_base"><gsmsg:write key="rng.rng130.19" /><gsmsg:write key="main.man440.19" /></span>
    </td>
    </tr>
    </table>

    <img src="../common/images/spacer.gif" border="0" height="10px" width="1px" />

    <table width="100%">
    <tr>
    <td width="100%" align="right" cellpadding="5" cellspacing="0">
      <input type="button" value="<gsmsg:write key="cmn.back2" />" class="btn_back_n1" onClick="buttonPush('440_back');">
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