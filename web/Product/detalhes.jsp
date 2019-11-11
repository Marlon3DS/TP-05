<%-- 
    Document   : detalhes
    Created on : 11/11/2019, 09:12:10
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
                int productID = Integer.parseInt(request.getParameter("id"));
                Product product = Product.getProductById(productID);
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
                                <h3 class="card-title">Product</h3>
                            </div>
                            <div class="card-body">
                                <div>
                                    <div>
                                        <form>
                                            <div class="form-group">
                                                <label for="id" class="form-text">Product ID</label>
                                                <input type="text" name="id" id="id" value="<%=product.getPRODUCT_ID()%>" disabled class="form-control"/>
                                            </div>
                                            <div class="form-group">
                                                <label for="name" class="form-text">Description</label>
                                                <input type="text" name="name" id="name" value="<%=product.getDESCRIPTION()%>" disabled class="form-control"/>
                                            </div>
                                            <div class="form-group">
                                                <label for="email" class="form-text">Purchase Cost</label>
                                                <input type="email" name="email" id="email" value="<%=product.getPURCHASE_COST()%>" disabled class="form-control"/>
                                            </div>
                                            <a href="../Manufacturers/detalhes.jsp?id=<%=product.getMANUFACTURER_ID()%>" class="btn btn-primary" >go to Manufacturer</a>
                                        </form>
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
