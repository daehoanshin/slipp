<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.util.*,java.text.*,java.sql.*,java.io.OutputStream,java.io.BufferedReader, java.io.InputStreamReader,java.net.HttpURLConnection,java.net.URL"%>

<html>
<head>
<meta charset="utf-8">
<title>승인</title>
</head>
<body>
<script language="javascript">

</script>
<%
request.setCharacterEncoding("utf-8");  //Set encoding
 String srId=request.getParameter("srId");
 String aprvStatus=request.getParameter("aprvStatus");
 String srStatus=request.getParameter("srStatus");
 String aprvSeq=request.getParameter("aprvSeq");
 String srTypeId=request.getParameter("srTypeId");
 
String param = "srId="+srId+"&aprvStatus="+aprvStatus+"&aprvSeq="+aprvSeq+"&srTypeId="+srTypeId+"&srStatus="+srStatus;
URL targetURL = new URL("http://21.111.71.145:8800/APR/EMAIL_APRV.jsp");

HttpURLConnection hurlc = (HttpURLConnection) targetURL.openConnection();

hurlc.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
hurlc.setRequestMethod("POST");
hurlc.setDoOutput(true);
hurlc.setDoInput(true);
hurlc.setInstanceFollowRedirects(false); 

OutputStream opstrm = hurlc.getOutputStream();
opstrm.write(param.getBytes());
opstrm.flush();
opstrm.close();

String buffer = null;
BufferedReader in = new BufferedReader(new InputStreamReader(hurlc.getInputStream(),"UTF-8"));
while((buffer = in.readLine()) != null) {
	out.println(buffer);
}
in.close();


%>

</body>
</html>