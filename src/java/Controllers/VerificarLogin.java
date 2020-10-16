package Controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import Model.UsuarioDAO;
import Aplicacao.Usuario;

@WebServlet(name = "VerificarLogin", urlPatterns = {"/VerificarLogin"})
public class VerificarLogin extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String cpf_user = request.getParameter("cpf");
        String senha_user = request.getParameter("senha");

        UsuarioDAO usuariodao = new UsuarioDAO();
        
        Usuario usuario = usuariodao.getUsuarioPorLoginSenha(cpf_user, senha_user);
        
        if (usuario.getId() !=0){
            
            HttpSession session = request.getSession();
            session.setAttribute("NomeUsuarioLogado", "admin");
            session.setAttribute("logado", "ok");

            RequestDispatcher resposta = request.getRequestDispatcher("sucesso.jsp");
            resposta.forward(request, response);
        } else {
            response.sendRedirect("erro_login.html");
        }
    }

}
