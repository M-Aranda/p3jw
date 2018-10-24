/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model.DAO;

import Model.Alumno;
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
public class DAO_Alumno extends Conexion implements DAO<Alumno> {

    public DAO_Alumno() throws ClassNotFoundException, SQLException {
        super("bd_alumnos_p3");
    }

    @Override
    public void create(Alumno ob) throws SQLException {
        ejecutar("INSERT INTO alumno VALUES(NULL, '"+ob.getNombre()+"', "+ob.isEsHombre()+","
                + " '"+ob.getTelefono()+"', '"+ob.getCorreo()+"', '"+ob.getCiu().getId()+"')");

    }

    @Override
    public List<Alumno> read() throws SQLException {
        List<Alumno> lista= new ArrayList<Alumno>();
        
        ResultSet rs= ejecutar("SELECT * FROM alumno;");
        
        Alumno a;
        while(rs.next()){
            a=new Alumno();
            a.setId(rs.getInt(1));
            a.setNombre(rs.getString(2));
            a.setEsHombre(rs.getBoolean(3));
            a.setTelefono(rs.getString(4));
            a.setCorreo(rs.getString(5));
            
            int idCiudad=rs.getInt(6);
            ResultSet buscaIdCiudad=ejecutar("SELECT * FROM ciudad WHERE id="+idCiudad+"; ");
            Ciudad c=null;// puede que haya que re-veer esto
            while(buscaIdCiudad.next()){
                c=new Ciudad();
                c.setId(buscaIdCiudad.getInt(1));
                c.setNombre(buscaIdCiudad.getString(2));
            }
            a.setCiu(c);           
            
        }
        
        return lista;
    }

    @Override
    public void update(Alumno ob) throws SQLException {
        ejecutar("UPDATE alumno SET nombre='"+ob.getNombre()+"', genero="+ob.isEsHombre()+", telefono='"+ob.getTelefono()+"',"
                + "'"+ob.getCorreo()+"', fk_ciudad="+ob.getCiu().getId()+";  ");
    }

    @Override
    public void delete(int id) throws SQLException {
        ejecutar("DELETE FROM alumno WHERE id="+id+"");
    }
    
    
    public int getCantAlumnos() throws SQLException{
        int cant=0;
        
        ResultSet rs=ejecutar("SELECT COUNT(0) FROM alumno;");
        if(rs.next()){
            cant=rs.getInt(1);
        }
        
        return cant;
    }
    
    
        public int getCantHombres() throws SQLException{
        int cant=0;
        
        ResultSet rs=ejecutar("SELECT COUNT(0) FROM alumno WHERE genero IS TRUE;");
        if(rs.next()){
            cant=rs.getInt(1);
        }
        
        return cant;
    }
        
            public int getCantMujeres() throws SQLException{
        int cant=0;
        
        ResultSet rs=ejecutar("SELECT COUNT(0) FROM alumno WHERE genero IS FALSE;");
        if(rs.next()){
            cant=rs.getInt(1);
        }
        
        return cant;
    }
    
            
            
    
    
    
    
    
}
