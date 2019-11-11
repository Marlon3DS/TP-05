<%-- 
    Document   : detalhes
    Created on : 10/11/2019, 19:44:08
    Author     : marlo
--%>

<%@page import="br.com.fatecpg.db.Manufacturer"%>
<%@page import="br.com.fatecpg.db.Product"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
                int manufacturerID = Integer.parseInt(request.getParameter("id"));
                Manufacturer manufacturer = Manufacturer.getManufacturerById(manufacturerID);
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
                                <h3 class="card-title">Manufacturer</h3>
                            </div>
                            <div class="card-body">
                                <div>
                                    <div>
                                        <form>
                                            <div class="form-group">
                                                <label for="id" class="form-text">ID</label>
                                                <input type="text" name="id" id="id" value="<%=manufacturer.getId()%>" disabled class="form-control"/>
                                            </div>
                                            <div class="form-group">
                                                <label for="name" class="form-text">Name</label>
                                                <input type="text" name="name" id="name" value="<%=manufacturer.getName()%>" disabled class="form-control"/>
                                            </div>
                                            <div class="form-group">
                                                <label for="email" class="form-text">Email</label>
                                                <input type="email" name="email" id="email" value="<%=manufacturer.getEmail()%>" disabled class="form-control"/>
                                            </div>
                                        </form>
                                        <div>
                                            <table class="table table-bordered table-responsive" id="dataTable" width="100%" cellspacing="0">
                                                <tr>
                                                    <th>Product Number</th>
                                                    <th>Purchase Cost</th>
                                                    <th>Description</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                    <%
                                                        List<Product> products = manufacturer.getProducts(manufacturerID);
                                                        for (int i = 0; i < products.size(); i++) {%>
                                                    <tr>
                                                        <td><%=products.get(i).getPRODUCT_ID()%></td>
                                                        <td><%=products.get(i).getPURCHASE_COST()%></td>
                                                        <td><%=products.get(i).getDESCRIPTION()%></td>
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
