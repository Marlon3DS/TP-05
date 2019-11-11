<%-- 
    Document   : orderDetalhes
    Created on : 10/11/2019, 22:11:19
    Author     : marlo
--%>

<%@page import="br.com.fatecpg.db.Product"%>
<%@page import="br.com.fatecpg.db.Order"%>
<%@page import="br.com.fatecpg.db.Customer"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detalhes - Order</title>
    </head>
    <body>
        <%@include file="../WEB-INF/jspf/navbar.jspf" %>
        <%
            int orderID = Integer.parseInt(request.getParameter("id"));
            Order order = Order.getOrderById(orderID);
        %>
        <div>
            <form>
                <div>
                    <label for="id">ID</label>
                    <input type="text" name="id" id="id" value="<%=orderID%>"/>
                </div>
                <div>
                    <label for="name">Name</label>
                    <input type="text" name="name" id="name" value="<%=order.getQUANTITY()%>"/>
                </div>
                <div>
                    <label for="email">Email</label>
                    <input type="email" name="email" id="email" value="<%=order.getSALES_DATE()%>"/>
                </div>
            </form>
            <table>
                <caption>Pedidos</caption>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Description</th>
                        <th>Cost</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                <%
                    List<Product> products = order.getProducts();
                    for (int i = 0; i < products.size(); i++) {%>
                        <tr>
                            <td><%=products.get(i).getPRODUCT_ID()%></td>
                            <td><%=products.get(i).getDESCRIPTION()%></td>
                            <td><%=products.get(i).getPURCHASE_COST()%></td>
                            <td>
                                <a href="../Product/detalhes.jsp?id=<%=products.get(i).getPRODUCT_ID()%>">detalhes</a>
                            </td>
                        </tr>
                <%  }
                %>
                </tbody>
            </table>
        </div>
    </body>
</html>
