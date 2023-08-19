package modelo;

import java.sql.SQLException;


public class comprobar {

    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        Conexion con = new Conexion();
        if(con.conectar()!= null){
            System.out.println("Conexion exitosa");
        }else{
            System.out.println("error de conexion");
        }
     
    }

}
