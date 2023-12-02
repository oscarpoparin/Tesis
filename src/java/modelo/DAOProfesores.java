package modelo;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import modelo.GeneradorClaves;

public class DAOProfesores {

    Conexion con;
    Connection cn = null;
    Statement st = null;
    ResultSet rs = null;
    int resp;

    public List listaDocentes() {

        String sql = "SELECT * FROM tbprofeso;";
        List<Profesores> listaDocente = new ArrayList<>();
        con = new Conexion();

        try {

            cn = con.conectar();
            st = cn.createStatement();
            rs = st.executeQuery(sql);

            while (rs.next()) {

                Profesores p = new Profesores();
                p.setIdProfesor(rs.getString(1));
                p.setNombre(rs.getString(2));
                p.setPaterno(rs.getString(3));
                p.setMaterno(rs.getString(4));
                p.setFechaNacimiento(rs.getDate(5));
                p.setEdad(rs.getInt(6));
                p.setCurp(rs.getString(7));
                p.setRfc(rs.getString(8));
                p.setCorreo(rs.getString(9));
                p.setTelefono(rs.getString(10));
                p.setMunicipio(rs.getString(11));
                p.setCp(rs.getString(12));
                p.setColonia(rs.getString(13));
                p.setCalle(rs.getString(14));
                p.setNumExterior(rs.getString(15));
                p.setNuminterior(rs.getString(16));
                listaDocente.add(p);

            }

        } catch (Exception e) {

            e.printStackTrace();
            System.err.println("Se ha producido una excepción: " + e.getMessage());

        }

        return listaDocente;
    }

    public List listaTablaDocentes() {
        String sql = "SELECT * FROM tbprofesor;";
        List<TablaDocente> tbDocente = new ArrayList<>();
        con = new Conexion();

        try {

            cn = con.conectar();
            st = cn.createStatement();
            rs = st.executeQuery(sql);

            while (rs.next()) {
                TablaDocente tbDoc = new TablaDocente();
                tbDoc.setNombre(rs.getString(2));
                tbDoc.setPaterno(rs.getString(3));
                tbDoc.setMaterno(rs.getString(4));
                tbDoc.setNombre(rs.getString(5));
                tbDoc.setGrado(rs.getString(6));
                tbDoc.setTurno(rs.getString(7));
                tbDocente.add(tbDoc);
            }

        } catch (Exception e) {

            e.printStackTrace();
            System.err.println("Se ha producido una excepción: " + e.getMessage());

        }

        return tbDocente;
    }

    public int calcularEdad(Date fechaNacimiento) {

        Calendar fechaNac = Calendar.getInstance();
        fechaNac.setTime(fechaNacimiento);
        Calendar fechaActual = Calendar.getInstance();
        int edad = fechaActual.get(Calendar.YEAR) - fechaNac.get(Calendar.YEAR);

        if (fechaActual.get(Calendar.MONTH) < fechaNac.get(Calendar.MONTH)
                || (fechaActual.get(Calendar.MONTH) == fechaNac.get(Calendar.MONTH)
                && fechaActual.get(Calendar.DAY_OF_MONTH) < fechaNac.get(Calendar.DAY_OF_MONTH))) {
            edad--;
        }
        return edad;

    }

    public int addProfesor(Profesores pr) {

        Connection cn = null;
        PreparedStatement ps = null;

        try {

            cn = con.conectar();

            String sql = "INSERT INTO tb_profesores (id_profesor, nombre, paterno, materno, fecha_nacimiento, edad, curp, rfc, correo, telefono, id_municipio, rol)"
                    + " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            ps = cn.prepareStatement(sql);

            ps.setString(7, pr.getCurp());
            ps.setString(8, pr.getRfc());
            ps.setString(9, pr.getCorreo());
            ps.setString(10, pr.getMunicipio());
            ps.setString(11, pr.getNombre());
            ps.setString(12, pr.getNombre());

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return resp;
    }

    public Profesores listarid(String id) {
        Connection cn = null;
        PreparedStatement ps = null;
        Profesores p = new Profesores();
        String sql = "SELECT * FROM tb_profesores WHERE id_profesor=" + id;
        try {
            cn = con.conectar();
            st = cn.createStatement();
            rs = st.executeQuery(sql);
            while(rs.next()){
                p.setIdProfesor(rs.getString(1));
                p.setNombre(rs.getString(2));
                p.setPaterno(rs.getString(3));
                p.setMaterno(rs.getString(4));
                p.setFechaNacimiento(rs.getDate(5));
                p.setEdad(rs.getInt(6));
                p.setCurp(rs.getString(7));
                p.setRfc(rs.getString(8));
                p.setCorreo(rs.getString(9));
                p.setTelefono(rs.getString(10));
                p.setMunicipio(rs.getString(11));
                p.setRol(rs.getInt(12));
                p.setAsignatura(rs.getString(13)); 
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return p;
    }

    public int asignar(Profesores pr) {

        Connection cn = null;
        PreparedStatement ps = null;

        String sql = "UPDATE tb_profesores SET clave=? WHERE id_profesor=?";

        try {
            cn = con.conectar();
            ps = cn.prepareStatement(sql);
            ps.setString(1, pr.getAsignatura());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            System.err.println("Se ha producido una excepción: " + e.getMessage());
        }
        return resp;
    }

    public void delete(String id) {
        Connection cn = null;
        PreparedStatement ps = null;
        String sql = "DELETE FROM tb_profesores WHERE id_profesor=" + id;
        try {
            cn = con.conectar();
            ps = cn.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public int asistencia() {

        return 0;
    }

}


    