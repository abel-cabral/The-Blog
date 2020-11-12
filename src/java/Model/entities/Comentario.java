package Model.entities;

import java.io.Serializable;
import java.util.Objects;

public class Comentario implements Serializable {

    private static final long serialVersionUID = 1L;
    private Integer id;
    private Integer id_artigo;
    private Integer id_usuario;
    private String comentario;
    private Usuario usuario;

    public Comentario(Integer id, Integer id_artigo, Integer id_usuario, String comentario) {
        this.id = id;
        this.id_artigo = id_artigo;
        this.id_usuario = id_usuario;
        this.comentario = comentario;
    }

    public Comentario(Integer id, Integer id_artigo, Integer id_usuario, String comentario, Usuario usuario) {
        this.id = id;
        this.id_artigo = id_artigo;
        this.id_usuario = id_usuario;
        this.comentario = comentario;
        this.usuario = usuario;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getId_artigo() {
        return id_artigo;
    }

    public void setId_artigo(Integer id_artigo) {
        this.id_artigo = id_artigo;
    }

    public Integer getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(Integer id_usuario) {
        this.id_usuario = id_usuario;
    }

    public String getComentario() {
        return comentario;
    }

    public void setComentario(String comentario) {
        this.comentario = comentario;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 43 * hash + Objects.hashCode(this.id);
        hash = 43 * hash + Objects.hashCode(this.id_artigo);
        hash = 43 * hash + Objects.hashCode(this.id_usuario);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Comentario other = (Comentario) obj;
        if (!Objects.equals(this.id, other.id)) {
            return false;
        }
        if (!Objects.equals(this.id_artigo, other.id_artigo)) {
            return false;
        }
        if (!Objects.equals(this.id_usuario, other.id_usuario)) {
            return false;
        }
        return true;
    }

}
