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
public class Customer {
    private int _id;
    private String _name;
    private String _email;
    private List<Order> _orders;

    public Customer(String id, String _name, String _email) {
        this._id = Integer.parseInt(id);
        this._name = _name;
        this._email = _email;
        this._orders = new ArrayList<>();
    }

    public int getId() {
        return _id;
    }

    public void setId(int id) {
        this._id = id;
    }

    public String getName() {
        return _name;
    }

    public void setName(String name) {
        this._name = name;
    }

    public String getEmail() {
        return _email;
    }

    public void setEmail(String email) {
        this._email = email;
    }

    public List<Order> getOrders() {
        return _orders;
    }

    public void setOrders(ArrayList<Order> _orders) {
        this._orders = _orders;
    }
   
    public static List<Customer> getCustomerList(){
        try{
            List<Customer> customers = new ArrayList<>();
            String sql = "select CUSTOMER_ID, NAME, EMAIL from CUSTOMER";
            Connection con = ConnectionFactory.openConnection();
            PreparedStatement stmt = con.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Customer customer = new Customer(
                    rs.getString("CUSTOMER_ID"),
                    rs.getString("NAME"),
                    rs.getString("EMAIL")
                );
                customers.add(customer);
            }
            con.close();
            stmt.close();
            rs.close();
            return customers;
        } catch(Exception e){
            return null;
        }
    }
    
    public static Customer getCustomerById(int customerID){
        try {
            String sql = "select CUSTOMER_ID, NAME, EMAIL from CUSTOMER where CUSTOMER_ID =" + customerID;
            Connection con = ConnectionFactory.openConnection();
            PreparedStatement stmt = con.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            Customer customer = null;
            if (rs.next()) {
                customer = new Customer(
                    rs.getString("CUSTOMER_ID"),
                    rs.getString("NAME"),
                    rs.getString("EMAIL")
                );
                customer._orders = Order.getOrderListByCustomer(customer._id);
            }
            con.close();
            stmt.close();
            rs.close();
            return customer;
        } catch (Exception e) {
            return null;
        }
    }
}
