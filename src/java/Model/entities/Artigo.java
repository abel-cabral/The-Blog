package Model.entities;

import java.io.Serializable;
import java.util.Objects;

public class Artigo implements Serializable {
    
    private static final long serialVersionUID = 1L;
    private Integer id;
    private Integer id_usuario;
    private Integer id_categoria;
    private String titulo;
    private String conteudo;
    private String liberar;
    private String aprovado;

    public Artigo(Integer id, Integer id_usuario, Integer id_categoria, String titulo, String conteudo, String liberar, String aprovado) {
        this.id = id;
        this.id_usuario = id_usuario;
        this.id_categoria = id_categoria;
        this.titulo = titulo;
        this.conteudo = conteudo;
        this.liberar = liberar;
        this.aprovado = aprovado;
    }

    public Artigo() { }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(Integer id_usuario) {
        this.id_usuario = id_usuario;
    }

    public Integer getId_categoria() {
        return id_categoria;
    }

    public void setId_categoria(Integer id_categoria) {
        this.id_categoria = id_categoria;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getConteudo() {
        return conteudo;
    }

    public void setConteudo(String conteudo) {
        this.conteudo = conteudo;
    }

    public String getLiberar() {
        return liberar;
    }

    public void setLiberar(String liberar) {
        this.liberar = liberar;
    }

    public String getAprovado() {
        return aprovado;
    }

    public void setAprovado(String aprovado) {
        this.aprovado = aprovado;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 23 * hash + Objects.hashCode(this.id);
        hash = 23 * hash + Objects.hashCode(this.id_usuario);
        hash = 23 * hash + Objects.hashCode(this.id_categoria);
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
        final Artigo other = (Artigo) obj;
        if (!Objects.equals(this.id, other.id)) {
            return false;
        }
        if (!Objects.equals(this.id_usuario, other.id_usuario)) {
            return false;
        }
        if (!Objects.equals(this.id_categoria, other.id_categoria)) {
            return false;
        }
        return true;
    }
}
