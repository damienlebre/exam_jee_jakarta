package com.dlebre.exam_jee.servlet;

import com.dlebre.exam_jee.models.Annonce;
import com.dlebre.exam_jee.services.AnnonceService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "deleteAnnonceServlet", urlPatterns = "/delete")
public class DeleteAnnonceServlet extends HttpServlet {

    private AnnonceService annonceService;


    public DeleteAnnonceServlet(){
        super();
        this.annonceService = new AnnonceService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        long id = Long.parseLong(request.getParameter("idAnnonce"));

        Annonce annonce = this.annonceService.getOne(id);

        if (annonce == null) {
            response.setStatus(HttpServletResponse.SC_NOT_FOUND);
        } else {
            this.annonceService.removeAnnonce(annonce);
            request.getSession().setAttribute("annonceSupprimee", true); // Définir l'attribut dans la session de la demande
            response.sendRedirect("list"); // Rediriger vers la page de liste
        }
    }
}
