package modelo;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class DAOAsignatura {

    Conexion con;
    Connection cn = null;
    Statement st = null;
    ResultSet rs = null;

    public List listaAsignaturas() {

        String sql = "SELECT * FROM tb_asignaturas1;";
        List<Asignatura> listaAsignatura = new ArrayList<>();
        con = new Conexion();

        try {

            cn = con.conectar();
            st = cn.createStatement();
            rs = st.executeQuery(sql);

            while (rs.next()) {

                Asignatura as = new Asignatura();
                as.setClave(rs.getString(1));
                as.setNombre(rs.getString(2));
                as.setGrado(rs.getString(3));
                as.setTurno(rs.getString(4));
                listaAsignatura.add(as);

            }

        } catch (Exception e) {

            e.printStackTrace();
            System.err.println("Se ha producido una excepción: " + e.getMessage());

        }

        return listaAsignatura;
    }

    /*Metodo para filtar en la tabla apartir de la clave,grado, turno */
    public List listaAsignaturaSearch(String clave, String grado, String turno) {

        String sql = "SELECT * FROM VistaAsignaturas WHERE clave='" + clave + ";"; //1 registro
        boolean valorTurno = turno.equalsIgnoreCase("matutino");
        String sql1 = "SELECT * FROM VistaAsignaturas WHERE clave='" + grado + " AND turno='" + valorTurno + ";"; // varios registros

        List<Asignatura> listaAsignatura = new ArrayList<>();
        con = new Conexion();

        try {

            if (clave != null) {
                cn = con.conectar();
                st = cn.createStatement();
                rs = st.executeQuery(sql);

                while (rs.next()) {

                    Asignatura as = new Asignatura();
                    as.setClave(rs.getString(1));
                    as.setNombre(rs.getString(2));
                    as.setGrado(rs.getString(3));
                    as.setTurno(rs.getString(4));
                    listaAsignatura.add(as);

                }
            } else {
                cn = con.conectar();
                st = cn.createStatement();
                rs = st.executeQuery(sql1);

                while (rs.next()) {

                    Asignatura as = new Asignatura();
                    as.setClave(rs.getString(1));
                    as.setNombre(rs.getString(2));
                    as.setGrado(rs.getString(3));
                    as.setTurno(rs.getString(4));
                    listaAsignatura.add(as);

                }
            }

        } catch (Exception e) {

            e.printStackTrace();
            System.err.println("Se ha producido una excepción: " + e.getMessage());

        }

        return listaAsignatura;

    }

}
