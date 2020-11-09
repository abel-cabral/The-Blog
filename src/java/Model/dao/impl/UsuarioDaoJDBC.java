package Model.dao.impl;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import db.DB;
import db.DbException;
import Model.dao.UsuarioDao;
import Model.entities.Usuario;

public class UsuarioDaoJDBC implements UsuarioDao {
    private final Connection conn;

    public UsuarioDaoJDBC(Connection conn) {
        this.conn = conn;
    }

    @Override
    public void insert(Usuario obj) {
        PreparedStatement st = null;
        try {
            st = conn.prepareStatement("INSERT INTO usuario (nome, email, cpf, senha, papel, cadastro_aprovado) VALUES (?, ?, ?, ?, ?, ?)", Statement.RETURN_GENERATED_KEYS);
            st.setString(1, obj.getNome());
            st.setString(2, obj.getEmail());
            st.setString(3, obj.getCpf());
            st.setString(4, obj.getSenha());
            st.setInt(5, obj.getPapel());
            st.setString(6, obj.getCadastro_aprovado());
            int RowsAffected = st.executeUpdate();

            // Test para saber se houve inserçao
            if (RowsAffected > 0) {
                ResultSet rs = st.getGeneratedKeys(); // Captura o id/ids retornados
                if (rs.next()) {
                    int id = rs.getInt(1);
                    obj.setId(id); // Assim nosso obj ja fica atualizado com o id que foi salvo no bd
                }
                DB.closeResultSet(rs);
            } else {
                throw new DbException("Error Inesperado, nenhuma linha alterada"); // Forçamos uma excessao caso
                // nenhuma linha seja gravada
            }
        } catch (SQLException e) {
            throw new DbException(e.getMessage());
        } finally {
            DB.closeStatement(st);
        }

    }

    @Override
    public void update(Usuario obj) {
        PreparedStatement st = null;
        try {
            st = conn.prepareStatement("UPDATE usuario SET nome=?, email=?, cpf=?, senha=?, papel=?, cadastro_aprovado=? WHERE id = ?");
            st.setString(1, obj.getNome());
            st.setString(2, obj.getEmail());
            st.setString(3, obj.getCpf());
            st.setString(4, obj.getSenha());
            st.setInt(5, obj.getPapel());
            st.setString(6, obj.getCadastro_aprovado());
            st.executeUpdate();

        } catch (SQLException e) {
            throw new DbException(e.getMessage());
        } finally {
            DB.closeStatement(st);
        }
    }

    @Override
    public void deleteById(Integer id) {
        PreparedStatement st = null;
        try {
            st = conn.prepareStatement("DELETE FROM usuario WHERE id = ?");
            st.setInt(1, id);
            int rowsAffected = st.executeUpdate();

            if (rowsAffected == 0) {
                throw new DbException("ID: " + id + " não encontrada na base de dados.");
            }

        } catch (SQLException e) {
            throw new DbException(e.getMessage());
        } finally {
            DB.closeStatement(st);
        }
    }

    @Override
    public Usuario findById(Integer id) {
        PreparedStatement st = null;
        ResultSet rs = null;
        try {
            st = conn.prepareStatement("SELECT * FROM usuario WHERE id = ?");
            st.setInt(1, id);
            rs = st.executeQuery();

            // rs inicia no 0 da tabela, precisamos antes de avançar testar se nao é null
            if (rs.next()) {
                Usuario dep = instantiateUsuario(rs);
                return dep;
            }
            return null;

        } catch (SQLException e) {
            throw new DbException(e.getMessage());
        } finally {
            DB.closeStatement(st);
            DB.closeResultSet(rs);
        }
    }

    @Override
    public List<Usuario> findAll() {
        PreparedStatement st = null;
        ResultSet rs = null;
        try {
            st = conn.prepareStatement("SELECT * FROM usuario");
            rs = st.executeQuery();

            if (rs.next()) {
                List<Usuario> user = new ArrayList<Usuario>();
                do {
                    Usuario dep = instantiateUsuario(rs);
                    user.add(dep);
                } while (rs.next());
                return user;
            }
            return null;

        } catch (SQLException e) {
            throw new DbException(e.getMessage());
        } finally {
            DB.closeStatement(st);
            DB.closeResultSet(rs);
        }
    }

    @Override
    public Usuario doLogin(String cpf, String senha) {
        Usuario user = null;
        
        PreparedStatement st = null;
        ResultSet rs = null;
        try {
            System.out.println("-----------------------------------------------------------");
            System.out.println(conn.getClientInfo());            
            System.out.println("-----------------------------------------------------------");
            st = conn.prepareStatement("SELECT * FROM usuario WHERE cpf=? and senha=? limit 1");
            st.setString(1, cpf);
            st.setString(2, senha);
            rs = st.executeQuery();

            // rs inicia no 0 da tabela, precisamos antes de avançar testar se nao é null
            if (rs.next()) {
                user = instantiateUsuario(rs);
            }
        } catch (SQLException e) {
            throw new DbException(e.getMessage());
        } finally {
            DB.closeStatement(st);
            DB.closeResultSet(rs);
        }
        return user;
    }

    // Ao inves de montar manualmente em cada funcao, reutilizamos;    
    private Usuario instantiateUsuario(ResultSet rs) throws SQLException {
        Usuario dep = new Usuario(rs.getInt("id"), rs.getInt("papel"), rs.getString("nome"), rs.getString("email"), rs.getString("senha"), rs.getString("cpf"), rs.getString("cadastro_aprovado"));
        return dep;
    }
}
