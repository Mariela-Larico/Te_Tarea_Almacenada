package com.emergentes.te_tarea_almacenada;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "SessionServlet", urlPatterns = {"/SessionServlet"})
public class SessionServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
         String op = request.getParameter("op");
        if (op.equals("vaciar")) {
            // Vaciar Lista de Actividades
            HttpSession ses = request.getSession();
            ses.invalidate();
            response.sendRedirect("index.jsp");
        }
        if (op.equals("eliminar")) {
            int pos = -1;
            int buscado = -1;
            int id = Integer.parseInt(request.getParameter("id"));
            // Eliminar una tarea
            HttpSession ses = request.getSession();
            ArrayList<Tareas> lis = (ArrayList<Tareas>) ses.getAttribute("lista");

            for (Tareas t : lis) {
                pos++;
                if (t.getId() == id) {
                    buscado = pos;
                }
            }
            lis.remove(buscado);
            response.sendRedirect("ListadoTareas.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        String tarea = request.getParameter("tarea");
        
        Tareas ta = new Tareas();

        ta.setId(id);
        ta.setTarea(tarea);
        
        HttpSession ses = request.getSession();

        ArrayList<Tareas> lis = (ArrayList<Tareas>) ses.getAttribute("lista");

        lis.add(ta);

        response.sendRedirect("ListadoTareas.jsp");
    }
}
