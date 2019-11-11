<%-- 
    Document   : Detalhes
    Created on : 04/11/2019, 22:52:19
    Author     : marlo
--%>

<%@page import="br.com.fatecpg.db.Order"%>
<%@page import="br.com.fatecpg.db.Customer"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int customerID = Integer.parseInt(request.getParameter("id"));
    Customer customer = Customer.getCustomerById(customerID);
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <%@include file="../WEB-INF/jspf/head.jspf"%>
    </head>

    <body id="page-top">

        <!-- Page Wrapper -->
        <div id="wrapper">

            <!-- Sidebar -->
            <%@include file="../WEB-INF/jspf/sidebar.jspf"%>
            <!-- End of Sidebar -->

            <!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column">

                <!-- Main Content -->
                <div id="content">

                    <!-- Topbar -->
                    <%@include file="../WEB-INF/jspf/topbar.jspf"%>
                    <!-- End of Topbar -->

                    <!-- Begin Page Content -->
                    <div class="container-fluid">

                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">Customer</h6>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <div>
                                        <form>
                                            <div>
                                                <label for="id">ID</label>
                                                <input type="text" name="id" id="id" value="<%=customer.getId()%>" disabled/>
                                            </div>
                                            <div>
                                                <label for="name">Name</label>
                                                <input type="text" name="name" id="name" value="<%=customer.getName()%>" disabled/>
                                            </div>
                                            <div>
                                                <label for="email">Email</label>
                                                <input type="email" name="email" id="email" value="<%=customer.getEmail()%>" disabled/>
                                            </div>
                                        </form>
                                        <div class="table-responsive">
                                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
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
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- /.container-fluid -->

                    </div>
                    <!-- End of Main Content -->

                    <!-- Footer -->
                    <%@include file="../WEB-INF/jspf/footer.jspf"%>
                    <!-- End of Footer -->

                </div>
                <!-- End of Content Wrapper -->

            </div>
            <!-- End of Page Wrapper -->

            <!-- Scroll to Top Button-->
            <a class="scroll-to-top rounded" href="#page-top">
                <i class="fas fa-angle-up"></i>
            </a>

            <%@include file="../WEB-INF/jspf/scripts.jspf"%>

    </body>

</html>
