
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
        <title>Tareas y listado</title>
    </head>
    <body>
         <h1>REGISTRO DE ACTIVIDADES</h1>
        <form action="SessionServlet" method="post">
            <table>
                <tr>
                    <td>Id : </td>
                    <td><input type="text" name="id" value="0" size="4"></td>
                </tr>
                <tr>
                    <td>Tarea : </td>
                    <td><input type="text" name="tarea" value="" ></td>
                </tr>
               
                <tr>
                    <td></td>
                    <td><input type="submit"  value="Procesar" /></td>
                </tr>
            </table>
        </form>
    </body>
</html>
