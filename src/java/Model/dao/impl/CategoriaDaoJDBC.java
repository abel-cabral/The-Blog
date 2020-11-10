package Model.dao.impl;

import Model.dao.CategoriaDao;
import Model.entities.Categoria;
import db.DB;
import db.DbException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CategoriaDaoJDBC implements CategoriaDao {
    private final Connection conn;
    
    public CategoriaDaoJDBC(Connection conn) {
        this.conn = conn;
    }
    
    @Override
    public Categoria findById(Integer id) {
        PreparedStatement st = null;
        ResultSet rs = null;
        try {
            st = conn.prepareStatement("SELECT * FROM categoria WHERE id=?");
            st.setInt(1, id);
            rs = st.executeQuery();

            // rs inicia no 0 da tabela, precisamos antes de avançar testar se nao é null
            if (rs.next()) {
                Categoria dep = instantiateCategoria(rs);
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
    public List<Categoria> findAll() {
        PreparedStatement st = null;
        ResultSet rs = null;
        try {            
            st = conn.prepareStatement("SELECT * FROM categoria");
            rs = st.executeQuery();

            if (rs.next()) {
                List<Categoria> categoria = new ArrayList<>();
                do {
                    Categoria dep = instantiateCategoria(rs);
                    categoria.add(dep);
                } while (rs.next());
                return categoria;
            }
            return null;

        } catch (SQLException e) {
            throw new DbException(e.getMessage());
        } finally {
            DB.closeStatement(st);
            DB.closeResultSet(rs);
        }
    }
    
    // Ao inves de montar manualmente em cada funcao, reutilizamos;    
    private Categoria instantiateCategoria(ResultSet rs) throws SQLException {
        Categoria dep = new Categoria(rs.getInt("id"), rs.getString("descricao"));
        return dep;
    }
}
