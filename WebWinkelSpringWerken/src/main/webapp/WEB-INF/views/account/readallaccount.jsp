<%-- 
    Document   : accountlijst
    Created on : 11-sep-2016, 16:06:27
    Author     : Wendy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <link href = "<c:url value = "/resources/css/main.css"/>"  rel = "stylesheet" type = "text/css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div align="center">
            <h1>Contact List</h1>
            <table border="1">
                <th width="80">Id</th>
                <th width="120">Accountnaam</th>
                <th width="150">Email</th>
                 
                <c:forEach var="account" items="${accounts}" varStatus="status">
                <tr>
                    <td>${account.id + 1}</td>
                    <td>${account.username}</td>
                    <td>${account.password}</td>
                             
                </tr>
                </c:forEach>             
            </table>
            <a href = "<c:url value = '/'/>"> Terug naar huis</a>
        </div>
    </body>
</html>
