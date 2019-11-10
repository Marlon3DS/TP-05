/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.fatecpg.db;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author marlo
 */
public class ConnectionFactory {
    public static Connection openConnection() throws Exception{
        String url = "jdbc:derby://localhost:1527/sample";
        String user = "app";
        String password = "app";
        Class.forName("org.apache.derby.jdbc.ClientDriver");
        return DriverManager.getConnection(url, user, password);
    }
}
