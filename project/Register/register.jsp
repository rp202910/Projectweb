<%@ page import="java.sql.*"%>
<%
String name=request.getParameter("name");
String password=request.getParameter("pass");

try{

 Thread.sleep(2000);
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection connection=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","Roshan@2000");

  String q="insert into project(name,passsword) values(?,?)";
  
   PreparedStatement stmt=connection.prepareStatement(q);
   stmt.setString(1,name);
   stmt.setString(2,password);

   stmt.executeUpdate();  

    out.println("success");
}
catch(Exception e){
    out.println(e);
}


%>
