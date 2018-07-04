<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="pl">
<head>
    <meta charset="utf-8">
    <title>Kontakty</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css"
          integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
    <link rel="stylesheet" href="css/style.css">
    <link href="https://fonts.googleapis.com/css?family=Lato|Open+Sans" rel="stylesheet">

</head>
<body>
<div class="container">
    <h2>Contacts</h2>
    <div class="navbar">
        <c:choose>
            <c:when test="${not empty user}">
                ${user.login}
                <a href="/logout">Wyloguj</a>
            </c:when>
            <c:otherwise>
                <a href="login.jsp">Login</a>
                <a href="register.jsp">Rejestracja</a>
            </c:otherwise>
        </c:choose>
    </div>
    <div class="content">
        <h3>Kontakty</h3>
        ${message}
        ${errorMessage}

        <c:choose>
            <c:when test="${not empty user}">
                <c:forEach var="entry" items="${contacts}">
                    <details>
                        <summary>${entry.name} ${entry.surname} </summary>
                        <ul>
                            <li> ${entry.email}</li>
                            <li> ${entry.password}</li>
                            <li> ${entry.category}</li>
                            <li> ${entry.subcategory}</li>
                            <li> ${entry.telephone}</li>
                            <li> ${entry.dob}</li>
                            <li><a href="/delete?id=${entry.id}">Usuń wpis</a></li>
                            <li><a href="/edit?id=${entry.id}">Edytuj wpis</a></li>
                        </ul>
                    </details>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <c:forEach var="entry" items="${contacts}">
                    <details>
                        <summary>${entry.name} ${entry.surname} </summary>
                        <ul>
                            <li> ${entry.email}</li>
                            <li> ${entry.password}</li>
                            <li> ${entry.category}</li>
                            <li> ${entry.subcategory}</li>
                            <li> ${entry.telephone}</li>
                            <li> ${entry.dob}</li>
                        </ul>
                    </details>
                </c:forEach>
            </c:otherwise>
        </c:choose>
        <a href="/index.jsp">Wróć do strony głównej</a>
        <a href="/addContact.jsp">Dodaj nowy wpis</a>

    </div>
</div>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
</body>
</html>
