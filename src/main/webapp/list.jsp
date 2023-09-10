<%--
  Created by IntelliJ IDEA.
  User: aureliendelorme
  Date: 07/09/2023
  Time: 13:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Bienvenue sur votre application !</title>

    <%@include file="parts/script-style.jsp" %>
</head>
<body class="bg-secondary">

<%@include file="parts/header.jsp" %>

<%@include file="parts/menu.jsp" %>


<div class="container mx-5 min-vh-100">

    <div class="title container my-5 mx-5">
        <h1>Liste des Annonces :</h1>
        <p>Bonjour ${user.firstname} :) !</p>
    </div>

    <c:if test="${annonces.size() == 0}">
        <div class="text-center text-danger">
            <h1>Aucune annonce à afficher !</h1>
        </div>
    </c:if>
    <c:if test="${annonces.size() != 0}">
        <div class="card-group">

            <div class="container">
                <div class="row ">

                    <c:forEach items="${annonces}" var="annonce">
                    <div class="card col-lg-3 col-md-4 col-sm-6 col-xs-12 mx-2 my-2">
                        <h3 class="card-header">${annonce.getTitre()}</h3>

                        <img width="100%" height="100%" src="images/${annonce.getImage()}">

                        <div class="card-body">
                            <p class="card-text">${annonce.getDescriptionCourte()}</p>
                            <a href="detail?id=${annonce.getId()}">
                                <button type="button" class="btn btn-outline-info btn-sm">
                                    Voir
                                    <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 576 512">
                                    <style>svg {
                                            fill: #f7f7f8
                                        }</style>
                                        <path d="M288 32c-80.8 0-145.5 36.8-192.6 80.6C48.6 156 17.3 208 2.5 243.7c-3.3 7.9-3.3 16.7 0 24.6C17.3 304 48.6 356 95.4 399.4C142.5 443.2 207.2 480 288 480s145.5-36.8 192.6-80.6c46.8-43.5 78.1-95.4 93-131.1c3.3-7.9 3.3-16.7 0-24.6c-14.9-35.7-46.2-87.7-93-131.1C433.5 68.8 368.8 32 288 32zM144 256a144 144 0 1 1 288 0 144 144 0 1 1 -288 0zm144-64c0 35.3-28.7 64-64 64c-7.1 0-13.9-1.2-20.3-3.3c-5.5-1.8-11.9 1.6-11.7 7.4c.3 6.9 1.3 13.8 3.2 20.7c13.7 51.2 66.4 81.6 117.6 67.9s81.6-66.4 67.9-117.6c-11.1-41.5-47.8-69.4-88.6-71.1c-5.8-.2-9.2 6.1-7.4 11.7c2.1 6.4 3.3 13.2 3.3 20.3z"/>
                                    </svg>
                                </button>
                            </a>
                            <a href="delete?idAnnonce=${annonce.getId()}">
                                <button type="button" class="btn btn-outline-danger btn-sm">
                                    Supprimer
                                    <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 448 512">
                                        <style>svg {
                                            fill: #ffffff
                                        }</style>
                                        <path d="M135.2 17.7C140.6 6.8 151.7 0 163.8 0H284.2c12.1 0 23.2 6.8 28.6 17.7L320 32h96c17.7 0 32 14.3 32 32s-14.3 32-32 32H32C14.3 96 0 81.7 0 64S14.3 32 32 32h96l7.2-14.3zM32 128H416V448c0 35.3-28.7 64-64 64H96c-35.3 0-64-28.7-64-64V128zm96 64c-8.8 0-16 7.2-16 16V432c0 8.8 7.2 16 16 16s16-7.2 16-16V208c0-8.8-7.2-16-16-16zm96 0c-8.8 0-16 7.2-16 16V432c0 8.8 7.2 16 16 16s16-7.2 16-16V208c0-8.8-7.2-16-16-16zm96 0c-8.8 0-16 7.2-16 16V432c0 8.8 7.2 16 16 16s16-7.2 16-16V208c0-8.8-7.2-16-16-16z"/>
                                    </svg>
                                </button>
                            </a>
                            <a href="edit?idAnnonce=${annonce.getId()}">
                                <button type="button" class="btn btn-outline-warning btn-sm">
                                    Editer
                                    <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 576 512">
                                        <path d="M0 64C0 28.7 28.7 0 64 0H224V128c0 17.7 14.3 32 32 32H384V285.7l-86.8 86.8c-10.3 10.3-17.5 23.1-21 37.2l-18.7 74.9c-2.3 9.2-1.8 18.8 1.3 27.5H64c-35.3 0-64-28.7-64-64V64zm384 64H256V0L384 128zM549.8 235.7l14.4 14.4c15.6 15.6 15.6 40.9 0 56.6l-29.4 29.4-71-71 29.4-29.4c15.6-15.6 40.9-15.6 56.6 0zM311.9 417L441.1 287.8l71 71L382.9 487.9c-4.1 4.1-9.2 7-14.9 8.4l-60.1 15c-5.5 1.4-11.2-.2-15.2-4.2s-5.6-9.7-4.2-15.2l15-60.1c1.4-5.6 4.3-10.8 8.4-14.9z"/>
                                    </svg>
                                </button>
                            </a>
                        </div>

                        <div class="card-footer">
                            <small class="text-muted">${annonce.getDatePublication()}</small>
                        </div>
                    </div>
                    </c:forEach>
                    <div class="card col-lg-3 col-md-4 col-sm-6 col-xs-12 mx-2 my-2 text-center">
                        <h3 class="card-header mb-5">${annonce.getTitre()}</h3>
                        <div class="my-5">
                            <svg xmlns="http://www.w3.org/2000/svg" width="65" height="65" class="bi bi-plus-circle-dotted" viewBox="0 0 16 16">
