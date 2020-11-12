package Model.dao.impl;

import Model.dao.ArtigoDao;
import Model.entities.Artigo;
import Model.entities.Usuario;
import db.DB;
import db.DbException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ArtigoDaoJDBC implements ArtigoDao {

    private final Connection conn;

    public ArtigoDaoJDBC(Connection conn) {
        this.conn = conn;
    }

    @Override
    public void insert(Artigo obj) {
        PreparedStatement st = null;
        try {
            st = conn.prepareStatement("INSERT INTO artigo (id_usuario, id_categoria, titulo, conteudo, liberar, aprovado) VALUES (?, ?, ?, ?, ?, ?)", Statement.RETURN_GENERATED_KEYS);
            st.setInt(1, obj.getId_usuario());
            st.setInt(2, obj.getId_categoria());
            st.setString(3, obj.getTitulo());
            st.setString(4, obj.getConteudo());
            st.setString(5, obj.getLiberar());
            st.setString(6, obj.getAprovado());
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
    public void update(Artigo obj) {
        PreparedStatement st = null;
        try {
            st = conn.prepareStatement("UPDATE artigo SET id_categoria=?, titulo=?, conteudo=?, liberar=?, aprovado=? WHERE id=?");
            st.setInt(1, obj.getId_categoria());
            st.setString(2, obj.getTitulo());
            st.setString(3, obj.getConteudo());
            st.setString(4, obj.getLiberar());
            st.setString(5, obj.getAprovado());
            st.setInt(6, obj.getId());
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
            st = conn.prepareStatement("DELETE FROM artigo WHERE id=?");
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
    public Artigo findById(Integer id) {
        PreparedStatement st = null;
        ResultSet rs = null;
        try {
            st = conn.prepareStatement("SELECT * FROM artigo INNER JOIN usuario ON artigo.id_usuario = usuario.id WHERE artigo.id=?");
            st.setInt(1, id);
            rs = st.executeQuery();

            // rs inicia no 0 da tabela, precisamos antes de avançar testar se nao é null
            if (rs.next()) {
                Artigo dep = instantiateArtigo(rs);
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
    public List<Artigo> findAll(Integer id) {
        PreparedStatement st = null;
        ResultSet rs = null;
        try {
            // Se id zero, pega todos os artigos do db
            if (id == 0) {
                st = conn.prepareStatement("SELECT * FROM artigo INNER JOIN usuario ON artigo.id_usuario = usuario.id");
            } else {
                // Se id direfente de zero, pega só artigos do autor com aquele id 
                st = conn.prepareStatement("SELECT * FROM artigo WHERE id_usuario=?");
                st.setInt(1, id);
            }

            rs = st.executeQuery();

            if (rs.next()) {
                List<Artigo> artigos = new ArrayList<>();
                do {
                    Artigo dep = instantiateArtigo(rs);
                    artigos.add(dep);
                } while (rs.next());
                return artigos;
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
    public List<Artigo> findAll() {
        // Como nao existe ID 0, ele sempre irá retornar todos os usuários
        return this.findAll(0);
    }

    // Ao inves de montar manualmente em cada funcao, reutilizamos;    
    private Artigo instantiateArtigo(ResultSet rs) throws SQLException {
        Artigo dep = new Artigo(rs.getInt("id"), rs.getInt("id_usuario"), rs.getInt("id_categoria"), rs.getString("titulo"), rs.getString("conteudo"), rs.getString("liberar"), rs.getString("aprovado"), this.instantiateUsuario(rs));
        return dep;
    }

    // Ao inves de montar manualmente em cada funcao, reutilizamos;    
    private Usuario instantiateUsuario(ResultSet rs) throws SQLException {
        Usuario dep = new Usuario(rs.getInt("id_usuario"), rs.getInt("papel"), rs.getString("nome"), rs.getString("email"), rs.getString("senha"), rs.getString("cpf"), rs.getString("cadastro_aprovado"));
        return dep;
    }
}
