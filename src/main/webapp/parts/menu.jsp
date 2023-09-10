<%--
  Created by IntelliJ IDEA.
  User: aero
  Date: 05/09/2023
  Time: 16:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class="navbar navbar-expand-lg bg-primary" data-bs-theme="dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/list">Infos Locales</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarColor01">
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/list">Toutes les annonces</a>
                </li>
                <c:if test="${sessionScope.user != null}">
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/ajout-annonce">Ajouter une annonce</a>
                    </li>
                </c:if>
            </ul>
        </div>
    </div>
</nav>
