<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core"%>

<%-- 
    Document   : addfactuur
    Created on : 18-sep-2016, 23:18:49
    Author     : Wendy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href = "<c:url value = "/resources/css/main.css"/>"  rel = "stylesheet" type = "text/css">
        <title>factuurgegevens toevoegen</title>
    </head>
    <body>
        <h1>Factuurgegevens toevoegen</h1>
        
        <form method = "POST" >
                        
          <c:choose>
                    <c:when test="${edit}">
                        <p>gegevens aanpassen</p><br/>                        
                        <p>factuurnummer: ${factuur.factuurnummer}</p><br/>
                        <p>factuurdatum: ${factuur.factuurdatum}</p><br/>
                                                
                        Klant <input type = "text" name = "klant" value ="${factuur.klant}"/> <br/>
                        Bestelling <input type = "text" name = "omschrijving" value ="${factuur.bestelling}"/><br/>
                        Betaling <input type = "text" name = "artikelNummer" value ="${factuur.betalingset}" /><br/>        
                        
                        <input type="submit" value="opslaan"/> | 
                        <a href="<c:url value='/artikel/readallartikel' />">Annuleer</a>
                    </c:when>
                        
                    <c:otherwise>
                            Factuurnummer <input type = "text" name = "factuurnummer" /> <br/>
                            Factuurdatum <input type = "date" name = "facturdatum" /> <br/>
                            Klant <input type = "text" name = "klant"/><br/>
                            Bestelling   <input type = "text" name = "bestelling" /><br/>
                            Betaling <input type = "text" name = "betaling"/><br/>
                            
                            <input type="submit" value="voeg toe" /> |
                            <a href="<c:url value='/artikel/readallartikel' />">Annuleer</a>
                    </c:otherwise>
                </c:choose>  
        
        </form>   
        
        
        <a href = "<c:url value = '/'/>"> HOME </a>
        
    </body>
</html>
