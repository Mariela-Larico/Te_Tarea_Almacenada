<%@page import="java.util.ArrayList"%>
<%@page import="com.emergentes.te_tarea_almacenada.Tareas"%>
<%
    if (session.getAttribute("lista") == null){
        ArrayList<Tareas> lisaux = new ArrayList<Tareas>();
        session.setAttribute("lista", lisaux);
    }
    
    ArrayList<Tareas> lista = (ArrayList<Tareas>)session.getAttribute("lista");
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tareas Pendientes</title>
    </head>
    <body>

        <h2>TAREAS PENDIENTES </h2>
        <br>
        <a href="index.jsp"><input type="button" value="Nueva Tarea"></a>
        <br>
        <table border="1">
            <tr>
                <th> ID </th>
                <th>TAREA</th>
                <th>COMPLETADO</th>
                <th>PROCESO</th>
            </tr>
            <%
                if (lista != null){
                    for (Tareas t : lista){
            %>
            <tr>
                <td><%= t.getId() %></td>
                <td><%= t.getTarea() %></td>
                <td><input type="checkbox" name="completado" value="ON" /></td>
                
                <td><a href="SessionServlet?op=eliminar&id=<%= t.getId() %>">Eliminar</a></td>
            </tr>
            <%
                    }
                }  
            %>
        </table>
        <br>
       <a href="SessionServlet?op=vaciar">Vaciar Lista</a>
    </body>
</html>
