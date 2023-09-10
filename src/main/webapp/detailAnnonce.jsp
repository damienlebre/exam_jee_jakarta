<%--
  Created by IntelliJ IDEA.
  User: roota
  Date: 09/09/2023
  Time: 04:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Détail de l'annonce ${annonce.getTitre()} : </title>
    <%@include file="parts/script-style.jsp" %>
</head>
<body>
<%@include file="parts/header.jsp" %>

<%@include file="parts/menu.jsp" %>

<div class="container mx-5 min-vh-100">

    <div class="title container my-5">
        <h1>Détail de l'annonce ${annonce.getTitre()} :</h1>
        <c:if test="${sessionScope.user != null}">
            <p>Bonjour ${user.username} :) !</p>
            <a  href="${pageContext.request.contextPath}/logout-registeredUser">Se déconnecter</a>
        </c:if>
    </div>
    <div class="d-flex justify-content-center">
        <div class="card col-lg-6 col-md-6 col-sm-6 col-xs-12">
            <h3 class="card-header">${annonce.getTitre()}</h3>

            <img width="100%" height="100%" src="images/${annonce.getImage()}">

            <div class="card-body">
                <p class="card-text">${annonce.getDescriptionCourte()}</p>
                <hr>
                <p class="card-text">${annonce.getContenu()}</p>
                <c:if test="${sessionScope.user != null}">
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
                        <button type="button" class="btn btn-outline-success btn-sm">
                            Editer
                            <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 576 512">
                                <path d="M0 64C0 28.7 28.7 0 64 0H224V128c0 17.7 14.3 32 32 32H384V285.7l-86.8 86.8c-10.3 10.3-17.5 23.1-21 37.2l-18.7 74.9c-2.3 9.2-1.8 18.8 1.3 27.5H64c-35.3 0-64-28.7-64-64V64zm384 64H256V0L384 128zM549.8 235.7l14.4 14.4c15.6 15.6 15.6 40.9 0 56.6l-29.4 29.4-71-71 29.4-29.4c15.6-15.6 40.9-15.6 56.6 0zM311.9 417L441.1 287.8l71 71L382.9 487.9c-4.1 4.1-9.2 7-14.9 8.4l-60.1 15c-5.5 1.4-11.2-.2-15.2-4.2s-5.6-9.7-4.2-15.2l15-60.1c1.4-5.6 4.3-10.8 8.4-14.9z"/>
                            </svg>
                        </button>
                    </a>
                </c:if>
            </div>

            <div class="card-footer">
                <small class="text-muted">Date de publication : ${annonce.getDatePublication()}</small>
            </div>

        </div>

    </div>

    <div class="my-5 text-center">
        <a href="${pageContext.request.contextPath}/list">revenir à la liste de toutes les annonces</a>
    </div>

</div>


<%@include file="parts/footer.jsp" %>

</body>
</html>