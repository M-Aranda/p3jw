/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author maranda
 */
public class Alumno {
    
    private int id;
    private String nombre;
    private boolean esHombre;
    private String telefono;
    private String correo;
    private Ciudad ciu;

    public Alumno() {
    }

    public Alumno(int id, String nombre, boolean esHombre, String telefono, String correo, Ciudad ciu) {
        this.id = id;
        this.nombre = nombre;
        this.esHombre = esHombre;
        this.telefono = telefono;
        this.correo = correo;
        this.ciu = ciu;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public boolean isEsHombre() {
        return esHombre;
    }

    public void setEsHombre(boolean esHombre) {
        this.esHombre = esHombre;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public Ciudad getCiu() {
        return ciu;
    }

    public void setCiu(Ciudad ciu) {
        this.ciu = ciu;
    }

    @Override
    public String toString() {
        
        String genero="";
        
        if (esHombre==true){
            genero="Masculino";
        }else if(esHombre==false){
            genero="Femenino";
        }
        return "Alumno: " + "Id= " + id + ", Nombre= " + nombre + ", Genero= " + genero + ", Telefono= " + telefono + ", Correo= " + correo + ", Ciudad= " + ciu.getNombre();
    }
    
    
    
}
