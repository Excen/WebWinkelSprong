<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : addbetaling
    Created on : 19-sep-2016, 22:01:39
    Author     : Wendy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href = "<c:url value = "/resources/css/main.css"/>"  rel = "stylesheet" type = "text/css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Betaling toevoegen</title>
    </head>
    <body>
        <h1>ADD Betaling</h1>
        
        <form method="POST">
            <c:choose>
                <c:when test="${edit}">
                    Betaaldatum <input type = "text" name = "betaaldatum" value =${betaling.betaaldatum}/> <br/>
                    Factuur<input type = "text" name = "factuur" value = ${betaling.factuur}/><br/>
                    Betaalwijze<select name="betaalwijze">
                        <c:forEach items="${enumValues}" var="betaalwijze" varStatus = "status">
                            <option value="${betaalwijze}" label="--Maak uw keuze">
                                <c:out value="${betaalwijze}"></c:out>
                            </option>    
                    </c:forEach>
                    </select> <br/>                    
                    Betaal Gegevens<input type = "text" name = "betalingsGegevens" value = ${betaling.betalingsGegevens}/> <br/>
                    Klant <input type = "text" name = "omschrijving" value = ${betaling.klant}/><br/>


                    <input type = "submit" value = "opslaan"/> | 
                    <a href="<c:url value='/betaling/readallbetaling' />">Annuleer</a>
                </c:when>
            
                <c:otherwise>                    
                    Betaaldatum <input type = "text" name = "betaaldatum" value =  <%= (new java.util.Date()) %>/> <br/>
                    Factuur<input type = "text" name = "factuur" /><br/>
                    Betaalwijze<select name="betaalwijze">
                        <c:forEach items="${enumValues}" var="betaalwijze" varStatus="status">
                            <option value="${betaalwijze}" label="--Maak uw keuze">
                                <c:out value="${betaalwijze}"></c:out>
                            </option>    
                    </c:forEach>
                    </select> <br/>
                    Betaal Gegevens<input type = "text" name = "betalingsGegevens" /> <br/>
                    Klant <input type = "text" name = "omschrijving" ><br/> 

                    <input type="submit" value="voeg toe" /> |
                                    <a href="<c:url value='/betaling/readallbetaling' />">Annuleer</a>  
            
                </c:otherwise>    
            </c:choose>
            <br/>
            <a href = "<c:url value = '/'/>"> Terug naar huis</a>
         </form>
        
        
        
    </body>
</html>
