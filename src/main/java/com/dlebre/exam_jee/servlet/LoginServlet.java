package com.dlebre.exam_jee.servlet;

import com.dlebre.exam_jee.models.User;
import com.dlebre.exam_jee.services.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.mindrot.jbcrypt.BCrypt;

import java.io.IOException;
import java.util.List;

@WebServlet(name ="loginServlet", urlPatterns ="/login")
public class LoginServlet extends HttpServlet {

    private UserService userService;

    public void init() throws ServletException {
        super.init();
        this.userService = new UserService();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("login-page.jsp").forward(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Je réccupére les utilisateur qui ont cet username
        List<User> users = this.userService.getByUsername(username);

        // La liste est vide
        if(!users.isEmpty()){
            // Je réccupére le premier utilisateur de la liste
            User user = users.get(0);
            // Si le mot de passe est bon
            if(!users.isEmpty() && BCrypt.checkpw(password, user.getPassword())){
                // Je met mon user en session
                request.getSession().setAttribute("user", user);
                // Je redirige vers la liste d'annonce
                System.out.println("Redirection vers /list réussie");
                response.sendRedirect(request.getContextPath() + "/list");
            } else {
                // Je lui dis que le username ou le mot de passe est incorrecte
                // Je sais bien que c'est a cause du mot passe mais cela est dans le but d'éviter le bruteforce en donnant des infos
                request.setAttribute("error", true);
                request.getRequestDispatcher("login-page.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("error", true);
            request.getRequestDispatcher("login-page.jsp").forward(request, response);
        }

    }
}
