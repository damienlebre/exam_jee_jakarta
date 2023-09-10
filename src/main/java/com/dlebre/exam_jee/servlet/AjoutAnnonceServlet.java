package com.dlebre.exam_jee.servlet;

import com.dlebre.exam_jee.models.Annonce;
import com.dlebre.exam_jee.services.AnnonceService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.validation.ConstraintViolation;
import jakarta.validation.Validation;
import jakarta.validation.Validator;
import jakarta.validation.ValidatorFactory;

import java.io.IOException;
import java.util.Date;
import java.util.Set;

@WebServlet(name = "AjoutAnnonceServlet", urlPatterns = "/ajout-annonce")
public class AjoutAnnonceServlet extends HttpServlet {

    private AnnonceService annonceService;

    public AjoutAnnonceServlet(){
        super();
        this.annonceService = new AnnonceService();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("ajoutAnnonce.jsp").forward(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)throws  ServletException, IOException {

        String titreAnnonce = request.getParameter("titre-annonce");
        String descriptionCourteAnnonce = request.getParameter("descriptionCourte-annonce");
        String imageAnnonce = request.getParameter("image-annonce");
        String corpAnnonce = request.getParameter("corp-annonce");

        Annonce annonce = new Annonce(titreAnnonce,descriptionCourteAnnonce,imageAnnonce,new Date() ,corpAnnonce);

        // Utiliser la validation pour valider cet objet
        ValidatorFactory factory = Validation.buildDefaultValidatorFactory();
        Validator validator = factory.getValidator();

        // Réccupération des erreurs
        Set<ConstraintViolation<Annonce>> errors = validator.validate(annonce);

        // Il n'y a pas d'erreur, on enregistre et on redirige !
        if(errors.isEmpty()){
            this.annonceService.add(annonce);
            response.sendRedirect(request.getContextPath() + "/list");
        } else {
            // Il y a des erreurs, on ajoute dans notre requête les erreurs
            request.setAttribute("errors", errors);
            // On enregistre dans notre requête les saisie utilisateurs pour préremplir nos champs
            request.setAttribute("saisie", annonce);
            request.getRequestDispatcher("ajoutAnnonce.jsp").forward(request, response);

        }

    }
}

