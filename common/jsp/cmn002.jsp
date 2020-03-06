<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="/WEB-INF/ctag-css.tld" prefix="theme" %>
<%@ taglib uri="/WEB-INF/ctag-message.tld" prefix="gsmsg" %>

<% String key = jp.groupsession.v2.cmn.GSConst.SESSION_KEY; %>
<%@ page import="jp.groupsession.v2.cmn.GSConst" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html:html>
<head>
<title>[GroupSession]</title>
<LINK REL="SHORTCUT ICON" href="../common/images/favicon.ico">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<theme:css filename="theme.css"/>
<link rel=stylesheet href='../common/css/default.css?<%= GSConst.VERSION_PARAM %>' type='text/css'>
<script type="text/javascript" src="../common/js/jquery-3.3.1.min.js?<%= GSConst.VERSION_PARAM %>"></script>
<script language="JavaScript" src="../common/js/websocketForChat.js?<%= GSConst.VERSION_PARAM %>"></script>
<script language="JavaScript" src="../common/js/push.min.js?<%= GSConst.VERSION_PARAM %>"></script>
<script language="JavaScript" src="../common/js/notice.js?<%= GSConst.VERSION_PARAM %>"></script>
</head>
<frameset rows="90,*" cols="1" frameborder="no" onload="websocket('<bean:write name="cmn002Form" property="url" />');">
  <frame src="../common/cmn003.do?menuPage=<bean:write name="cmn002Form" property="menuPage" />" name="menu" scrolling="no" noresize="true">
  <frame src="<bean:write name="cmn002Form" property="url" />" name="body" scrolling="yes">
</frameset>
<noframes>
<gsmsg:write key="cmn.cmn002.1" />
</noframes>
</html:html>
