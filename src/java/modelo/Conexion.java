package modelo;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class Conexion {
    
    private final String ip = "localhost";
    private final String port = "3306";
    private final String bd = "tesis1";
    private final String url = "jdbc:mysql://"+ip+":"+port+"/"+bd;
    private final String user = "root";
    private final String password = "";
    
    public Connection conectar() throws ClassNotFoundException{
        
        Connection con = null;
        
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(url,user,password);
        }catch(SQLException e){
            //LOGGER.log(Level.SEVERE, "Error al conectar a la base de datos", e);
            System.out.println("Error al conectar a la base de datos" + e);
        }
        return con;
    }

}
