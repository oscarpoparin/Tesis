package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.Asignatura;
import modelo.DAOAdministrador;
import modelo.DAOAsignatura;

@WebServlet(name = "srvRedireccionar", urlPatterns = {"/srvRedireccionar"})
public class srvRedireccionar extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    Asignatura asig = new Asignatura();
    DAOAdministrador admindao = new DAOAdministrador();
    DAOAsignatura asigdao = new DAOAsignatura();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accion = request.getParameter("accion");
        String opcion = request.getParameter("opcion");

        if (accion != null && accion.equals("login")) {
            /*PANTALLAS ADMINISTRADOR*/

            int alumnosInscritos = admindao.alumnosInscritos();
            int alumnosEgresados = admindao.alumnosEgresados();
            int totalDocentes = admindao.totalDocentes();
            int asistencia = admindao.asistenciaTotal();

            request.setAttribute("alumnosInscritos", alumnosInscritos);
            request.setAttribute("alumnosEgresados", alumnosEgresados);
            request.setAttribute("totalDocentes", totalDocentes);
            request.setAttribute("asistencia", asistencia);

            request.getRequestDispatcher("/vistas/administrador/index.jsp").forward(request, response);

        } else if (accion != null && accion.equals("asignatura")) {
            switch (opcion) {
                case "Listar":
                    List lista = asigdao.listaAsignaturas();
                    request.setAttribute("asignatura", lista);
                    break;
                /*case "Buscar":
                    String clave = request.getParameter("txtClave");
                    String grado = request.getParameter("optGrado");
                    String turno = request.getParameter("optTurno");
                    asig.setClave(clave);
                    asig.setGrado(grado);
                    asig.setTurno(turno);
                    break;*/
                default:
                    throw new AssertionError();
            }

            request.getRequestDispatcher("/vistas/administrador/asignatura.jsp").forward(request, response);

        } else if (accion != null && accion.equals("docentes")) {
            request.getRequestDispatcher("/vistas/administrador/docentes.jsp").forward(request, response);
        } else if (accion != null && accion.equals("alumnos")) {
            request.getRequestDispatcher("/vistas/administrador/alumnos.jsp").forward(request, response);
        } else if (accion != null && accion.equals("pagos")) {
            request.getRequestDispatcher("/vistas/administrador/pagos.jsp").forward(request, response);
        } else if (accion != null && accion.equals("aprovechamiento")) {
            request.getRequestDispatcher("/vistas/administrador/aprovechamiento.jsp").forward(request, response);
        } else if (accion != null && accion.equals("calendario")) {
            request.getRequestDispatcher("/vistas/administrador/calendario.jsp").forward(request, response);
        } else if (accion != null && accion.equals("index")) {
            /*PANTALLA PROFESOR*/
            request.getRequestDispatcher("/vistas/profesor/Profesor.jsp").forward(request, response);
        } else if (accion != null && accion.equals("alumno")) {
            request.getRequestDispatcher("/vistas/profesor/alumno.jsp").forward(request, response);
        } else if (accion != null && accion.equals("grupo")) {
            request.getRequestDispatcher("/vistas/profesor/grupo.jsp").forward(request, response);
        } else if (accion != null && accion.equals("calificacion")) {
            request.getRequestDispatcher("/vistas/profesor/calificaciones.jsp").forward(request, response);
        } else if (accion != null && accion.equals("calen")) {
            request.getRequestDispatcher("/vistas/profesor/calendario.jsp").forward(request, response);
        } else if (accion != null && accion.equals("indexalumno")) {
            /*PANTALLAS ALUMNO*/
            request.getRequestDispatcher("/vistas/alumno/Alumno.jsp").forward(request, response);
        } else if (accion != null && accion.equals("aprovechamientoalumno")) {
            request.getRequestDispatcher("/vistas/alumno/aprovechamiento.jsp").forward(request, response);
        } else if (accion != null && accion.equals("calendarioalumno")) {
            request.getRequestDispatcher("/vistas/alumno/calendario.jsp").forward(request, response);
        } else if (accion != null && accion.equals("indextutor")) {
            /*PANTALLAS TUTOR*/
            request.getRequestDispatcher("/vistas/tutor/index.jsp").forward(request, response);
        } else if (accion != null && accion.equals("tutoralumno")) {
            request.getRequestDispatcher("/vistas/tutor/alumnos.jsp").forward(request, response);
        } else if (accion != null && accion.equals("calendariotutor")) {
            request.getRequestDispatcher("/vistas/tutor/calendario.jsp").forward(request, response);
        } else {
            request.setAttribute("msje", "Credenciales incorrectas");
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
