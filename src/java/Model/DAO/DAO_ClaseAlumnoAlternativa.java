/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model.DAO;

import Model.ClaseAlumnoAlternativa;
import Model.Conexion;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author maranda
 */
public class DAO_ClaseAlumnoAlternativa extends Conexion implements DAO<ClaseAlumnoAlternativa> {

    public DAO_ClaseAlumnoAlternativa() throws ClassNotFoundException, SQLException {
        super("bd_alumnos_p3");
    }

    @Override
    public void create(ClaseAlumnoAlternativa ob) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<ClaseAlumnoAlternativa> read() throws SQLException {
        List<ClaseAlumnoAlternativa> lista = new ArrayList<>();
        ResultSet rs = ejecutar("SELECT \n"
                + "	a.id AS 'ID',\n"
                + "	a.nombre AS 'Nombre',\n"
                + "    a.genero AS 'Género',\n"
                + "    a.telefono AS 'Telefono',\n"
                + "    a.correo AS 'Correo',\n"
                + "    c.nombre AS 'Ciudad'\n"
                + "FROM\n"
                + "	alumno a\n"
                + "INNER JOIN\n"
                + "	ciudad c ON c.id = a.fk_ciudad;");

        
        while(rs.next()){
        ClaseAlumnoAlternativa ca=new ClaseAlumnoAlternativa();
        ca.setId(rs.getInt(1));
        ca.setNombre(rs.getString(2));
        ca.setGenero(rs.getInt(3));
        ca.setTelefono(rs.getString(4));
        ca.setCorreo(rs.getString(5));
        ca.setNombreCiudad(rs.getString(6));
        lista.add(ca);        
        }   
        return lista;

    }

    @Override
    public void update(ClaseAlumnoAlternativa ob) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void delete(int id) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
