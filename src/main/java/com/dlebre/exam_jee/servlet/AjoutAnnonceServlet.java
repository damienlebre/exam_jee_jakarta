package com.dlebre.exam_jee.servlet;

import com.dlebre.exam_jee.models.Annonce;
import com.dlebre.exam_jee.services.AnnonceService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import jakarta.validation.ConstraintViolation;
import jakarta.validation.Validation;
import jakarta.validation.Validator;
import jakarta.validation.ValidatorFactory;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.*;

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

        // Formater la date au format "10 septembre 2023 13:12"
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd MMMM yyyy HH:mm");
        String formattedDate = dateFormat.format(new Date());
        request.setAttribute("formattedDate", formattedDate);

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
        //tentative upload-------->echec
//    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        // Liste d'erreur vide
//        List<String> errors = new ArrayList<>();
//
//        // Je réccupère mon fichier dans la requête
//        Part filePart = request.getPart("image-annonce");
//
//        // Vérifier que le fichier a été correctement inclus dans la requête
//        if (filePart == null) {
//            errors.add("Aucun fichier n'a été téléchargé.");
//        } else {
//            // Je réccupère le nom original du fichier
//            String fileName = filePart.getSubmittedFileName();
//            // Je réccupère le mimetype du fichier pour pouvoir analyser si on a le droit de l'upload
//            String type = filePart.getContentType();
//            // Je vérifie que le fichier n'est pas trop gros
//            long fileSize = filePart.getSize();
//
//            // Vérifier que le fichier n'est pas trop gros
//            long sizeMax = 1024 * 1024 * 5; // 5 MB max
//
//            if (fileSize > sizeMax) {
//                errors.add("Le fichier est trop lourd !");
//            }
//            if (!type.equals("image/jpeg") && !type.equals("image/png")) {
//                errors.add("Nous acceptons seulement les fichiers JPG et PNG.");
//            }
//
//            // Si c'est OK, on procède à l'upload
//            if (errors.isEmpty()) {
//                // Je récupère le chemin complet d'upload
//                String applicationPath = request.getServletContext().getRealPath("");
//                // constructs path of the directory to save uploaded file
//                String uploadFilePath = applicationPath + "images";
//                // Je crée le dossier "uploads" s'il n'existe pas
//                File uploadFolder = new File(uploadFilePath);
//                if (!uploadFolder.exists()) {
//                    boolean testCreation = uploadFolder.mkdirs();
//                }
//
//                // Je génère un nom de fichier unique pour éviter les collisions
//                String uniqFilename = UUID.randomUUID().toString();
//                String filePath = uploadFilePath + File.separator + uniqFilename + "-" + fileName;
//
//                // J'upload toutes les parties de mon fichier
//                filePart.write(filePath);
//
//                // Je sauvegarde le chemin du fichier dans ma base de données
//                String realFilePath = "uploads/" + uniqFilename + "-" + fileName;
//                UploadedFile file = new UploadedFile(realFilePath, fileName, type);
//                this.uploadFileService.addFile(file);
//
//                // Je redirige vers la page de liste des fichiers
//                response.sendRedirect(request.getContextPath() + "/list");
//            } else {
//                request.setAttribute("errors", errors);
//                request.getRequestDispatcher("ajoutAnnonce.jsp").forward(request, response);
//            }
//        }
//    }
}