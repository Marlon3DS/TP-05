/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.fatecpg.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author marlo
 */
public class Order {
    private int ORDER_NUM;
    private int QUANTITY;
    private String SALES_DATE;
    private List<Product> products;

    public Order(String ORDER_NUM, String QUANTITY, String SALES_DATE) {
        this.ORDER_NUM = Integer.parseInt(ORDER_NUM);
        this.QUANTITY = Integer.parseInt(QUANTITY);
        this.SALES_DATE = SALES_DATE;
        this.products = new ArrayList<>();
    }

    public int getORDER_NUM() {
        return ORDER_NUM;
    }

    public void setORDER_NUM(int ORDER_NUM) {
        this.ORDER_NUM = ORDER_NUM;
    }

    public int getQUANTITY() {
        return QUANTITY;
    }

    public void setQUANTITY(int QUANTITY) {
        this.QUANTITY = QUANTITY;
    }

    public String getSALES_DATE() {
        return SALES_DATE;
    }

    public void setSALES_DATE(String SALES_DATE) {
        this.SALES_DATE = SALES_DATE;
    }

    public List<Product> getProducts() {
        return products;
    }

    public void setProducts(ArrayList<Product> Products) {
        this.products = Products;
    }
    
    public static List<Order> getOrderListByCustomer(int customerID){
        try{
            List<Order> orders = new ArrayList<>();
            String sql = "select ORDER_NUM, QUANTITY, SALES_DATE, PRODUCT_ID from PURCHASE_ORDER where CUSTOMER_ID =" + customerID;
            Connection con = ConnectionFactory.openConnection();
            PreparedStatement stmt = con.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Order order = new Order(
                    rs.getString("ORDER_NUM"), 
                    rs.getString("QUANTITY"), 
                    rs.getString("SALES_DATE"));
                int id = Integer.parseInt(rs.getString("PRODUCT_ID"));
                order.products.add(Product.getProductById(id));
                orders.add(order);
            }
            con.close();
            stmt.close();
            rs.close();
            return orders;
        } catch(Exception e){
            return null;
        }
    }
    
    public static Order getOrderById(int orderID){
        try {
            String sql = "select ORDER_NUM, QUANTITY, SALES_DATE, PRODUCT_ID from PURCHASE_ORDER where ORDER_NUM=" + orderID;
            Connection con = ConnectionFactory.openConnection();
            PreparedStatement stmt = con.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            Order order = null;
            if (rs.next()) {
                order = new Order(
                    rs.getString("ORDER_NUM"), 
                    rs.getString("QUANTITY"), 
                    rs.getString("SALES_DATE")
                );
                int id = Integer.parseInt(rs.getString("PRODUCT_ID"));
                order.products.add(Product.getProductById(id));
                order.products.add(Product.getProductById(id));
            }
            con.close();
            stmt.close();
            rs.close();
            return order;
        } catch (Exception e) {
            return null;
        }
    }
}
