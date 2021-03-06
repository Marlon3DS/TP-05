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
            <%
                int orderID = Integer.parseInt(request.getParameter("id"));
                Order order = Order.getOrderById(orderID);
            %>

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
                                <h6 class="m-0 font-weight-bold text-primary">Order</h6>
                            </div>
                            <div class="card-body">
                                <div>
                                    <div>
                                        <form>
                                            <div class="form-group">
                                                <label for="id" class="form-text">Order Number</label>
                                                <input type="text" name="id" id="id" value="<%=orderID%>" disabled class="form-control"/>
                                            </div>
                                            <div class="form-group">
                                                <label for="name" class="form-text">Quantity</label>
                                                <input type="text" name="name" id="name" value="<%=order.getQUANTITY()%>" disabled class="form-control"/>
                                            </div>
                                            <div class="form-group">
                                                <label for="email" class="form-text">Sales Date</label>
                                                <input type="email" name="email" id="email" value="<%=order.getSALES_DATE()%>" disabled class="form-control"/>
                                            </div>
                                        </form>
                                        <div>
                                            <table class="table table-bordered table-responsive" id="dataTable" width="100%" cellspacing="0">
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