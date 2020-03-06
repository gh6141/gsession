<%@page import="jp.groupsession.v2.cmn.login.UserAgent"%>
<%@page import="jp.groupsession.v2.cmn.GSConstApi"%>
<%@page import="jp.groupsession.v2.api.api030.Api030Biz"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="/WEB-INF/ctag-css.tld" prefix="theme" %>
<%@ taglib uri="/WEB-INF/ctag-message.tld" prefix="gsmsg" %>
<%@ taglib uri="/WEB-INF/ctag-jsmsg.tld" prefix="gsjsmsg" %>
<%@ taglib tagdir="/WEB-INF/tags/gsform" prefix="gsform" %>
<% jp.groupsession.v2.struts.msg.GsMessage gsMsg = new jp.groupsession.v2.struts.msg.GsMessage(); %>
<%@ page import="jp.groupsession.v2.cmn.GSConst" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">



<html:html>
<head>

<title>[GroupSession] <gsmsg:write key="main.man002.53" /></title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<gsjsmsg:js filename="gsjsmsg.js"/>
<script language="JavaScript" src="../common/js/cmd.js?<%= GSConst.VERSION_PARAM %>"></script>
<theme:css filename="theme.css"/>
<link rel=stylesheet href='../common/css/default.css?<%= GSConst.VERSION_PARAM %>' type='text/css'>
<link rel=stylesheet href='../api/css/api.css?<%= GSConst.VERSION_PARAM %>' type='text/css'>
<script language="JavaScript" src="../common/js/calendar.js?<%= GSConst.VERSION_PARAM %>"></script>
<script language="JavaScript" src="../common/js/userpopup.js?<%= GSConst.VERSION_PARAM %>"></script>
<script language="JavaScript" src="../common/js/grouppopup.js?<%= GSConst.VERSION_PARAM %>"></script>
<script language="JavaScript" src='../common/js/jquery-1.5.2.min.js?<%= GSConst.VERSION_PARAM %>'></script>
<script language="JavaScript" src="../api/js/api030.js?<%= GSConst.VERSION_PARAM %>"></script>

</head>

<body class="body_03">
<html:form action="/api/api030">

<input type="hidden" name="CMD" value="">
<html:hidden property="backScreen" />

<html:hidden property="api030page" />

<html:hidden property="api030cliantCRSv" />
<html:hidden property="api030cliantAppSv" />
<html:hidden property="api030cliantOtherSv" />
<html:hidden property="api030userSv" />
<html:hidden property="api030groupSv" />
<html:hidden property="api030sortKeySv" />
<html:hidden property="api030orderKeySv" />
<html:hidden property="api030delete" value=""/>

