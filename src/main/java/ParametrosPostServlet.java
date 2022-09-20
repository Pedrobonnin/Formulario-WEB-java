

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.RequestDispatcher;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@WebServlet("/registro")

public class ParametrosPostServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        resp.setContentType("text/html");

        PrintWriter out = resp.getWriter();


        String nombre = req.getParameter("usuario");
        String apellido = req.getParameter("apellido");
        String password = req.getParameter("password");
        String email = req.getParameter("email");
        String telefono = req.getParameter("telefono");
        String pais = req.getParameter("pais");
        String lenguaje = req.getParameter("lenguajes");

        String[] roles = req.getParameterValues("roles");

        List<String> errores = new ArrayList<>();
        if (nombre == null || nombre.isEmpty()) {

            errores.add("La clave no puede ser vacio");
        }

        if (apellido == null || apellido.isEmpty()) {

            errores.add("La clave no puede ser vacio");
        }

        if (password == null || password.isEmpty()) {

            errores.add("La clave no puede ser vacio");
        }

        if (errores.isEmpty()) {


            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<meta charset=\"UTF-8\">");
            out.println("<title>Parametros get de la URL</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Parametros get de la url</h1>");
            out.println("<h2>El usuario es: " + nombre + " " + " " + " " + apellido + "</h2>");
            out.println("<h2>Su contraseña es:  " + password + " </h2>");
            out.println("<h2>Su email es:  " + email + " </h2>");
            out.println("<h2>Su telefono es :  " + telefono + "</h2>");
            out.println("<h2>Pais :  " + pais + "</h2>");
            out.println("<li>Role :  <ul>");
            Arrays.asList(roles).forEach(role -> {
                out.println("    <li>:" + role + "</li>");
            });
            out.println("</ul></li>");
            out.println("<h2>Lenguajes:  " + lenguaje + " </h2>");
            out.println("</body>");
            out.println("</html>");
            out.close();
        /*
        }else {
            errores.forEach(error -> {
                out.println("    <li>:" + error + "</li>");
            });
        }
        */
        } else {

            req.setAttribute("errores",errores);//atributos de request. Nos permiten pasar datos de un servlet a una JSP o de servlet a servlet

            //Redireccionamos a la JSP desde el servlet
            getServletContext().getRequestDispatcher("/index.jsp").forward(req, resp);//metodo para cargar la JSP-> forward

        }
    }
}

