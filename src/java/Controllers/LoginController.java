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
public class LoginController extends HttpServlet {

    UsuarioDao usuarioDao = DaoFactory.createUsuarioDao();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        request.setCharacterEncoding("UTF-8");
        String RequisicaoTipo = request.getParameter("tipo");
        try {
            if ("novo".equals(RequisicaoTipo)) {
                // Novo cadastro
                Integer papel = Integer.parseInt(request.getParameter("papel"));
                String nome = request.getParameter("nome");
                String email = request.getParameter("email");
                String senha = request.getParameter("senha");
                String cpf = request.getParameter("cpf");
                String cadastro_aprovado = "N";
                Usuario usuario = new Usuario(null, papel, nome, email, senha, cpf, cadastro_aprovado);
                usuarioDao.insert(usuario);
                
                // Cria uma sessao
                HttpSession session = request.getSession();
                session.setAttribute("NomeUsuarioLogado", (usuario.getNome().split(" "))[0]);
                session.setAttribute("papel", usuario.getPapel().toString());
                session.setAttribute("id", usuario.getId().toString());
                session.setAttribute("logado", "true");
                session.setAttribute("cadastro_aprovado", usuario.getCadastro_aprovado());                
                response.sendRedirect(request.getContextPath() + "/");
            } else {
                String cpf_user = request.getParameter("cpf");
                String senha_user = request.getParameter("senha");
                Usuario usuario = usuarioDao.doLogin(cpf_user, senha_user);
                if (usuario != null) {
                    // Cria uma sessao
                    HttpSession session = request.getSession();
                    session.setAttribute("NomeUsuarioLogado", (usuario.getNome().split(" "))[0]);
                    session.setAttribute("papel", usuario.getPapel().toString());
                    session.setAttribute("id", usuario.getId().toString());
                    session.setAttribute("logado", "true");
                    session.setAttribute("cadastro_aprovado", usuario.getCadastro_aprovado()); 
                    response.sendRedirect(request.getContextPath() + "/");
                } else {
                    response.sendRedirect(request.getContextPath() + "/login.jsp");
                }
            }
        } catch (NumberFormatException e) {
            System.out.println(e.getMessage());
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession(false);
        session.setAttribute("logado", "false");
        response.sendRedirect(request.getContextPath() + "/");
        session.invalidate();
    }
}
