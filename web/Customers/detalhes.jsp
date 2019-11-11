<%-- 
    Document   : Detalhes
    Created on : 04/11/2019, 22:52:19
    Author     : marlo
--%>

<%@page import="br.com.fatecpg.db.Order"%>
<%@page import="br.com.fatecpg.db.Customer"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detalhes - Customer</title>
    </head>
    <body>
        <%
            int customerID = Integer.parseInt(request.getParameter("id"));
            Customer customer = Customer.getCustomerById(customerID);
        %>
        <div>
            <form>
                <div>
                    <label for="id">ID</label>
                    <input type="text" name="id" id="id" value="<%=customer.getId()%>"/>
                </div>
                <div>
                    <label for="name">Name</label>
                    <input type="text" name="name" id="name" value="<%=customer.getName()%>"/>
                </div>
                <div>
                    <label for="email">Email</label>
                    <input type="email" name="email" id="email" value="<%=customer.getEmail()%>"/>
                </div>
            </form>
            <table>
                <caption>Pedidos</caption>
                <thead>
                    <tr>
                        <th>Order Number</th>
                        <th>Quantity</th>
                        <th>Sales Date</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                <%
                    List<Order> orders = customer.getOrders();
                    for (int i = 0; i < orders.size(); i++) {%>
                        <tr>
                            <td><%=orders.get(i).getORDER_NUM()%></td>
                            <td><%=orders.get(i).getQUANTITY()%></td>
                            <td><%=orders.get(i).getSALES_DATE()%></td>
                            <td>
                                <a href="../Order/detalhes.jsp?id=<%=orders.get(i).getORDER_NUM()%>">detalhes</a>
                            </td>
                        </tr>
                <%  }
                %>
                </tbody>
            </table>
        </div>
    </body>
</html>