<%--                                <style>svg {--%>
<%--                                fill: #43CC29--%>
<%--                                }</style>--%>
                                <path d="M8 0c-.176 0-.35.006-.523.017l.064.998a7.117 7.117 0 0 1 .918 0l.064-.998A8.113 8.113 0 0 0 8 0zM6.44.152c-.346.069-.684.16-1.012.27l.321.948c.287-.098.582-.177.884-.237L6.44.153zm4.132.271a7.946 7.946 0 0 0-1.011-.27l-.194.98c.302.06.597.14.884.237l.321-.947zm1.873.925a8 8 0 0 0-.906-.524l-.443.896c.275.136.54.29.793.459l.556-.831zM4.46.824c-.314.155-.616.33-.905.524l.556.83a7.07 7.07 0 0 1 .793-.458L4.46.824zM2.725 1.985c-.262.23-.51.478-.74.74l.752.66c.202-.23.418-.446.648-.648l-.66-.752zm11.29.74a8.058 8.058 0 0 0-.74-.74l-.66.752c.23.202.447.418.648.648l.752-.66zm1.161 1.735a7.98 7.98 0 0 0-.524-.905l-.83.556c.169.253.322.518.458.793l.896-.443zM1.348 3.555c-.194.289-.37.591-.524.906l.896.443c.136-.275.29-.54.459-.793l-.831-.556zM.423 5.428a7.945 7.945 0 0 0-.27 1.011l.98.194c.06-.302.14-.597.237-.884l-.947-.321zM15.848 6.44a7.943 7.943 0 0 0-.27-1.012l-.948.321c.098.287.177.582.237.884l.98-.194zM.017 7.477a8.113 8.113 0 0 0 0 1.046l.998-.064a7.117 7.117 0 0 1 0-.918l-.998-.064zM16 8a8.1 8.1 0 0 0-.017-.523l-.998.064a7.11 7.11 0 0 1 0 .918l.998.064A8.1 8.1 0 0 0 16 8zM.152 9.56c.069.346.16.684.27 1.012l.948-.321a6.944 6.944 0 0 1-.237-.884l-.98.194zm15.425 1.012c.112-.328.202-.666.27-1.011l-.98-.194c-.06.302-.14.597-.237.884l.947.321zM.824 11.54a8 8 0 0 0 .524.905l.83-.556a6.999 6.999 0 0 1-.458-.793l-.896.443zm13.828.905c.194-.289.37-.591.524-.906l-.896-.443c-.136.275-.29.54-.459.793l.831.556zm-12.667.83c.23.262.478.51.74.74l.66-.752a7.047 7.047 0 0 1-.648-.648l-.752.66zm11.29.74c.262-.23.51-.478.74-.74l-.752-.66c-.201.23-.418.447-.648.648l.66.752zm-1.735 1.161c.314-.155.616-.33.905-.524l-.556-.83a7.07 7.07 0 0 1-.793.458l.443.896zm-7.985-.524c.289.194.591.37.906.524l.443-.896a6.998 6.998 0 0 1-.793-.459l-.556.831zm1.873.925c.328.112.666.202 1.011.27l.194-.98a6.953 6.953 0 0 1-.884-.237l-.321.947zm4.132.271a7.944 7.944 0 0 0 1.012-.27l-.321-.948a6.954 6.954 0 0 1-.884.237l.194.98zm-2.083.135a8.1 8.1 0 0 0 1.046 0l-.064-.998a7.11 7.11 0 0 1-.918 0l-.064.998zM8.5 4.5a.5.5 0 0 0-1 0v3h-3a.5.5 0 0 0 0 1h3v3a.5.5 0 0 0 1 0v-3h3a.5.5 0 0 0 0-1h-3v-3z" fill="#43CC29"/>
                            </svg>
                        </div>
                            <div class="card-body">
                                <p class="card-text"></p>
                                <a class="nav-link" href="${pageContext.request.contextPath}/ajout-annonce">
                                    <button type="button" class="btn btn-outline-success btn-sm">
                                        Ajouter une annonce
                                        <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 576 512">
                                            <style>svg {
                                                fill: #ffffff
                                            }</style>
                                            <path d="M0 64C0 28.7 28.7 0 64 0H224V128c0 17.7 14.3 32 32 32H384V285.7l-86.8 86.8c-10.3 10.3-17.5 23.1-21 37.2l-18.7 74.9c-2.3 9.2-1.8 18.8 1.3 27.5H64c-35.3 0-64-28.7-64-64V64zm384 64H256V0L384 128zM549.8 235.7l14.4 14.4c15.6 15.6 15.6 40.9 0 56.6l-29.4 29.4-71-71 29.4-29.4c15.6-15.6 40.9-15.6 56.6 0zM311.9 417L441.1 287.8l71 71L382.9 487.9c-4.1 4.1-9.2 7-14.9 8.4l-60.1 15c-5.5 1.4-11.2-.2-15.2-4.2s-5.6-9.7-4.2-15.2l15-60.1c1.4-5.6 4.3-10.8 8.4-14.9z"/>
                                        </svg>
                                    </button>
                                </a>
                            </div>
                    </div>
                </div>
            </div>


        </div>

        </tbody>
        </table>
    </c:if>


</div>

<!-- Modal de suppression réussie -->
<div class="modal fade" id="successModal" tabindex="-1" aria-labelledby="successModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="successModalLabel">Suppression réussie</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                L'annonce a été supprimée avec succès.
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Fermer</button>
            </div>
        </div>
    </div>
</div>


<%@include file="parts/footer.jsp" %>
<%-- Définition de l'attribut annonceSupprimee --%>
<% request.setAttribute("annonceSupprimee", true); %>

<%-- Fin du contenu HTML --%>

<!-- Script JavaScript pour afficher la modal -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(document).ready(function () {
        // Vérifier la présence de l'attribut "annonceSupprimee" dans la session
        var annonceSupprimee = ${sessionScope.annonceSupprimee};

        if (annonceSupprimee) {
            $('#successModal').modal('show'); // Afficher la modal si l'annonce a été supprimée avec succès
            // Réinitialiser l'attribut pour qu'il ne s'affiche pas à nouveau lors de rechargements de la page
            <%
                request.getSession().removeAttribute("annonceSupprimee");
            %>
        }
    });
</script>
</body>
</html>
