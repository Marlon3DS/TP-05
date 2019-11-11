j<%-- 
    Document   : index.jsp
    Created on : 04/11/2019, 21:09:02
    Author     : marlo
--%>

<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="br.com.fatecpg.db.Customer"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customers</title>
    </head>
    <body>
        <%@include file="../WEB-INF/jspf/navbar.jspf" %>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
        <%
            List<Customer> customers = Customer.getCustomerList();
            for (int i = 0; i < customers.size(); i++) {%>
                <tr>
                    <td><%=customers.get(i).getId()%></td>
                    <td><%=customers.get(i).getName()%></td>
                    <td><%=customers.get(i).getEmail()%></td>
                    <td>
                        <a href="detalhes.jsp?id=<%=customers.get(i).getId()%>">detalhes</a>
                    </td>
                </tr>
        <%  }
        %>
            </tbody>
        </table>
    </body>
</html>
