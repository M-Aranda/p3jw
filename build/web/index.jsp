

<%@page import="Model.Alumno"%>
<%@page import="java.util.List"%>
<%@page import="Model.DAO.DAO_Alumno"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Indice</title>

        <link rel="stylesheet" href="style.css" type="text/css">

    </head>
    <body>
        <%DAO_Alumno da = new DAO_Alumno();%>


        <h1>Alumnos</h1>
        <br>
        <h4>Alumnos: <%= da.getCantAlumnos()%></h4>
        <h4>Hombres: <%= da.getCantHombres()%></h4>
        <h4>Mujeres: <%= da.getCantMujeres()%></h4>

        <h5>ID</h4>
        <h5>Nombre</h5>
        <h5>Género</h5>
        <h5>Telefono</h5>
        <h5>Correo</h5>
        <h5>Ciudad</h5>
        <h5>Accion</h5>

        <form action="crear.do" method="POST">
            <h5>ID</h4>
                <h5>Nombre</h5>
                <input type="text" name="nombre" required>

                <input type="radio" name="rbtMasculino">
                <input type="radio" name="rbtFemenino">
                <input type="text" name="telefono" required>
                <input type="text" name="correo" required>

                <input type="submit" value="Crear">
                </form>


                <table border="1">
                    <%List<Alumno> listaAlumnos = da.read();

                        for (Alumno al : listaAlumnos) {%>
                    <tr>
                        <td>  <%= al.getId()%></td>
                        <td>  <%= al.getId()%></td>
                        <td> <%= al.getNombre()%></td>
                        <td> <%= al.isEsHombre()%></td>
                        <td> <%= al.getTelefono()%></td>
                        <td> <%= al.getCorreo()%></td>
                        <td> <%= al.getCiu().getNombre()%></td>
                       
                    </tr>        


                    <% }%>    

                </table>


                </body>
                </html>
