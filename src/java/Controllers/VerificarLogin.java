package Controllers;

import java.io.IOException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import Model.dao.DaoFactory;
import Model.dao.UsuarioDao;
import Model.entities.Usuario;
import javax.servlet.ServletException;

@WebServlet(name = "VerificarLogin", urlPatterns = {"/VerificarLogin"})
public class VerificarLogin extends HttpServlet {
    UsuarioDao usuarioDao = DaoFactory.createUsuarioDao();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        String cpf_user = request.getParameter("cpf");
        String senha_user = request.getParameter("senha");

        Usuario usuario = usuarioDao.doLogin(cpf_user, senha_user);
        if (usuario.getId() != 0) {
            // Cria uma sessao
            HttpSession session = request.getSession();
                        
            String Name[] = usuario.getNome().split(" "); 
            session.setAttribute("NomeUsuarioLogado", Name[0]);
            
            session.setAttribute("papel", usuario.getPapel().toString());
            session.setAttribute("id", usuario.getId().toString());
            session.setAttribute("logado", "true");            

            response.sendRedirect(request.getContextPath() + "/");
        } else {
            response.sendRedirect(request.getContextPath() + "/erro_login.jsp");
        }
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession(false);
        session.setAttribute("logado", "false");
        response.sendRedirect(request.getContextPath() + "/");
        session.invalidate();        
    }
}