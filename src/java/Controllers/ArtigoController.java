package Controllers;

import Model.dao.DaoFactory;
import Model.dao.ArtigoDao;
import Model.dao.UsuarioDao;
import Model.entities.Artigo;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ArtigoController", urlPatterns = {"/ArtigoController"})
public class ArtigoController extends HttpServlet {

    ArtigoDao artigoDao = DaoFactory.createArtigoDao();
    UsuarioDao usuarioDao = DaoFactory.createUsuarioDao();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String RequisicaoTipo = request.getParameter("tipo");
        Integer id_artigo = Integer.parseInt(request.getParameter("id_artigo"));
        try {
            if (RequisicaoTipo.equals("novo")) {
                Integer id_usuario = Integer.parseInt(request.getParameter("id_usuario"));
                Integer id_categoria = Integer.parseInt(request.getParameter("id_categoria"));                
                String titulo = request.getParameter("titulo");
                String conteudo = request.getParameter("conteudo");
                String liberar = request.getParameter("liberar");
                
                String aprovado = "N";
                Artigo artigo = new Artigo();
                artigo.setId_usuario(id_usuario);
                artigo.setId_categoria(id_categoria);
                artigo.setTitulo(titulo);
                artigo.setConteudo(conteudo);
                artigo.setLiberar(liberar);
                artigo.setAprovado(aprovado);
                artigoDao.insert(artigo);                
            } else {
                Artigo artigo = artigoDao.findById(id_artigo);
                if(RequisicaoTipo.equals("update")) {                    
                    // artigoDao.update(artigo);
                } else if (RequisicaoTipo.equals("aprovado")) {                    
                    artigo.setAprovado(request.getParameter("cadastro_aprovado"));
                    artigoDao.update(artigo);
                    response.sendRedirect(request.getContextPath() + "/gerenciar_artigos.jsp");                                            
                } else if (RequisicaoTipo.equals("liberar")) {                    
                    artigo.setLiberar(request.getParameter("cadastro_liberado"));
                    artigoDao.update(artigo);
                    response.sendRedirect(request.getContextPath() + "/gerenciar_meus_artigos.jsp?area=pessoal");
                } else if (RequisicaoTipo.equals("delete")) {
                    artigoDao.deleteById(id_artigo);                    
                    response.sendRedirect(request.getContextPath() + "/gerenciar_artigos.jsp");                        
                } else if (RequisicaoTipo.equals("deleteMeu")) {
                    artigoDao.deleteById(id_artigo);
                    response.sendRedirect(request.getContextPath() + "/gerenciar_meus_artigos.jsp?area=pessoal");                        
                }                
            }            
        } catch (NumberFormatException e) {
            System.out.println(e.getMessage());
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String id = request.getParameter("id");
            String area = request.getParameter("area");
            if (id != null) {
                Integer aux_id = Integer.parseInt(request.getParameter("id"));
                Artigo artigo = artigoDao.findById(aux_id);

                request.setAttribute("titulo", artigo.getTitulo());
                request.setAttribute("conteudo", artigo.getConteudo());
                request.setAttribute("autor", artigo.getAutor().getNome());
                request.setAttribute("id_artigo", artigo.getId());
            } else if(area != null) {
                Integer id_usuario = Integer.parseInt(request.getSession().getAttribute("id").toString());
                List<Artigo> artigos = artigoDao.findAll(id_usuario);
                request.setAttribute("artigos", artigos);
            } else {
                List<Artigo> artigos = artigoDao.findAll();
                request.setAttribute("artigos", artigos);
            }
        } catch (NumberFormatException e) {
            System.out.println(e.getMessage());
        }
    }
}
