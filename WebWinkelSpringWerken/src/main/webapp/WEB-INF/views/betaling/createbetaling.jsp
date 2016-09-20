<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : createbetaling
    Created on : 19-sep-2016, 22:01:28
    Author     : Wendy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href = "<c:url value = "/resources/css/main.css"/>"  rel = "stylesheet" type = "text/css">
        <title>Betaling toevoegen</title>
    </head>
    <body>
        <h1>Create Betaling</h1>
        
        <form method="POST">
            Betaaldatum <input type = "text" name = "betaaldatum" value =${betaling.betaaldatum}/> <br/>
            Factuur<input type = "text" name = "factuur" value = ${betaling.factuur}/><br/>
            Betaalwijze<select name="betaalwijze">
                <c:forEach items="${enumValues}" var="option" >
                    <option value="${betaalwijze}" label="--Please Select">
                        <c:out value="${betaalwijze}"></c:out>
                    </option>    
               </c:forEach>     
               </select> 
            <br/>
            Betaal Gegevens<input type = "text" name = "betalingsGegevens" value = ${betaling.betalingsGegevens}/> <br/>
            Klant <input type = "text" name = "omschrijving" value = ${betaling.klant}/><br/>

            <input type = "submit" value = "opslaan"/> | 
            <a href="<c:url value='/betaling/readallbetaling' />">Annuleer</a>            
        </form>
            <br/>            
            <a href="<c:url value='/' />">HOME</a>
        
    </body>
</html>
