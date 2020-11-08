package Model.entities;
import java.io.Serializable;
import java.util.Objects;
/**
 *
 * @author Abel Cabral Arruda
 */
public class Usuario implements Serializable {
    private static final long serialVersionUID = 1L;
    private Integer id;
    private Integer papel;
    private String nome;
    private String email;
    private String senha;
    private String cpf;    
    private String cadastro_aprovado;
    
    public Usuario(Integer id, Integer papel, String nome, String email, String senha, String cpf, String cadastro_aprovado) {
        this.id = id;
        this.papel = papel;
        this.nome = nome;
        this.email = email;
        this.senha = senha;
        this.cpf = cpf;
        this.cadastro_aprovado = cadastro_aprovado;
    }

    public Integer getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Integer getPapel() {
        return papel;
    }

    public void setPapel(int papel) {
        this.papel = papel;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getCadastro_aprovado() {
        return cadastro_aprovado;
    }

    public void setCadastro_aprovado(String cadastro_aprovado) {
        this.cadastro_aprovado = cadastro_aprovado;
    }

    @Override
    public int hashCode() {
        int hash = 5;
        hash = 23 * hash + Objects.hashCode(this.id);
        hash = 23 * hash + Objects.hashCode(this.cpf);
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
        final Usuario other = (Usuario) obj;
        if (!Objects.equals(this.cpf, other.cpf)) {
            return false;
        }
        if (!Objects.equals(this.id, other.id)) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Usuario{" + "id=" + id + ", papel=" + papel + ", nome=" + nome + ", email=" + email + ", senha=" + senha + ", cpf=" + cpf + ", cadastro_aprovado=" + cadastro_aprovado + '}';
    }
}
