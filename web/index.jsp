

<%@page import="Model.Ciudad"%>
<%@page import="Model.DAO.DAO_Ciudad"%>
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
                <td><input type="radio" name="rbtGenero" value="Masculino">Masculino</td>
                <td><input type="radio" name="rbtGenero" value="Femenino">Femenino</td>
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

            <%
                List<Alumno> listaAlumnos = da.read();

                if (request.getSession().getAttribute("listaOrdenada") != null) {
                    listaAlumnos = (List<Alumno>) request.getSession().getAttribute("listaOrdenada");
                }
                  for (Alumno a : listaAlumnos)
            
      {%>
            <tr>
                <td>  <%= a.getId()%></td>
                <td> <%= a.getNombre()%></td>
                <%
                    String genero = "";
                    if (a.isEsHombre() == true) {
                        genero = "Masculino";
                    } else if (a.isEsHombre() == false) {
                        genero = "Femenino";
                    }
                %>
                <td> <%= genero%></td>
                <td></td>
                <td> <%= a.getTelefono()%></td>
                <td> <%= a.getCorreo()%></td>
                <td> <%= a.getCiu().getNombre()%></td>
                <td>
                    <!-- <button onclick="confirmarEliminacion()" name="ide" id="ide" value="// al.getId()" type="hidden">Eliminar</button> -->
                    <!--<input id="//=al.getId()" type="button" value="Eliminar" onclick="Eliminar()"> -->
                    <form id="eliminacion" action="eliminarAlumno.do" method="POST">
                        <input type="hidden" name="id" id="id" value="<%= a.getId()%>"/>
                        <input type="hidden" name="datos" id="datos" value="<%=a%>">
                        <input type="submit" value="Eliminar" onclick="confirmacion()"/>
                    </form>
                </td>
            </tr>        
            <% }%>    
        </tbody>






        <script src="js/JQuery.js"></script>
        <script>
                            function confirmacion() {
                                $('#eliminacion').submit(function () {
                                    var seleccion = $("#datos").val();

                                    var r = confirm("Seguro que quiere eliminar a " + seleccion+"?");
                                    if (r) {
                                        return true;
                                    } else if (!r) {
                                        return false;
                                    }
                                    // return r; si se apreto cancelar es falso y no pasa nada, si es true se hace el submit
                                });

                            }




        </script>




    </table>








</body>
</html>
