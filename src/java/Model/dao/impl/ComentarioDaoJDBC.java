package Model.dao.impl;

import Model.dao.ComentarioDao;
import Model.entities.Comentario;
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

public class ComentarioDaoJDBC implements ComentarioDao {

    private final Connection conn;

    public ComentarioDaoJDBC(Connection conn) {
        this.conn = conn;
    }

    @Override
    public void insert(Comentario obj) {
        PreparedStatement st = null;
        try {
            st = conn.prepareStatement("INSERT INTO comentario (comentario, id_artigo, id_usuario) VALUES (?, ?, ?)", Statement.RETURN_GENERATED_KEYS);
            st.setString(1, obj.getComentario());
            st.setInt(2, obj.getId_artigo());
            st.setInt(3, obj.getId_usuario());
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
    public void deleteById(Integer id) {
        PreparedStatement st = null;
        
        try {
            st = conn.prepareStatement("DELETE FROM comentario WHERE id = ?");
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
    public List<Comentario> findAllCommentaries(Integer id) {
        PreparedStatement st = null;
        ResultSet rs = null;
        try {
            st = conn.prepareStatement("SELECT * FROM comentario INNER JOIN usuario ON comentario.id_usuario = usuario.id INNER JOIN artigo ON comentario.id_artigo = artigo.id WHERE comentario.id_artigo=?");
            st.setInt(1, id);
            rs = st.executeQuery();

            if (rs.next()) {
                List<Comentario> comentary = new ArrayList<>();
                do {
                    Comentario dep = instantiateComentario(rs);
                    comentary.add(dep);
                } while (rs.next());
                return comentary;
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
    public List<Comentario> findMyCommentaries(Integer id) {
        // SELECT * FROM artigo INNER JOIN usuario ON artigo.id_usuario = usuario.id WHERE artigo.id=?
        return null;
    }
    
    private Comentario instantiateComentario(ResultSet rs) throws SQLException {
        Comentario dep = new Comentario(rs.getInt("id"), rs.getInt("id_artigo"), rs.getInt("id_usuario"), rs.getString("comentario"), this.instantiateUsuario(rs));
        return dep;
    }
    
    private Usuario instantiateUsuario(ResultSet rs) throws SQLException {
        Usuario dep = new Usuario(rs.getInt("id_usuario"), rs.getInt("papel"), rs.getString("nome"), rs.getString("email"), rs.getString("senha"), rs.getString("cpf"), rs.getString("cadastro_aprovado"));
        return dep;
    }
}
