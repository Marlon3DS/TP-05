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
public class Manufacturer {
    private int _id;
    private String _name;
    private String _city;
    private String _state;
    private String _email;

    public Manufacturer(String id, String name, String city, String state, String email) {
        this._id = Integer.parseInt(id);
        this._name = name;
        this._city = city;
        this._state = state;
        this._email = email;
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
    
    public static List<Manufacturer> getManufacturerList(){
        try{
            List<Manufacturer> manufacturers = new ArrayList<>();
            String sql = "select MANUFACTURER_ID, NAME, CITY, STATE, EMAIL from MANUFACTURER";
            Connection con = ConnectionFactory.openConnection();
            PreparedStatement stmt = con.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Manufacturer manufacturer = new Manufacturer(
                    rs.getString("MANUFACTURER_ID"),
                    rs.getString("NAME"),
                    rs.getString("CITY"),
                    rs.getString("STATE"),
                    rs.getString("EMAIL")
                );
                manufacturers.add(manufacturer);
            }
            rs.close();
            stmt.close();
            con.close();
            return manufacturers;
        } catch(Exception e){
            return null;
        }
    }
    
    public static Manufacturer getManufacturerById(int manufacturerID){
        try {
            String sql = "select MANUFACTURER_ID, NAME, CITY, STATE, EMAIL from MANUFACTURER where MANUFACTURER_ID =" + manufacturerID;
            Connection con = ConnectionFactory.openConnection();
            PreparedStatement stmt = con.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            Manufacturer manufacturer = null;
            if (rs.next()) {
                manufacturer = new Manufacturer(
                    rs.getString("MANUFACTURER_ID"),
                    rs.getString("NAME"),
                    rs.getString("CITY"),
                    rs.getString("STATE"),
                    rs.getString("EMAIL")
                );
            }
            con.close();
            stmt.close();
            rs.close();
            return manufacturer;
        } catch (Exception e) {
            return null;
        }
    }
    
    public static List<Product> getProducts(int manufacturerId){
        try{
            List<Product> produtos = new ArrayList<>();
            String sql = "select PRODUCT_ID, PURCHASE_COST, DESCRIPTION from PRODUCT where MANUFACTURER_ID =" + manufacturerId;
            Connection con = ConnectionFactory.openConnection();
            PreparedStatement stmt = con.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            Product product = null;
            if (rs.next()) {
                product = new Product(
                    rs.getString("PRODUCT_ID"),
                    rs.getString("PURCHASE_COST"),
                    rs.getString("DESCRIPTION")
                );
                produtos.add(product);
            }
            con.close();
            stmt.close();
            rs.close();
            return produtos;
        } catch(Exception e){
            return null;
        }
    }

    public String getCity() {
        return _city;
    }

    public void setCity(String _city) {
        this._city = _city;
    }

    public String getState() {
        return _state;
    }

    public void setState(String _state) {
        this._state = _state;
    }
}
