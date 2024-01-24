
package Modelo;


public class Usuario {
    private int codusu;
    private String apeUsu;
    private String nomUsu;
    private String direccion;
    private String perfil;
    private String correo;
    private String claveUsu;

    public Usuario() {
    }

    public Usuario(int codusu, String apeUsu, String nomUsu, String direccion, String perfil, String correo, String claveUsu) {
        this.codusu = codusu;
        this.apeUsu = apeUsu;
        this.nomUsu = nomUsu;
        this.direccion = direccion;
        this.perfil = perfil;
        this.correo = correo;
        this.claveUsu = claveUsu;
    }

    public int getCodusu() {
        return codusu;
    }

    public void setCodusu(int codusu) {
        this.codusu = codusu;
    }

    public String getApeUsu() {
        return apeUsu;
    }

    public void setApeUsu(String apeUsu) {
        this.apeUsu = apeUsu;
    }

    public String getNomUsu() {
        return nomUsu;
    }

    public void setNomUsu(String nomUsu) {
        this.nomUsu = nomUsu;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getPerfil() {
        return perfil;
    }

    public void setPerfil(String perfil) {
        this.perfil = perfil;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getClaveUsu() {
        return claveUsu;
    }

    public void setClaveUsu(String claveUsu) {
        this.claveUsu = claveUsu;
    }
    
    
}
