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
        ${error}
        <form method = "POST" >
                        
          <c:choose>
                    <c:when test="${edit}">
                        <p>gegevens aanpassen</p><br/>                        
                        <p>factuurnummer: ${2016 + factuur.id}</p><br/>
                        <p>factuurdatum: ${factuur.factuurdatum}</p><br/>
                                                
                        Klant <input type = "text" name = "klant" value ="${factuur.klant}"/> <br/>
                        Bestelling <input type = "text" name = "omschrijving" value ="${factuur.bestelling}"/><br/>
                        Betaling <input type = "text" name = "bestelling" value ="${factuur.betalingset}" /><br/>        
                        
                        <input type="submit" value="opslaan"/> | 
                        <a href="<c:url value='/bestelling/homebestelling' />">Annuleer</a>
                    </c:when>
                        
                    <c:otherwise>
                            Factuurnummer <input type = "text" name = "factuurnummer" value ="2016-${bestelling.id}" /> <br/>
                            <%--Betaling <input type = "text" name = "betaling"/><br/>
                            Klant <input type = "text" name = "klant" value ="${klant}" /> <br/>
                            Bestelling <input type = "text" name = "bestelling" value = "${bestelling}"/> <br/> --%>
                            
                            
                            
                            
                            <input type="submit" value="voeg toe" /> |
                            <a href="<c:url value='/bestelling/homebestelling' />">Annuleer</a>
                    </c:otherwise>
                </c:choose>  
        
        </form>   
        
        
        <a href = "<c:url value = '/'/>"> HOME </a>
        
    </body>
</html>
