package Model.dao;

import Model.entities.Artigo;
import java.util.List;

public interface ArtigoDao {

    void insert(Artigo obj);

    void update(Artigo obj);

    void deleteById(Integer id);

    Artigo findById(Integer id);

    List<Artigo> findAll(); // Todos artigos

    List<Artigo> findAll(Integer id);  // Todos dos usuario informado
}
