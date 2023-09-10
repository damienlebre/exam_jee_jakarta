<%--
  Created by IntelliJ IDEA.
  User: roota
  Date: 09/09/2023
  Time: 02:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <title>Ajouter une plage</title>
  <%@include file="parts/script-style.jsp"%>

</head>
<body>
<%@include file="parts/header.jsp"%>

<%@include file="parts/menu.jsp"%>

<div class="container mx-5 min-vh-100 ">

  <%--  <div class="title container my-5 mx-5">--%>
  <%--      <h1>Ajouter une nouvelle  Plage : </h1>--%>
  <%--  </div>--%>

    <c:if test="${sessionScope.user != null}">
      <p>Bonjour ${user.username} :) !</p>
      <a  href="${pageContext.request.contextPath}/logout-registeredUser">Se déconnecter</a>
    </c:if>

  <form method="post"  class="mt-5">
    <fieldset>
      <legend><h1>Ajouter une nouvelle  Annonce : </h1></legend>

      <div class="form-group">

        <div>
          <label for="titreAnnonce" class="form-label mt-4">Titre de l'annonce : </label>
          <input type="text" name="titre-annonce" placeholder="Titre de l'annonce" class="form-control" id="titreAnnonce">
          <small class="form-text text-muted">Le titre doit faire entre 4 et 50 caractères.</small>
        </div>

        <div>
          <label for="descriptionCourteAnnonce" class="form-label mt-4">Description courte : </label>
          <input type="text" name="descriptionCourte-annonce" placeholder="description courte de votre annonce" class="form-control" id="descriptionCourteAnnonce">
          <small class="form-text text-muted">150 caractères max.</small>
        </div>

        <div>
          <label for="imageAnnonce" class="form-label mt-4">Image de l'annonce : </label>
          <input type="text" name="image-annonce" placeholder="image pour votre annonce" class="form-control" id="imageAnnonce">
<%--          <input type="file" name="image-annonce" id="imageAnnonce">--%>
        </div>

        <div>
          <label for="corpAnnonce" class="form-label mt-4">Votre annonce : </label>
          <textarea type="text" name="corp-annonce" placeholder="taper ici votre annonce" class="form-control" id="corpAnnonce" rows="8"></textarea>
        </div>



        <button type="submit" class="btn btn-outline-primary my-5">Enregistrer l'annonce.</button>

        <div class="text-center">
          <c:if test = "${errors.size() !=  0}">
            <ol class="text-danger text-center">
              <c:forEach items="${ errors }" var="error">
                <li>${error.message}</li>
              </c:forEach>
            </ol>
          </c:if>
        </div>
      </div>

    </fieldset>
  </form>



    <a  href="${pageContext.request.contextPath}/list">revenir à la liste de toutes les annonces</a>


  </div>


<%@include file="parts/footer.jsp"%>

</body>
</html>

