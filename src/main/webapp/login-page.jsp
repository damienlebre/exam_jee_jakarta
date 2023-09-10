<%--
  Created by IntelliJ IDEA.
  User: roota
  Date: 08/09/2023
  Time: 10:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Espace de Connexion</title>

    <%@include file="parts/script-style.jsp"%>

</head>
<body>

<%@include file="parts/header.jsp"%>

<%@include file="parts/menu.jsp"%>



<section class="mx-4 min-vh-100">

    <form method="post" class="mt-5">
        <fieldset>
            <legend><h1>Formulaire de Connexion : </h1></legend>

            <div class="form-group col-md-4">
                <label for="username" class="form-label  mt-4">Username</label>
                <input type="text" class="form-control" id="username" name="username" aria-describedby="usernameHelp" placeholder="username">
<%--                <small id="usernameHelp" class="form-text text-muted">texte.</small>--%>
            </div>
            <div class="form-group col-md-4">
                <label for="InputPassword" class="form-label mt-4">Password</label>
                <input type="password" class="form-control" id="InputPassword" name="password" placeholder="Password" autocomplete="off">
            </div>


            <button type="submit" class="btn btn-outline-primary my-5">Se connecter</button>

            <div>
                <c:if test="${error}">
                    <div id="validationServerUsernameFeedback" class="text-danger">
                        Identifiants incorrects
                    </div>
                </c:if>
<%--                <c:if test = "${errors.size() !=  0}">--%>
<%--                    <ol class="text-danger text-center">--%>
<%--                        <c:forEach items="${ errors }" var="error">--%>
<%--                            <li>${error.message}</li>--%>
<%--                        </c:forEach>--%>
<%--                    </ol>--%>
<%--                </c:if>--%>
            </div>


        </fieldset>
    </form>

</section>

<%@include file="parts/footer.jsp"%>
</body>
</html>
