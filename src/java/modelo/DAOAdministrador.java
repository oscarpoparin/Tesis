package modelo;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class DAOAdministrador {

    Conexion con;
    Connection cn = null;
    Statement st = null;
    ResultSet rs = null;

    public int alumnosInscritos() {

        int inscritos = 0;
        String sql = "SELECT COUNT(*) FROM tb_alumnos WHERE estatus=1;";
        con = new Conexion();

        try {

            cn = con.conectar();
            st = cn.createStatement();
            rs = st.executeQuery(sql);

            if (rs.next()) {
                inscritos = rs.getInt(1);
            }

            rs.close();
            st.close();

        } catch (Exception e) {
            
            e.printStackTrace();
            System.err.println("Se ha producido una excepción: " + e.getMessage());
            
        }

        return inscritos;
    }

    public int alumnosEgresados() {

        int egresados = 0;
        String sql = "SELECT COUNT(*) FROM tb_alumnos WHERE estatus=2;";
        con = new Conexion();

        try {

            cn = con.conectar();
            st = cn.createStatement();
            rs = st.executeQuery(sql);

            if (rs.next()) {
                egresados = rs.getInt(1);
            }

            rs.close();
            st.close();

        } catch (Exception e) {
            
            e.printStackTrace();
            System.err.println("Se ha producido una excepción: " + e.getMessage());
            
        }

        return egresados;
    }

    public int totalDocentes() {

        int profesores = 0;
        String sql = "SELECT COUNT(*) FROM tb_profesores;";
        con = new Conexion();

        try {

            cn = con.conectar();
            st = cn.createStatement();
            rs = st.executeQuery(sql);

            if (rs.next()) {
                profesores = rs.getInt(1);
            }

            rs.close();
            st.close();

        } catch (Exception e) {
            
            e.printStackTrace();
            System.err.println("Se ha producido una excepción: " + e.getMessage());
            
        }

        return profesores;
    }

    public int asistenciaTotal() {

        int asistencia = 0;
        String fecha = fecha();
        String sql = "SELECT * FROM VistaAsistenciaTotal WHERE fecha= '" + fecha + "';";
        con = new Conexion();

         try {

            cn = con.conectar();
            st = cn.createStatement();
            rs = st.executeQuery(sql);

            if (rs.next()) {
                asistencia = rs.getInt(1); 
            }

            rs.close();
            st.close();

        } catch (Exception e) {
            
            e.printStackTrace();
            System.err.println("Se ha producido una excepción: " + e.getMessage());
            
        }
         
        return asistencia;
    }

    public String fecha() {

        LocalDate fechaActual = LocalDate.now();
        DateTimeFormatter formatoFecha = DateTimeFormatter.ofPattern("dd-MM-yyyy");
        String fechaFormateada = fechaActual.format(formatoFecha);

        return fechaFormateada;
    }

}
