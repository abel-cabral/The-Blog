/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers;

import Model.dao.DaoFactory;
import Model.dao.CategoriaDao;
import java.util.List;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Model.entities.Categoria;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpSession;

@WebServlet(name = "Publicacao", urlPatterns = {"/Publicacao"})
public class Publicacao extends HttpServlet {

    CategoriaDao categoriaDao = DaoFactory.createCategoriaDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        List<Categoria> categorias = categoriaDao.findAll();
        System.out.println(categorias.get(0).getDescricao());
        request.setAttribute("categorias", categorias);
        response.sendRedirect(request.getContextPath() + "/editor.jsp");
    }
}
