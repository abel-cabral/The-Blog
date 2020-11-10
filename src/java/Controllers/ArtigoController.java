package Controllers;

import Model.dao.DaoFactory;
import Model.dao.ArtigoDao;
import Model.dao.UsuarioDao;
import Model.entities.Artigo;
import Model.entities.Usuario;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "ArtigoController", urlPatterns = {"/ArtigoController"})
public class ArtigoController extends HttpServlet {

    ArtigoDao artigoDao = DaoFactory.createArtigoDao();
    UsuarioDao usuarioDao = DaoFactory.createUsuarioDao();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {            
            String RequisicaoTipo = request.getParameter("tipo");
            Integer id_usuario = Integer.parseInt(request.getParameter("id_usuario"));
            Integer id_categoria = Integer.parseInt(request.getParameter("id_categoria"));
            String titulo = request.getParameter("titulo");
            String conteudo = request.getParameter("conteudo");
            String liberar = "N";
            String aprovado = "N";

            if (RequisicaoTipo.equals("novoArtigo")) {
                Artigo artigo = new Artigo();
                artigo.setId_usuario(id_usuario);
                artigo.setId_categoria(id_categoria);
                artigo.setTitulo(titulo);
                artigo.setConteudo(conteudo);
                artigo.setLiberar(liberar);
                artigo.setAprovado(aprovado);
                artigoDao.insert(artigo);
            } else {
                Integer id = Integer.parseInt(request.getParameter("id"));
                Artigo artigo = artigoDao.findById(id);
                if (RequisicaoTipo.equals("atualizarArtigo")) {
                    artigo.setId_usuario(id_usuario);
                    artigo.setId_categoria(id_categoria);
                    artigo.setTitulo(titulo);
                    artigo.setConteudo(conteudo);
                    artigo.setLiberar(liberar);
                    artigo.setAprovado(aprovado);
                    artigoDao.update(artigo);
                } else if (RequisicaoTipo.equals("deletarArtigo")) {
                    artigoDao.deleteById(id);
                }
            }
            response.sendRedirect(request.getContextPath() + "/administracao.jsp");
        } catch (NumberFormatException e) {
            System.out.println(e.getMessage());
        }
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        List<Artigo> artigos = artigoDao.findAll();
        // Usuario autor = usuarioDao.findById();
        request.setAttribute("artigos", artigos);
    }
}
