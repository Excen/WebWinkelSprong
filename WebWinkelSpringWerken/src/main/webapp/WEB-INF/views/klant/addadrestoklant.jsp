<%-- 
    Document   : addadrestoklant
    Created on : 22-sep-2016, 17:01:38
    Author     : Anne
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Adres aan klant toevoegen</title>
    </head>
    <body>
        <h1>Adres toevoegen aan deze klant</h1>
        <form method ="POST">
            <c:choose>
                <c:when test = "${edit}">
                    straatnaam <input type ="text" name ="straatnaam" /><br/>
                    postcode <input type ="text" name= "postcode" /><br/>
                    toevoeging <input type = "text" name = "toevoeging" /><br/>
                    huisnummer <input type ="text" name = "huisnummer" /><br/>
                    woonplaats <input type = "text" name = "woonplaats" /><br/>
                    Adres type <select name="adresType" >                
                        <c:forEach items="${enumValues}" var="adresType" varStatus = "status">
                            <option value="${adresType}" label="--Maak uw keuze">                                
                                <c:out value="${adresType}"></c:out>
                            </option>
                        </c:forEach>
                    </select>
                    <c:choose>
                        <c:when test = "${klantId}">
                            Klant <input type = "text" name = "adresId" value = "${klantId}"/>
                        </c:when>
                    </c:choose>
                            
                            <input type="submit" value="opslaan" /> |
                            <a href="<c:url value='/klant/readallklant' />">Annuleer</a>
                </c:when>
                <c:otherwise>
                    straatnaam <input type ="text" name ="straatnaam" /><br/>
                    postcode <input type ="text" name= "postcode" /><br/>
                    toevoeging <input type = "text" name = "toevoeging" /><br/>
                    huisnummer <input type ="text" name = "huisnummer" /><br/>
                    woonplaats <input type = "text" name = "woonplaats" /><br/>
                    Adres type <select name="adresType" >                
                        <c:forEach items="${enumValues}" var="adresType" varStatus = "status">
                            <option value="${adresType}" label="--Maak uw keuze">                                
                                <c:out value="${adresType}"></c:out>
                            </option>
                        </c:forEach>
                    </select>
                    <c:choose>
                        <c:when test = "${klantId}">
                            Klant <input type = "text" name = "klantId" value = "${klantId}"/>
                        </c:when>
                    </c:choose>
                        <input type="submit" value="voeg toe" /> |
                        <a href="<c:url value='/klant/readallklant' />">Annuleer</a>
                </c:otherwise>
            </c:choose>
                    
        </form>
             <a href = "<c:url value = '/'/>"> Terug naar huis</a>
    </body>
</html>


