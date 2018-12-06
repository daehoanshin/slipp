<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.util.*,java.text.*,java.sql.*,java.io.OutputStream,java.io.BufferedReader, java.io.InputStreamReader,java.net.HttpURLConnection,java.net.URL"%>

<html>
<head>
<meta charset="utf-8">
<title>승인</title>
</head>
<body>
<table border=3 width="250" height="100" bordercolor="#220700">
<script language="javascript">
function aprv(){
	alert("정상적으로 처리되었습니다.");
	window.close();
}
function disaprv(){
	alert("이미 처리되었습니다.");
	window.close();
}

</script>
<%
	request.setCharacterEncoding("utf-8");  //Set encoding
	String aprvStatus=request.getParameter("aprvStatus");
 if("Y".equals(aprvStatus))
 {
%>

	 <script> aprv();</script>

<%	
 }
 else
 {
%>
	 <script> disaprv();</script>
<%	
 }
 


%>

<tr>
<td width="244" height="40" bgcolor="#220700" >
    <button style="color:white;width:60px;height:30px;FONT-SIZE:9pt; font-weight:bold;border:none;background-color:#9D8B6A" onClick="javascript:self.close();">종료</button></td>
</tr>
</table>
</body>
</html>