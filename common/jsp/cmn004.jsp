<%@page import="jp.groupsession.v2.cmn.login.otp.OtpSendResult"%>
<%@page import="jp.groupsession.v2.cmn.cmn004.Cmn004Form"%>
<%@page import="jp.groupsession.v2.cmn.GSConstCommon"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="/WEB-INF/ctag-css.tld" prefix="theme" %>
<%@ taglib uri="/WEB-INF/ctag-message.tld" prefix="gsmsg" %>
<%@ taglib uri="/WEB-INF/ctag-jsmsg.tld" prefix="gsjsmsg" %>

<%@ page import="jp.groupsession.v2.cmn.GSConst" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html:html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<gsjsmsg:js filename="gsjsmsg.js"/>
<script language="JavaScript" src="../common/js/cmd.js?<%= GSConst.VERSION_PARAM %>"></script>
<script language="JavaScript" src="../common/js/submit.js?<%= GSConst.VERSION_PARAM %>"></script>
<script language="JavaScript" src="../common/js/popup.js?<%= GSConst.VERSION_PARAM %>"></script>
<script language="JavaScript" src='../common/js/jquery-1.5.2.min.js?<%= GSConst.VERSION_PARAM %>'></script>
<theme:css filename="theme.css"/>
<link rel=stylesheet href='../common/css/default.css?<%= GSConst.VERSION_PARAM %>' type='text/css'>
<link rel=stylesheet href='../common/css/cmn999.css?<%= GSConst.VERSION_PARAM %>' type='text/css'>
<title>[GroupSession] <gsmsg:write key="cmn.message" /></title>
<script language="JavaScript">
</script>
</head>

<body>

<html:form action="/common/cmn004" target="_self">
<bean:define id="thisForm" name="cmn004Form" type="Cmn004Form" />
<bean:define id="otpRes" name="cmn004Form" property="cmn004OtpSendResult" type="OtpSendResult" />

<html:hidden property="url" />

<html:hidden property="CMD" value="cmn004OK" />
<html:hidden property="cmn004Token" />

<div id="contair">
  <div id="information_body" class="marginTop30">

    <div id="information_top">
      <span>
      <gsmsg:write key="cmn.cmn004.1"/>
      </span>
    </div>
    <div class="information_middle_div">
    </div>

    <div class="information_middle_div">
      <div>
        <div class="information_middle_button">
            <div class="text_base" align="left">
                <gsmsg:write key="cmn.cmn004.2" arg0="<%=otpRes.getOtpSendMailTo() %>"/>
            <table class="text_base" style="
                margin: 5px;
            ">
                    <tbody><tr>
                        <td><gsmsg:write key="cmn.sender"/></td><td>：</td><td><bean:write name="otpRes" property="otpSendMailFrom" /></td>
                    </tr>
                    <tr>
                        <td><gsmsg:write key="cmn.title"/></td><td>：</td><td><bean:write name="otpRes" property="otpSendMailSubject" /></td>
                    </tr>
                    <tr>
                        <td><gsmsg:write key="cmn.send.date"/></td><td>：</td><td><bean:write name="otpRes" property="otpSendDateStr" /></td>
                    </tr>
                </tbody></table>
                <gsmsg:write key="cmn.cmn004.3" />
            </div>
            <div id="error_report">
               <br>
               <logic:messagesPresent message="false">
               <html:errors /><br>
               </logic:messagesPresent>

               <input name="cmn004OtPass" class="text_base"  type="text" maxlength="<%= String.valueOf(GSConstCommon.OTP_LENGTH) %>" value="">

               <button type="submit" value="OK" class="btn_ok1" ><gsmsg:write key="cmn.login" /></button>
            </div>
        </div>
      </div>
    </div>
    <div id="information_bottom"></div>
  </div>
</div>
</html:form>
<%@ include file="/WEB-INF/plugin/common/jsp/footer001.jsp" %>

</body>
</html:html>