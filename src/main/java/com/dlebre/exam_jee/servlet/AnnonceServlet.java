package com.dlebre.exam_jee.servlet;

import com.dlebre.exam_jee.models.Annonce;
import com.dlebre.exam_jee.models.User;
import com.dlebre.exam_jee.services.AnnonceService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "annonceServlet", urlPatterns = "/list")
public class AnnonceServlet extends HttpServlet {

    private final AnnonceService annonceService;

    public AnnonceServlet(){
        super();
        this.annonceService = new AnnonceService();
    }
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Annonce> annonces = this.annonceService.getAll();

        request.setAttribute("annonces", annonces);

        User connectedUser = (User) request.getSession().getAttribute("user");
        request.setAttribute("user", connectedUser);

        request.getRequestDispatcher("list.jsp").forward(request, response);
    }
}
