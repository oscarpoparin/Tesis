package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.Alumnos;
import modelo.Asignatura;
import modelo.DAOAdministrador;
import modelo.DAOAlumnos;
import modelo.DAOAsignatura;
import modelo.DAOUSUARIOS;
import modelo.Usuarios;

@WebServlet(name = "srvUsuario", urlPatterns = {"/srvUsuario"})
public class srvUsuario extends HttpServlet {

    Asignatura asig = new Asignatura();
    DAOAdministrador admindao = new DAOAdministrador();
    DAOAsignatura asigdao = new DAOAsignatura();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String accion = request.getParameter("accion");
        try {

            if (accion != null) {
                switch (accion) {
                    case "verificar":
                        verificar(request, response);
                        break;
                    case "cerrar":
                        cerrarsession(request, response);
                        break;
                    default:
                        response.sendRedirect("login.jsp");
                }
            } else {
                response.sendRedirect("login.jsp");
            }

        } catch (Exception e) {
            try {
                this.getServletConfig().getServletContext().getRequestDispatcher("/mensaje.jsp").forward(request, response);
            } catch (Exception ex) {
                System.out.println("Error" + ex.getMessage());
            }
            System.out.println("Error" + e.getMessage());
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

    private void verificar(HttpServletRequest request, HttpServletResponse response) throws Exception {

        HttpSession sesion;
        DAOUSUARIOS dao;
        Usuarios usuario;
        usuario = this.obtenerUsuario(request);
        dao = new DAOUSUARIOS();
        usuario = dao.identificar(usuario);
        if (usuario != null && usuario.getRol().getDescripcion().equals("Administrador")) {
            sesion = request.getSession();
            sesion.setAttribute("usuario", usuario);
            int alumnosInscritos = admindao.alumnosInscritos();
            int alumnosEgresados = admindao.alumnosEgresados();
            int totalDocentes = admindao.totalDocentes();
            int asistencia = admindao.asistenciaTotal();
            request.setAttribute("alumnosInscritos", alumnosInscritos);
            request.setAttribute("alumnosEgresados", alumnosEgresados);
            request.setAttribute("totalDocentes", totalDocentes);
            request.setAttribute("asistencia", asistencia);
            this.getServletConfig().getServletContext().getRequestDispatcher("/vistas/administrador/index.jsp").forward(request, response);
        } else if (usuario != null && usuario.getRol().getDescripcion().equals("Alumno")) {
            sesion = request.getSession();
            sesion.setAttribute("alumno", usuario);
            request.setAttribute("msje", "Bievenido al sistema");
            this.getServletConfig().getServletContext().getRequestDispatcher("/vistas/alumno/Alumno.jsp").forward(request, response);

        } else if (usuario != null && usuario.getRol().getDescripcion().equals("Profesor")) {
            sesion = request.getSession();
            sesion.setAttribute("profesor", usuario);
            request.setAttribute("msje", "Bievenido al sistema");
            this.getServletConfig().getServletContext().getRequestDispatcher("/vistas/profesor/Profesor.jsp").forward(request, response);
        } else if (usuario != null && usuario.getRol().getDescripcion().equals("Tutor")) {
            sesion = request.getSession();
            sesion.setAttribute("tutor", usuario);
            request.setAttribute("msje", "Bievenido al sistema");
            this.getServletConfig().getServletContext().getRequestDispatcher("/vistas/tutor/index.jsp").forward(request, response);
        } else {
            request.setAttribute("msje", "Credenciales incorrectas");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }

    }

    private void cerrarsession(HttpServletRequest request, HttpServletResponse response) throws Exception {

        HttpSession sesion = request.getSession();
        DAOUSUARIOS dao;
        Usuarios usuario;
        usuario = this.obtenerUsuario(request);
        dao = new DAOUSUARIOS();
        usuario = dao.identificar(usuario);
        if (usuario != null && usuario.getRol().getDescripcion().equals("Administrador")) {
            sesion.setAttribute("usuario", null);
            sesion.invalidate();
            response.sendRedirect("login.jsp");
        } else if (usuario != null && usuario.getRol().getDescripcion().equals("Alumno")) {
            sesion.setAttribute("alumno", null);
            sesion.invalidate();
            response.sendRedirect("login.jsp");
        } else if (usuario != null && usuario.getRol().getDescripcion().equals("Profesor")) {
            sesion.setAttribute("profesor", null);
            sesion.invalidate();
            response.sendRedirect("login.jsp");
        } else if (usuario != null && usuario.getRol().getDescripcion().equals("Tutor")) {
            sesion.setAttribute("tutor", null);
            sesion.invalidate();
            response.sendRedirect("login.jsp");
        } else {
            sesion.invalidate();
            response.sendRedirect("login.jsp");
        }

    }

    private Usuarios obtenerUsuario(HttpServletRequest request) {
        Usuarios u = new Usuarios();
        u.setCorreo(request.getParameter("username"));
        u.setIdentificador(request.getParameter("password"));
        return u;
    }

}
