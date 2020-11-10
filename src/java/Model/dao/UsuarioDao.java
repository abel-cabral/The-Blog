package Model.dao;
import java.util.List;
import Model.entities.Usuario;

public interface UsuarioDao {
    void insert(Usuario obj);
    void update(Usuario obj);
    void deleteById(Integer id);
    Usuario doLogin(String cpf, String senha);    
    Usuario findById(Integer client);    
    List<Usuario> findAll();
    List<Usuario> findAll(Integer id);  // Excepto o ID informado
}
