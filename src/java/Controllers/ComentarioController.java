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
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String RequisicaoTipo = request.getParameter("tipo");
        try {
            Integer id_artigo = Integer.parseInt(request.getParameter("id_artigo"));
            if ("novo".equals(RequisicaoTipo)) {
                String comentario = request.getParameter("comentario");
                Integer id_usuario = Integer.parseInt(request.getParameter("id_usuario"));

                comentarioDao.insert(new Comentario(null, id_artigo, id_usuario, comentario));
                response.sendRedirect(request.getContextPath() + "/artigo.jsp?id=" + id_artigo);
            } else if ("delete".equals(RequisicaoTipo)) {
                Integer id_comentario = Integer.parseInt(request.getParameter("id_comentario"));

                comentarioDao.deleteById(id_comentario);
                response.sendRedirect(request.getContextPath() + "/artigo.jsp?id=" + id_artigo);
            } else if ("update".equals(RequisicaoTipo)) {
                String comentario = request.getParameter("comentario");
                Integer id_comentario = Integer.parseInt(request.getParameter("id_comentario"));

                Comentario com = comentarioDao.findById(id_comentario);
                com.setComentario(comentario);
                comentarioDao.update(com);
                response.sendRedirect(request.getContextPath() + "/artigo.jsp?id=" + id_artigo);
            }
        } catch (NumberFormatException e) {
            System.out.println(e.getMessage());
        }

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
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
