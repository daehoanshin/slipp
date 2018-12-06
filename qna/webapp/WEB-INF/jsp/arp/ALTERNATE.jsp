<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.util.Date,java.text.*,java.sql.*"%>

<html>
<head>
<meta charset="utf-8">
<title>대결자</title>
</head>
<body>
<table border=3 width="250" height="100" bordercolor="#220700">
<script language="javascript">
window.close();
</script>
<%
request.setCharacterEncoding("utf-8");  //Set encoding
 String orguserid=request.getParameter("orguserid");
 String newuserid=request.getParameter("newuserid");
 String startdateStr=request.getParameter("startdate");
 String enddateStr=request.getParameter("enddate");
 out.println(startdateStr);
 
 String flag=request.getParameter("flag");
 
 String query;
 try{
  Class.forName("com.ibm.db2.jcc.DB2Driver");
  String url = "jdbc:db2://21.111.71.145:50000/CRP:retrieveMessagesFromServerOnGetMessage=true;";
  Connection con = DriverManager.getConnection(url,"db2admin","ttfuture_01");
  if(con==null)
	  throw new Exception("데이터베이스에 연결할 수 없습니다.");
  Statement stat = con.createStatement();
  String query_sel = "INSERT INTO CRP.TB_ALTER_GRPWARE(ORGUSERID, NEWUSERID, STARTDATE, ENDDATE, FLAG, START_UP_YN, END_UP_YN, CRT_DTTM, ERR) " +
					"VALUES('"+orguserid+"','"+newuserid+"','"+startdateStr+"','"+enddateStr+"','"+flag+"','N','N',current timestamp,'N')";
  int rowNum = stat.executeUpdate(query_sel);
  if(rowNum<1){
	throw new Exception("데이터를 DB에 넣을 수 없습니다.");
	}
  
  stat.close();
  con.close();
 }
 catch(Exception e){
  out.println( e );
 }
 %>
<tr>
<td width="244" height="40" bgcolor="#220700" >
    <button style="color:white;width:60px;height:30px;FONT-SIZE:9pt; font-weight:bold;border:none;background-color:#9D8B6A" onClick="javascript:self.close();">종료</button></td>
</tr>
</table>
</body>
</html>