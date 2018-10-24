<%-- 
    Document   : ordenarPorCiudad
    Created on : 24-10-2018, 11:58:37
    Author     : maranda
--%>

<%@page import="Model.DAO.DAO_Alumno"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Seleccione orden</title>
        <link rel="stylesheet" href="style.css" type="text/css">
    </head>
    <body>
        <h1>Seleccione el orden</h1>
        <%DAO_Alumno da = new DAO_Alumno();%>


        <h1>Alumnos</h1>
        <br>
        <h4>Alumnos: <%= da.getCantAlumnos()%></h4>
        <h4>Hombres: <%= da.getCantHombres()%></h4>
        <h4>Mujeres: <%= da.getCantMujeres()%></h4>

        <form action="ordenarPorCiudad.do" method="POST">
            <select name="cboOrdenCiudad">
                <option>Ascendente</option>
                <option>Descendente</option>
            </select>
            <input type="submit" value="Ordenar">
        </form>



    </body>
</html>

