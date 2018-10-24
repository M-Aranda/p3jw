

<%@page import="Model.Ciudad"%>
<%@page import="Model.DAO.DAO_Ciudad"%>
<%@page import="Model.DAO.DAO_ClaseAlumnoAlternativa"%>
<%@page import="Model.ClaseAlumnoAlternativa"%>
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
        <h3>Alumnos: <%= da.getCantAlumnos()%></h3>
        <h3>Hombres: <%= da.getCantHombres()%></h3>
        <h3>Mujeres: <%= da.getCantMujeres()%></h3>
        <br>
        <h3>Alumnos de Rancagua: <%=da.getCantRancaguinos()%></h3>
        <h3>Alumnos de Rengo: <%= da.getCantRenguinos()%> </h3>
        <h3>Alumnos de Santa Cruz: <%=da.getCantSantaCruzenios()%></h3>



        <table border="0">
            <thead>
                <tr>
                    <th><h5>ID</h4></th>
                    <th><h5><a href="ordenarPorNombre.jsp">Nombre</a></h5></th>
                    <th><h5>Género</h5></th>
                    <th></th>
                    <th><h5>Telefono</h5></th>
                    <th><h5>Correo</h5></th>
                    <th><h5><a href="ordenarPorCiudad.jsp">Ciudad</a></h5></th>
                    <th><h5>Accion</h5></th>
                </tr>
            </thead>
            <tbody>
                <tr>
            <form action="crearAlumno.do" method="POST">
                <td>Id</td>
                <td><input type="text" name="nombre" required></td>
                <td><input type="radio" name="rbtGenero">Masculino</td>
                <td><input type="radio" name="rbtGenero">Femenino</td>
                <td><input type="text" name="telefono" required></td>
                <td><input type="text" name="correo" required></td>
                <td>
                    <select name="cboCiudad">
                        <%DAO_Ciudad dc = new DAO_Ciudad();
                            List<Ciudad> listaDeCiudades = dc.read();

                            for (Ciudad ciu : listaDeCiudades) {%>
                        <option><%= ciu.getNombre()%></option> 
                        <%}%>                     
                    </select>
                </td>
                <td><input type="submit" value="Crear"></td>
                </tr>
            </form>

            <%//List<Alumno> listaAlumnos = da.read();
                DAO_ClaseAlumnoAlternativa dcaa = new DAO_ClaseAlumnoAlternativa();
                List<ClaseAlumnoAlternativa> listaAlternativa = dcaa.read();

                if (request.getSession().getAttribute("listaOrdenada") != null) {
                    listaAlternativa = (List<ClaseAlumnoAlternativa>) request.getSession().getAttribute("listaOrdenada");
                }

                for (ClaseAlumnoAlternativa al : listaAlternativa) {%>
            <tr>
                <td>  <%= al.getId()%></td>
                <td> <%= al.getNombre()%></td>
                <%
                    String genero = "";
                    if (al.getGenero() == 1) {
                        genero = "Masculino";
                    } else if (al.getGenero() == 0) {
                        genero = "Femenino";
                    }
                %>
                <td> <%= genero%></td>
                <td></td>
                <td> <%= al.getTelefono()%></td>
                <td> <%= al.getCorreo()%></td>
                <td> <%= al.getNombreCiudad()%></td>
                <td>
                    <form action="eliminarAlumno.do"method="POST">
                        <input type="button" value="Eliminar" hidden="<%=al.getId()%>" onclick="alertar()">
                    </form>
                </td>

            </tr>        
            <% }%>    
        </tbody>

        <script>
            function alertar (int id){
                
                ClaseAlumnoAlternativa caa=dcaa.getAlumnoPorId(id);
                
                confirm("Desea eliminar a "+caa+"?");
                if(confirm.dia);
                dcaa.delete(id);
            }

        </script>
    </table>








</body>
</html>
