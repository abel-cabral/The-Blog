package Controllers;

import Model.dao.ComentarioDao;
import Model.dao.DaoFactory;
import Model.entities.Comentario;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ComentarioController", urlPatterns = {"/ComentarioController"})
public class ComentarioController extends HttpServlet {
    ComentarioDao comentarioDao = DaoFactory.createComentarioDao();
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String id = request.getParameter("id");
            if (id != null) {     
                Integer aux_id = Integer.parseInt(request.getParameter("id"));
                List<Comentario> comentarios = comentarioDao.findAllCommentaries(aux_id);                
                request.setAttribute("comentarios", comentarios);                
            } else {
                response.sendRedirect(request.getContextPath() + "/");
            }
        } catch (NumberFormatException e) {
            System.out.println(e.getMessage());
        }
    }
}
