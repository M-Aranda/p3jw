/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model.DAO;

import Model.Ciudad;
import Model.Conexion;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author maranda
 */
public class DAO_Ciudad extends Conexion implements DAO<Ciudad> {

    public DAO_Ciudad() throws ClassNotFoundException, SQLException {
        super("bd_alumnos_p3");
    }

    @Override
    public void create(Ciudad ob) throws SQLException {
        ejecutar("INSERT INTO ciduad VALUES (NULL, '" + ob.getNombre() + "'; )");
    }

    @Override
    public List<Ciudad> read() throws SQLException {
        List<Ciudad> lista = new ArrayList<Ciudad>();
        ResultSet rs = ejecutar("SELECT * FROM CIUDAD");

        Ciudad c;
        while (rs.next()) {
            c = new Ciudad();
            c.setId(rs.getInt(1));
            c.setNombre(rs.getString(2));
            lista.add(c);

        }

        return lista;

    }

    @Override
    public void update(Ciudad ob) throws SQLException {
        ejecutar("UPDATE ciudad SET nombre='" + ob.getNombre() + "' WHERE id=" + ob.getId() + "");
    }

    @Override
    public void delete(int id) throws SQLException {
        ejecutar("DELETE FROM ciudad WHERE id=" + id + "");
    }

    public Ciudad getCiudadPorNombre(String nombre) throws SQLException {

        Ciudad c = new Ciudad();
        ResultSet rs = ejecutar("SELECT * FROM ciudad WHERE nombre='" + nombre + "'");
        if (rs.next()) {
            c.setId(rs.getInt(1));
            c.setNombre(rs.getString(2));
        }

        return c;
    }

}
