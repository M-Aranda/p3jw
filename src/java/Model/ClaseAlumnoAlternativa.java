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
public class ClaseAlumnoAlternativa {
    
    
    private int id;
    private String nombre;
    private int genero;
    private String telefono;
    private String correo;
    private String nombreCiudad;

    public ClaseAlumnoAlternativa() {
    }

    public ClaseAlumnoAlternativa(int id, String nombre, int genero, String telefono, String correo, String nombreCiudad) {
        this.id = id;
        this.nombre = nombre;
        this.genero = genero;
        this.telefono = telefono;
        this.correo = correo;
        this.nombreCiudad = nombreCiudad;
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

    public int getGenero() {
        return genero;
    }

    public void setGenero(int genero) {
        this.genero = genero;
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

    public String getNombreCiudad() {
        return nombreCiudad;
    }

    public void setNombreCiudad(String nombreCiudad) {
        this.nombreCiudad = nombreCiudad;
    }

    @Override
    public String toString() {
        return "ClaseAlumnoAlternativa{" + "id=" + id + ", nombre=" + nombre + ", genero=" + genero + ", telefono=" + telefono + ", correo=" + correo + ", nombreCiudad=" + nombreCiudad + '}';
    }
    
    
    
    
    
}
