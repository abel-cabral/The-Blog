package Model.dao;

import Model.entities.Categoria;
import java.util.List;

public interface CategoriaDao {
    Categoria findById(Integer id);    
    List<Categoria> findAll();
}
