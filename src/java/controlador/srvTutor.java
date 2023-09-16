/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Conexion;
import modelo.GeneradorClaves;
import modelo.Tutores;

@WebServlet("/srvTutores")
public class srvTutor extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String nombre = request.getParameter("nombre");
        String paterno = request.getParameter("paterno");
        String materno = request.getParameter("materno");
        String curp = request.getParameter("materno");
        String correo = request.getParameter("materno");
        String telefono = request.getParameter("materno");
        String municipio = request.getParameter("materno");
        String colonia = request.getParameter("materno");
        String cp = request.getParameter("cp");
        String calle = request.getParameter("materno");
        String interior = request.getParameter("materno");
        String exterior = request.getParameter("materno");
        String ocupacion = request.getParameter("materno");
        

        String matricula = GeneradorClaves.generarClave(nombre, paterno, materno);

        Tutores tutor = null;
        Conexion con = null;
        Connection cn = null;
        Statement st = null;
        ResultSet rs = null;
        String sql = "INSERT INTO tb_tutores "
                + "(id_tutor, nombre, paterno, materno, curp, correo, telefono, municipio, colonia, cp, calle, interior, exterior, ocupacion) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try {
            cn = con.conectar();
            st = cn.createStatement();
            rs = st.executeQuery(sql);

            if (rs.next() == true) {
                
                tutor = new Tutores();
                tutor.setIdTutor(rs.getString(matricula));
                tutor.setNombre(nombre);
                tutor.setPaterno(paterno);
                tutor.setMaterno(materno);
                tutor.setCurp(curp);
                tutor.setCorreo(correo);
                tutor.setTelefono(telefono);
                tutor.setMunicipio(municipio);
                tutor.setColonia(colonia);
                tutor.setCp(cp);
                tutor.setCalle(calle);
                tutor.setInterior(Integer.parseInt(interior));
                tutor.setExterior(Integer.parseInt(exterior));
                tutor.setOcupacion(ocupacion);

                //st.executeUpdate();

                System.out.println("Datos guardados correctamente en la base de datos.");
            }
        } catch (Exception e) {
            System.err.println("Error al guardar los datos en la base de datos: " + e.getMessage());
        } 

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
