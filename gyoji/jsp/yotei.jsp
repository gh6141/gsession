<%@ page pageEncoding="Windows-31J"
    contentType="text/html; charset=UTF-8"%>
  <%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
  <%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
  <%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
  <%@ taglib uri="http://struts.apache.org/tags-nested" prefix="nested" %>


  <html:html>
  <head>
  <title>[GroupSession] Yotei</title>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link rel=stylesheet href='../common/css/default.css' type='text/css'>
  </head>

  <body class="body_03">

<html:form action="/gyoji/yotei">

  <%@ include file="/WEB-INF/plugin/common/jsp/header001.jsp" %>

  <table width="100%">
  <tr>
  <td width="100%" align="center">
    <p>行事予定（エクセル）の設定</p>
  </td>
  </tr>
  </table>

行事予定の項目名<html:text property="text4" size="80" /><br>
※「,,[行事],[○部],,,,のように、エクセルの項目名を入れてください。空欄だと表示されません。<br>
　<br>
 ＜エクセルデータの作成にあたっての留意点＞<br>
　・エクセルデータでは、セルの結合は使わないでください。<br>
　・月のタブは４月、５月、、、３月の順に並んでいる必要があります。 <br>
　　　

<br><br>
行事予定のエクセルファイルのパス<html:text property="text" size="80"  /><br>
※予定表のエクセルファイルの場所（パス）を入れてください。￥などの記号は￥￥（実際は半角の円記号）のように２重にしてください。
<br>


    <br><br>
    <html:submit property="submit" value="更新" />




  <%@ include file="/WEB-INF/plugin/common/jsp/footer001.jsp" %>

  </html:form>
  </body>
  </html:html>