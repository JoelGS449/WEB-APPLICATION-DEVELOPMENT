/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package Utils;


import java.sql.*;

/**
 *
 * @author joelg
 */
public class Conexion {
    
    public static Connection getConexion(){
        Connection cn = null;
        
        try{
            Class.forName("com.mysql.jdbc.Driver");
            cn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/bdcarrito","root","");
            System.out.println("Conexion exitosa");
        }catch(Exception e){
            System.out.println("Error de conexion: "+e);
        }
        return cn;
    }
    
    public static void main(String[] args) {    
        Conexion.getConexion();
    }
    
}
