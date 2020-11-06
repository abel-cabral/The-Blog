package Aplicacao;

public class Usuario {
    private int id;
    private int papel;
    private String nome;
    private String email;
    private String senha;
    private String cpf;    
    private String cadastro_aprovado;

    public Usuario(int id, int papel, String nome, String email, String senha, String cpf, String cadastro_aprovado) {
        this.id = id;
        this.papel = papel;
        this.nome = nome;
        this.email = email;
        this.senha = senha;
        this.cpf = cpf;
        this.cadastro_aprovado = cadastro_aprovado;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getPapel() {
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
}
