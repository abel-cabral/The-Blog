package Controllers;

import java.io.IOException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "SecurityController", urlPatterns = {"/SecurityController"})
public class SecurityController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession(false);
        Boolean logado = Boolean.getBoolean((String) session.getAttribute("logado"));
        Integer papel = (Integer) session.getAttribute("papel");
        
        System.out.println(logado);
        System.out.println(papel);
                
        if(logado == true) {
            System.out.println("Autorizado");
        } else {
            response.sendRedirect(request.getContextPath() + "/");        
        }       
    }
}
