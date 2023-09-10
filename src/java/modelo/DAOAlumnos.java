package modelo;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;


public class DAOAlumnos {

    public int datos(Alumnos al) throws Exception {
        
        int cantidadAlumnos = 0;
        Conexion con;
        Connection cn = null;
        Statement st = null;
        ResultSet rs = null;
        String sql = "SELECT COUNT(*) AS cantidad_alumnos FROM tb_alumnos;";
        con = new Conexion();

        try {

            cn = con.conectar();
            st = cn.createStatement();
            rs = st.executeQuery(sql);
            if (rs.next()) {
                cantidadAlumnos = rs.getInt("cantidad_alumnos");
            }
            
        } catch (Exception e) {
            System.out.println("Error" + e.getMessage());
        } finally {
            if (rs != null && rs.isClosed() == false) {
                rs.close();
            }
            rs = null;
            if (st != null && st.isClosed() == false) {
                st.close();
            }
            st = null;
            if (cn != null && cn.isClosed() == false) {
                cn.close();
            }
            cn = null;
        }
        
        return cantidadAlumnos;
    }
}

