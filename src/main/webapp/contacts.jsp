<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!doctype html>
<html lang="pl">
<head>
    <meta charset="utf-8">
    <title>Kontakty</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css"
          integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css?family=Lato|Open+Sans" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
            integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
            crossorigin="anonymous"></script>
</head>
<body>
<div class="container">
    <h2>Kontakty</h2>
    <div class="navbar">
        <c:choose>
            <c:when test="${not empty user}">
                Zalogowano jako ${user.login}
                <a href="/logout">Wyloguj</a>
            </c:when>
            <c:otherwise>
                <a href="login.jsp">Login</a>
                <a href="register.jsp">Rejestracja</a>
            </c:otherwise>
        </c:choose>
    </div>
    <div class="content">
        <h3>Spis kontaktów</h3>

        <div class="message">${message}</div>
        <%--If user is logged in - show options to modify contacts base. If not - don't display them. User was set in session during loging in.--%>

        <c:forEach var="entry" items="${contacts}">
            <details id="contact">
                <summary>
                    <span>${entry.name} </span>
                    <span>${entry.surname} </span>
                </summary>


                <ul>
                    <li>Email: ${entry.email}</li>
                    <li>Hasło: ${entry.password}</li>
                    <li>Kategoria: ${entry.category}</li>
                    <li>Podkategoria: ${entry.subcategory}</li>
                    <li>Numer telefonu: ${entry.telephone}</li>
                    <li>Data urodzenia: ${entry.dob}</li>

                        <%--Only logged user can modify contacts--%>
                    <c:choose>
                        <c:when test="${not empty user}">

                            <li><a href="/delete?id=${entry.id}">Usuń wpis</a></li>
                            <li><a href="/prepareContact?id=${entry.id}" id="begin">Edytuj wpis</a></li>
                        </c:when>
                        <c:otherwise>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </details>

        </c:forEach>

        <ul>
            <c:choose>
                <c:when test="${not empty user}">
                    <li><a href="
        /form.jsp">Dodaj nowy wpis</a></li>
                </c:when>
                <c:otherwise>
                </c:otherwise>
            </c:choose>

            <li><a href="/index.jsp">Wróć do strony głównej</a></li>
        </ul>

    </div>

</div>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
</body>
</html>
