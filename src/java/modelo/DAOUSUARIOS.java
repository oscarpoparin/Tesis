
package modelo;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;


public class DAOUSUARIOS {
     public Usuarios identificar(Usuarios user) throws Exception{
        
        Usuarios usu = null;
        Conexion con;
        Connection cn = null;
        Statement st = null;
        ResultSet rs = null;
        String sql = "SELECT u.nombre, u.paterno, u.materno, u.identificador, u.correo, r.descripcion FROM tb_roles r INNER JOIN tb_usuarios u ON r.rol = u.rol "
                + "WHERE u.correo='"+ user.getCorreo() +"' AND u.identificador='"+ user.getIdentificador() +"';";
        con = new Conexion();
        try{
            
            cn = con.conectar();
            st = cn.createStatement();
            rs = st.executeQuery(sql);
            
            if(rs.next() == true){
                usu = new Usuarios();
                usu.setNombre(rs.getString("nombre"));
                usu.setPaterno(rs.getString("paterno"));
                usu.setMaterno(rs.getString("materno"));
                usu.setCorreo(user.getCorreo());
                usu.setRol(new Roles());
                usu.getRol().setDescripcion(rs.getString("descripcion"));
            }
        
        }catch(Exception e){
            System.out.println("Error" + e.getMessage());
        }finally{
            if(rs != null && rs.isClosed() == false){
                rs.close();
            }
            rs = null;
            if(st != null && st.isClosed() == false){
                st.close();
            }
            st = null;
            if(cn != null && cn.isClosed() == false){
                cn.close();
            }
            cn = null;
        }
        return usu;
    }
}