<%@ include file="/WEB-INF/plugin/common/jsp/header001.jsp" %>
<!--　BODY -->
<table width="100%" cellpadding="5" cellspacing="0">
<tr>
<td width="100%" align="center">

  <table width="100%" cellpadding="0" cellspacing="0">
  <tr>
  <td align="left">

    <table cellpadding="0" cellspacing="0" border="0" width="100%">
    <tr>
    <td width="0%"><img src="../common/images/header_ktool_01.gif" border="0" alt="<gsmsg:write key="cmn.admin.setting" />"></td>
    <td width="0%" class="header_ktool_bg_text2" align="left" valign="middle" nowrap><span class="settei_ttl"><gsmsg:write key="cmn.admin.setting" /></span></td>
    <td width="100%" class="header_ktool_bg_text2">[ <gsmsg:write key="api.api030.1" /> ]</td>
    <td width="0%"><img src="../common/images/header_ktool_05.gif" border="0" alt="<gsmsg:write key="cmn.admin.setting" />"></td>
    </tr>
    </table>

    <table cellpadding="0" cellspacing="0" border="0" width="100%">
    <tr>
    <td width="50%"></td>
    <td width="0%"><img src="../common/images/header_glay_1.gif" border="0" alt=""></td>
    <td class="header_glay_bg" width="50%">
      <button type="button" class="btn_back_n1" value="<gsmsg:write key="cmn.back" />" onClick="return buttonPush('api030Back');"><gsmsg:write key="cmn.back" /></button>
    </td>
    <td width="0%"><img src="../common/images/header_glay_3.gif" border="0" alt=""></td>
    </tr>
    </table>
    <div class="spacer margin_top10px" />

    <table width="100%" class="tl0 tbl_base">

    <logic:messagesPresent message="false">
    <tr>
    <td  colspan="4" width="100%" nowrap>
      <table width="100%">
      <tr>
      <td align="left"><span class="TXT02"><html:errors/></span></td>
      </tr>
      </table>
    </td>
    </tr>
    </logic:messagesPresent>
    <%-- 検索項目ヘッダ --%>
    <tr>
    <td colspan="4" class="table_bg_7D91BD" align="center">
      <table width="100%" class="tl0">
      <tr>
      <td align="left">
      <span class="text_tl1"><font color="ffffff">&nbsp;</font></span>
      </td>
      </tr>
      </table>
    </td>
    </tr>
    <tr>
    <%-- クライアント --%>
    <th align="center" class="td_gray" nowrap><span class="text_bb2"><gsmsg:write key="cmn.client" /></span></td>
    <td align="left" class="td_type20" nowrap>
      <html:checkbox styleId="search_scope_01" property="api030cliantCR" value="<%=String.valueOf(UserAgent.CLIENT_TYPE_CROSSRIDE) %>" /><label for="search_scope_01"><gsmsg:write key="cmn.crossride" /></label>&nbsp;
      <html:checkbox styleId="search_scope_02" property="api030cliantApp" value="<%=String.valueOf(UserAgent.CLIENT_TYPE_GSASSIST) %>" /><label for="search_scope_02"><gsmsg:write key="cmn.gsassist" /></label>&nbsp;
      <html:checkbox styleId="search_scope_03" property="api030cliantOther" value="<%=String.valueOf(UserAgent.CLIENT_TYPE_OTHER) %>" /><label for="search_scope_03"><gsmsg:write key="cmn.other" /></label>&nbsp;
    </td>
    <%-- ユーザ --%>
    <th align="center" class="td_gray" nowrap><span class="text_bb2"><gsmsg:write key="cmn.user" /></span></td>
    <td align="left" class="td_type20" nowrap>
    <logic:notEmpty name="api030Form" property="api030groupLabel">
      <html:select property="api030group" styleClass="select01" onchange="buttonPush('dsp')">
        <html:optionsCollection name="api030Form" property="api030groupLabel" value="value" label="label" />
      </html:select>
      <input type="button" onclick="openGroupWindowForApi030(this.form.api030group, 'api030group', '0', 'dsp')" class="group_btn" value="&nbsp;&nbsp;" id="man250GroupBtn">
    </logic:notEmpty>

    <logic:notEmpty name="api030Form" property="api030usrLabel">
      <html:select property="api030user" styleClass="select01">
        <logic:iterate id="user" name="api030Form" property="api030usrLabel">
           <option class="<logic:equal name="user" property="usrUkoFlg" value="1">mukouser_option</logic:equal>" value="<bean:write name="user" property="value"/>"><bean:write name="user" property="label"/></option>
        </logic:iterate>
      </html:select>
    </logic:notEmpty>
    </td>
    </tr>
    <%-- ソート順 --%>
    <tr>
    <td align="center" class="td_gray" nowrap><span class="text_bb2"><gsmsg:write key="cmn.sort.order" /></span></td>
    <td colspan="3" class="td_type20" nowrap>
      <span class="text_base2">

      <span class="text_bb2"><gsmsg:write key="cmn.first.key" /></span>
      <html:select property="api030sortKey" styleClass="select01">
    <logic:notEmpty name="api030Form" property="sortLabel">
        <html:optionsCollection name="api030Form" property="sortLabel" value="value" label="label" />
    </logic:notEmpty>
      </html:select>
      <html:radio name="api030Form" property="api030orderKey" styleId="sort1_up" value="<%= String.valueOf(jp.groupsession.v2.cmn.GSConst.ORDER_KEY_ASC) %>" /><label for="sort1_up"><gsmsg:write key="cmn.order.asc" /></label>
      <html:radio name="api030Form" property="api030orderKey" styleId="sort1_dw" value="<%= String.valueOf(jp.groupsession.v2.cmn.GSConst.ORDER_KEY_DESC) %>" /><label for="sort1_dw"><gsmsg:write key="cmn.order.desc" /></label>


      </span>
    </td>
    </tr>
    </table>
    <div class="spacer margin_top10px" />
    <table cellpadding="0" cellspacing="0" width="100%">
    <tr>
    <td align="center" width="100%">
    <button type="button" value="<gsmsg:write key="cmn.search" />" class="btn_base1" onClick="buttonPush('api030Search');"><gsmsg:write key="cmn.search" /></button>
    </td>

    <logic:notEmpty name="api030Form" property="api030DspList">
    <td align="right" width="0%">
        <button type="button" name="btn_del" class="btn_dell_n1" value="<gsmsg:write key="api.api030.3" />" onClick="buttonPush('api030Muko');"><gsmsg:write key="api.api030.3" /></button>
    </td>
    </logic:notEmpty>
    </tr>
    </table>

    <%-- 検索結果 --%>
    <logic:notEmpty name="api030Form" property="api030DspList">

    <div><img src="../common/images/spacer.gif" width="1" height="10" class="img_bottom"></div>

    <bean:size id="count1" name="api030Form" property="api030PageLabel" scope="request" />
    <logic:greaterThan name="count1" value="1">

    <table width="100%" cellpadding="5" cellspacing="0">
    <tr>
    <td width="100%" align="right" valign="top" nowrap>
    <img alt="<gsmsg:write key="cmn.previous.page" />" class="img_bottom" height="20" src="../common/images/arrow2_l.gif" width="20" border="0" onClick="buttonPush('prevPage');">
    <logic:notEmpty name="api030Form" property="api030PageLabel">
      <html:select property="api030pageSel" onchange="changePage(this);" styleClass="text_i">
        <html:optionsCollection name="api030Form" property="api030PageLabel" value="value" label="label" />
      </html:select>
    </logic:notEmpty>
    <img src="../common/images/arrow2_r.gif" name ="btn_next" alt="<gsmsg:write key="cmn.next.page" />" class="img_bottom" width="20" height="20" border="0" onClick="buttonPush('nextPage');">
    </td>
    </tr>
    </table>
    </logic:greaterThan>

    <table class="tl0 table_td_border " width="100%" cellpadding="0" cellspacing="0">

      <tr class="td_type3">
        <th width="0%"><input class="js_token_check" type="checkbox" onclick="allCheck(this);"></th>
        <th width="20%"><a href="javascript:void(0)" onClick="clickSortTitle(<%= String.valueOf(Api030Biz.TOKEN_SORTKEY_USER) %>);"><span class="text_bb2"><gsmsg:write key="cmn.user" /></span></a></th>
        <th width="0%"><a href="javascript:void(0)" onClick="clickSortTitle(<%= String.valueOf(Api030Biz.TOKEN_SORTKEY_CLIENT) %>);"><span class="text_bb2"><gsmsg:write key="cmn.client" /></span></a></th>
        <th width="15%"><a href="javascript:void(0)" onClick="clickSortTitle(<%= String.valueOf(Api030Biz.TOKEN_SORTKEY_ADATE) %>);"><span class="text_bb2"><gsmsg:write key="api.api030.4" /></span></a></th>
        <th width="15%"><a href="javascript:void(0)" onClick="clickSortTitle(<%= String.valueOf(Api030Biz.TOKEN_SORTKEY_LDATE) %>);"><span class="text_bb2"><gsmsg:write key="api.api030.5" /></span></a></th>
        <th width="0%"><span class="text_bb2"><gsmsg:write key="api.api030.6" /></span></th>
        <th width="30%"><span class="text_bb2"><gsmsg:write key="api.api030.7" /></span></th>
        <th width="0%"></th>
      </tr>

      <logic:iterate id="dspMdl" name="api030Form" property="api030DspList" indexId="idx">
      <bean:define id="tdColor" value="" />
      <% String[] tdColors = new String[] {"td_type20", "td_type25_2"}; %>
      <% tdColor = tdColors[(idx.intValue() % 2)]; %>

      <tr>
        <td>
           <logic:equal name="dspMdl" property="aptJkbn" value="0">
             <logic:equal name="dspMdl" property="mukoCheck" value="true">
               <input type="checkbox" class="js_token_check" name="api030delMulti" value="<bean:write name="dspMdl" property="aptToken" />" checked="checked" />
             </logic:equal>
             <logic:notEqual name="dspMdl" property="mukoCheck" value="true">
                <input type="checkbox" class="js_token_check" name="api030delMulti" value="<bean:write name="dspMdl" property="aptToken" />" />
             </logic:notEqual>

           </logic:equal>
        </td>
        <td class="<%= tdColor %>" nowrap align="left">
          <logic:notEmpty name="dspMdl" property="user" >
          <logic:equal name="dspMdl" property="user.jkbn" value="0">
              <span class = "<logic:equal name="dspMdl" property="user.usrUkoFlg" value="1">mukouser</logic:equal>">
              <bean:write name="dspMdl" property="user.label" />
              </span>
          </logic:equal>
          <logic:notEqual name="dspMdl" property="user.jkbn" value="0">
              <del>
              <bean:write name="dspMdl" property="user.label" />
              </del>
          </logic:notEqual>
          </logic:notEmpty>
        </td>
        <td class="<%= tdColor %>" nowrap align="left">
        <logic:equal name="dspMdl" property="aptClient" value="<%=String.valueOf(UserAgent.CLIENT_TYPE_CROSSRIDE) %>">
          <gsmsg:write key="cmn.crossride" />
        </logic:equal>
        <logic:equal name="dspMdl" property="aptClient" value="<%=String.valueOf(UserAgent.CLIENT_TYPE_GSASSIST) %>">
          <gsmsg:write key="cmn.gsassist" />
        </logic:equal>
        <logic:equal name="dspMdl" property="aptClient" value="<%=String.valueOf(UserAgent.CLIENT_TYPE_OTHER) %>">
          <gsmsg:write key="cmn.other" />
        </logic:equal>

        </td>
        <td class="<%= tdColor %>" align="center"><bean:write name="dspMdl" property="adateDsp" /></td>
        <td class="<%= tdColor %>" align="center"><bean:write name="dspMdl" property="ldateDsp" /></td>
        <td class="<%= tdColor %>" align="left"><bean:write name="dspMdl" property="aptIp" /></td>
        <td class="<%= tdColor %>" align="left"><bean:write name="dspMdl" property="aptClientId" /></td>
        <td class="<%= tdColor %>" nowrap align="left">
          <logic:equal name="dspMdl" property="aptJkbn" value="0">
            <button type="button" class="btn_dell_n1" name="api030delete" value="<gsmsg:write key="api.api030.3" />" onClick="buttonMuko('<bean:write name="dspMdl" property="aptToken" />');"><gsmsg:write key="cmn.invalid" /></button>
          </logic:equal>
          <logic:notEqual name="dspMdl" property="aptJkbn" value="0">
            <gsmsg:write key="api.api030.9" />
          </logic:notEqual>
        </td>
      </tr>

      </logic:iterate>

    </table>


    <logic:greaterThan name="count1" value="1">

    <table width="100%" cellpadding="5" cellspacing="0">
    <tr>
    <td width="100%" align="right" valign="top" nowrap>
    <img alt="<gsmsg:write key="cmn.previous.page" />" class="img_bottom" height="20" src="../common/images/arrow2_l.gif" width="20" border="0" onClick="buttonPush('prevPage');">
    <logic:notEmpty name="api030Form" property="api030PageLabel">
      <html:select property="api030pageSel" onchange="changePage(this);" styleClass="text_i">
        <html:optionsCollection name="api030Form" property="api030PageLabel" value="value" label="label" />
      </html:select>
    </logic:notEmpty>
    <img src="../common/images/arrow2_r.gif" name ="btn_next" alt="<gsmsg:write key="cmn.next.page" />" class="img_bottom" width="20" height="20" border="0" onClick="buttonPush('nextPage');">
    </td>
    </tr>
    </table>
    </logic:greaterThan>
    </logic:notEmpty>

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