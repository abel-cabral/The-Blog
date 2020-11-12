package Model.dao;

import Model.entities.Comentario;
import java.util.List;

public interface ComentarioDao {
    void insert(Comentario obj);    
    void deleteById(Integer id);    
    List<Comentario> findAllCommentaries(Integer id); // Todos comentarios em um artigo
    List<Comentario> findMyCommentaries(Integer id);  // Todos os comentarios de um usuario
}
