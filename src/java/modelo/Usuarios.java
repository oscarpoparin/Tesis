
package modelo;

public class Usuarios {
    
    private int id;
    private String identificador;
    private String correo;
    private Roles rol;
    private String nombre;
    private String paterno;
    private String materno;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getIdentificador() {
        return identificador;
    }

    public void setIdentificador(String identificador) {
        this.identificador = identificador;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public Roles getRol() {
        return rol;
    }

    public void setRol(Roles rol) {
        this.rol = rol;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getPaterno() {
        return paterno;
    }

    public void setPaterno(String paterno) {
        this.paterno = paterno;
    }

    public String getMaterno() {
        return materno;
    }

    public void setMaterno(String materno) {
        this.materno = materno;
    }
    
        @Override
    public String toString() {
        return "Usuario [id=" + id + ", nombre=" + nombre + ", paterno=" + paterno + ", materno=" + materno
                + ", correo=" + correo + ", identificador=" + identificador + ", rol=" + rol + "]";
    }

    
}
