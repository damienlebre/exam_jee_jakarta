package com.dlebre.exam_jee.servlet;

import com.dlebre.exam_jee.models.Annonce;
import com.dlebre.exam_jee.services.AnnonceService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "detailAnnonceServlet", value = "/detail")
public class DetailAnnonceServlet extends HttpServlet {
    private AnnonceService annonceService;
            public DetailAnnonceServlet(){
                super();
                this.annonceService = new AnnonceService();
            }

            public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
                long id = Long.parseLong(request.getParameter("id"));

                Annonce annonce = annonceService.getOne(id);

                if (annonce == null){
                    response.setStatus(HttpServletResponse.SC_NOT_FOUND);
                }else{
                    request.setAttribute("annonce", annonce);
                    request.getRequestDispatcher("detailAnnonce.jsp").forward(request, response);
                }
            }
}
