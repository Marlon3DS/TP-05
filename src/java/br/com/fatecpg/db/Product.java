/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.fatecpg.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author marlo
 */
public class Product {
    private int PRODUCT_ID;
    private float PURCHASE_COST;
    private String DESCRIPTION;
    private int MANUFACTURER_ID;

    public Product(String PRODUCT_ID, String PURCHASE_COST, String DESCRIPTION, String MANUFACTURER_ID) {
        this.PRODUCT_ID = Integer.parseInt(PRODUCT_ID);
        this.PURCHASE_COST = Float.parseFloat(PURCHASE_COST);
        this.DESCRIPTION = DESCRIPTION;
        this.MANUFACTURER_ID = Integer.parseInt(MANUFACTURER_ID);
    }

    public String getDESCRIPTION() {
        return DESCRIPTION;
    }

    public void setDESCRIPTION(String DESCRIPTION) {
        this.DESCRIPTION = DESCRIPTION;
    }

    public int getPRODUCT_ID() {
        return PRODUCT_ID;
    }

    public void setPRODUCT_ID(int PRODUCT_ID) {
        this.PRODUCT_ID = PRODUCT_ID;
    }

    public float getPURCHASE_COST() {
        return PURCHASE_COST;
    }

    public void setPURCHASE_COST(float PURCHASE_COST) {
        this.PURCHASE_COST = PURCHASE_COST;
    }
    
    public static Product getProductById(int productID){
        try{
            String sql = "select PRODUCT_ID, PURCHASE_COST, DESCRIPTION, MANUFACTURER_ID from PRODUCT where PRODUCT_ID =" + productID;
            Connection con = ConnectionFactory.openConnection();
            PreparedStatement stmt = con.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            Product product = null;
            if (rs.next()) {
                product = new Product(
                    rs.getString("PRODUCT_ID"),
                    rs.getString("PURCHASE_COST"),
                    rs.getString("DESCRIPTION"),
                    rs.getString("MANUFACTURER_ID")
                );
            }
            con.close();
            stmt.close();
            rs.close();
            return product;
        } catch(Exception e){
            return null;
        }
    }

    public int getMANUFACTURER_ID() {
        return MANUFACTURER_ID;
    }

    public void setMANUFACTURER_ID(int MANUFACTURER_ID) {
        this.MANUFACTURER_ID = MANUFACTURER_ID;
    }
    
}
