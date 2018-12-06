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

 ResultSet rs;
 String query_sel = "SELECT * FROM CRP.TB_APPROVAL_HIST WHERE SR_ID='"+srId+"' AND APRV_SEQ='"+aprvSeq+"' AND APRV_STATUS != 'AP002'";
 try{
  Class.forName("com.ibm.db2.jcc.DB2Driver");
  String url = "jdbc:db2://21.111.71.145:50000/CRP:retrieveMessagesFromServerOnGetMessage=true;";
  Connection con = DriverManager.getConnection(url,"db2admin","ttfuture_01");
  if(con==null)
	  throw new Exception("데이터베이스에 연결할 수 없습니다.");
  Statement stat2 = con.createStatement();  
  Statement stat = con.createStatement();
  rs = stat2.executeQuery(query_sel);
  if(rs.next()){
	  aprvStatus = "N";
  }
  else
  {
	  String query = "INSERT INTO CRP.TB_EMAIL_APPROVAL(SR_ID, APRV_SEQ, APRV_STATUS, SR_TYPE_ID, SR_STATUS, IF_YN, ERR, CRT_DTTM) " +
					"VALUES('"+srId+"','"+aprvSeq+"','"+aprvStatus+"','"+srTypeId+"','"+srStatus+"','N','N',current timestamp)";
	  int rowNum = stat.executeUpdate(query);
	  if(rowNum<1){
		throw new Exception("데이터를 DB에 넣을 수 없습니다.");
		}
		else
		{
			aprvStatus = "Y";
		}
  }
  stat.close();
  stat2.close();
  con.close();
 }
 catch(Exception e){
  out.println( e );
 }
 %>
 
 
 
 <%

 
String param = "aprvStatus="+aprvStatus;
URL targetURL = new URL("https://apprm.abllife.co.kr:9444/APRV_RESULT.jsp");

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