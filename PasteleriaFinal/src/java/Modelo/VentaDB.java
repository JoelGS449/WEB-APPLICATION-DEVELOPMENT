/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import java.sql.*;
import java.util.ArrayList;
import Utils.Conexion;
import java.security.Timestamp;
import javax.swing.JOptionPane;
/**
 *
 * @author joelg
 */
public class VentaDB {
    public static boolean insertarVenta(Venta varventa,ArrayList<DetalleVenta> d){
        boolean rpta = false;
        
        try{
            Connection cn = Conexion.getConexion();
            CallableStatement cl = cn.prepareCall("{CALL sp_RegistrarVenta(?,?)}");
            cl.registerOutParameter(1, Types.INTEGER);
            cl.setString(2, varventa.getCliente());
            int i=cl.executeUpdate();
            
            int i2=0;
            varventa.setCodigoVenta(cl.getInt(1));
            CallableStatement cl2 = cn.prepareCall("{CALL sp_RegistrarDetalle(?,?,?,?)}");
            for(DetalleVenta aux:d){
                cl2.setInt(1, varventa.getCodigoVenta());
                cl2.setInt(2, aux.getCodigoProducto());
                cl2.setDouble(3, aux.getCantidad());
                cl2.setDouble(4, aux.getDescuento());
                i2=cl2.executeUpdate();
            }
        }catch(Exception e){
            JOptionPane.showMessageDialog(null, e);
        }
        
        return rpta;
    }
    
    public static ArrayList<Venta> obtenerVentas(){
        ArrayList<Venta> lista = new ArrayList<Venta>();
        
        try{
            CallableStatement cl = Conexion.getConexion().prepareCall("{CALL sp_ventas()}");
            ResultSet rs = cl.executeQuery();
            while(rs.next()){
                Venta v = new Venta(rs.getInt(1),rs.getString(2),rs.getTimestamp(3));
                lista.add(v);
            }
        }catch(Exception e){System.out.println("ventas-->"+e);}
        
        return lista;
    }
}
