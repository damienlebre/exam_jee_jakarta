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

@WebServlet(name = "editAnnonceServlet",urlPatterns = "/edit")
public class EditAnnonceServlet extends HttpServlet {

    private AnnonceService annonceService;

    public EditAnnonceServlet(){this.annonceService = new AnnonceService();}

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("idAnnonce"));
        Annonce annonce = this.annonceService.getOne(id);

        if (annonce == null){
            response.setStatus(HttpServletResponse.SC_NOT_FOUND);
        } else {
            request.setAttribute("annonceEdit", annonce);
            request.getRequestDispatcher("editAnnonce.jsp").forward(request, response);
        }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        long id = Long.parseLong(request.getParameter("idAnnonce"));
        Annonce annonce = this.annonceService.getOne(id);

        if (annonce == null) {
            response.setStatus(HttpServletResponse.SC_NOT_FOUND);
        } else {
            String titreAnnonce = request.getParameter("titre-annonce");
            String descriptionCourteAnnonce = request.getParameter("descriptionCourte-annonce");
            String imageAnnonce = request.getParameter("image-annonce");
            String corpAnnonce = request.getParameter("corp-annonce");

            annonce.setTitre(titreAnnonce);
            annonce.setDescriptionCourte(descriptionCourteAnnonce);
            annonce.setImage(imageAnnonce);
            annonce.setContenu(corpAnnonce);
            annonce.setDatePublication(new Date());

            ValidatorFactory factory = Validation.buildDefaultValidatorFactory();
            Validator validator = factory.getValidator();

            // Réccupération des erreurs
            Set<ConstraintViolation<Annonce>> errors = validator.validate(annonce);

            // Il n'y a pas d'erreur, on enregistre et on redirige !
            if (errors.isEmpty()) {
                this.annonceService.update(annonce);
                response.sendRedirect(request.getContextPath() + "/list");
            } else {
                request.setAttribute("errors", errors);
                request.setAttribute("annonceEdit", annonce);
                request.getRequestDispatcher("editAnnonce.jsp").forward(request, response);
            }
        }
    }
}
