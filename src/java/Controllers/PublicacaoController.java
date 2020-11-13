/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers;

import Model.dao.ArtigoDao;
import Model.dao.DaoFactory;
import Model.dao.CategoriaDao;
import Model.dao.UsuarioDao;
import Model.entities.Artigo;
import java.util.List;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Model.entities.Categoria;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpSession;

@WebServlet(name = "PublicacaoController", urlPatterns = {"/PublicacaoController"})
public class PublicacaoController extends HttpServlet {

    CategoriaDao categoriaDao = DaoFactory.createCategoriaDao();
    ArtigoDao artigoDao = DaoFactory.createArtigoDao();
    UsuarioDao usuarioDao = DaoFactory.createUsuarioDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        String id_artigo = request.getParameter("artigo");
        List<Categoria> categorias = categoriaDao.findAll();        
        request.setAttribute("categorias", categorias);
        
        if(id_artigo != null) {
            Artigo artigo = artigoDao.findById(Integer.parseInt(id_artigo));
            request.setAttribute("artigo", artigo);
        }
        
        // response.sendRedirect(request.getContextPath() + "/editor.jsp");
    }
    
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String RequisicaoTipo = request.getParameter("tipo");        
    }
}
