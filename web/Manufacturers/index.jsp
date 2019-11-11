<%-- 
    Document   : index.jsp
    Created on : 04/11/2019, 21:21:08
    Author     : marlo
--%>

<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="br.com.fatecpg.db.Manufacturer"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manufacturers</title>
    </head>
    <body>
        <%@include file="../WEB-INF/jspf/navbar.jspf" %>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>City/State</th>
                    <th>Email</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
        <%
            List<Manufacturer> manufacturers = Manufacturer.getManufacturerList();
            for (int i = 0; i < manufacturers.size(); i++) {%>
                <tr>
                    <td><%=manufacturers.get(i).getId()%></td>
                    <td><%=manufacturers.get(i).getName()%></td>
                    <td><%=manufacturers.get(i).getCity()%> / <%=manufacturers.get(i).getState()%></td>
                    <td><%=manufacturers.get(i).getEmail()%></td>
                    <td>
                        <a href="detalhes.jsp">detalhes</a>
                    </td>
                </tr>
        <%  }
        %>
            </tbody>
        </table>
    </body>
</html>
