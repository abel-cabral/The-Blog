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

@WebServlet(name = "VerificarLogin", urlPatterns = {"/VerificarLogin"})
public class VerificarLogin extends HttpServlet {

    UsuarioDao usuarioDao = DaoFactory.createUsuarioDao();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        String cpf_user = request.getParameter("cpf");
        String senha_user = request.getParameter("senha");

        Usuario usuario = usuarioDao.doLogin(cpf_user, senha_user);
        System.out.println(usuario.toString());
        if (usuario.getId() != 0) {
            HttpSession session = request.getSession();
            session.setAttribute("NomeUsuarioLogado", usuario.getNome());
            session.setAttribute("logado", "ok");

            response.sendRedirect(request.getContextPath() + "/sucesso.jsp");
        } else {
            response.sendRedirect(request.getContextPath() + "/erro_login.jsp");
        }
    }

}
