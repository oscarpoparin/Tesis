package modelo;

import static com.sun.xml.internal.ws.spi.db.BindingContextFactory.LOGGER;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;

public class Conexion {
    
    private final String ip = "localhost";
    private final String port = "3306";
    private final String bd = "tesis";
    private final String url = "jdbc:mysql://"+ip+":"+port+"/"+bd;
    private final String user = "root";
    private final String password = "";
    
    public Connection conectar() throws ClassNotFoundException{
        
        Connection con = null;
        
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(url,user,password);
        }catch(SQLException e){
            LOGGER.log(Level.SEVERE, "Error al conectar a la base de datos", e);
        }
        return con;
    }

}
