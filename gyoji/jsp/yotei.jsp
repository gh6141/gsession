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
    <p>�s���\��i�G�N�Z���j�̐ݒ�</p>
  </td>
  </tr>
  </table>

�s���\��̍��ږ�<html:text property="text4" size="80" /><br>
���u,,[�s��],[����],,,,�̂悤�ɁA�G�N�Z���̍��ږ������Ă��������B�󗓂��ƕ\������܂���B<br>
�@<br>
 ���G�N�Z���f�[�^�̍쐬�ɂ������Ă̗��ӓ_��<br>
�@�E�G�N�Z���f�[�^�ł́A�Z���̌����͎g��Ȃ��ł��������B<br>
�@�E���̃^�u�͂S���A�T���A�A�A�R���̏��ɕ���ł���K�v������܂��B <br>
�@�@�@

<br><br>
�s���\��̃G�N�Z���t�@�C���̃p�X<html:text property="text" size="80"  /><br>
���\��\�̃G�N�Z���t�@�C���̏ꏊ�i�p�X�j�����Ă��������B���Ȃǂ̋L���́����i���ۂ͔��p�̉~�L���j�̂悤�ɂQ�d�ɂ��Ă��������B
<br>


    <br><br>
    <html:submit property="submit" value="�X�V" />




  <%@ include file="/WEB-INF/plugin/common/jsp/footer001.jsp" %>

  </html:form>
  </body>
  </html:html>