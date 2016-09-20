<%-- 
    Document   : addklanttoadres
    Created on : 20-sep-2016, 14:08:35
    Author     : Wendy
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>klant aan adres toevoegen</title>
    </head>
    <body>
        <h1>Voeg klantgegevens aan uw adres toe</h1>
        
        
                <form method = "POST" >
                        
          <c:choose>
              <c:when test="${edit}">
                    klant nummer &nbsp <input type = "text" name = "klantNummer" /><br/>
                    Voornaam <input type = "text" name = "voornaam" /> <br/>
                    Achternaam <input type = "text" name = "achternaam" /> <br/>
                    Tussenvoegsel <input type = "text" name = "tussenvoegsel" /> <br/>
                    Email <input type = "text" name = "email" /> <br/>
                    <c:choose>
                        <c:when test="${adresId}">
                            Adres <input type = "text" name = "adresId" value = "${adresId}"/>
                        </c:when>    
                    </c:choose>     
                   
                    <input type="submit" value="opslaan" /> |
                    <a href="<c:url value='/adres/readalladres' />">Annuleer</a>
                    
                    
                    
              </c:when>
              
              <c:otherwise>
                    klant nummer &nbsp <input type = "text" name = "klantNummer" /><br/>
                    Voornaam &nbsp &nbsp <input type = "text" name = "voornaam" /> <br/>
                    Achternaam &nbsp <input type = "text" name = "achternaam" /> <br/>
                    Tussenvoegsel &nbsp <input type = "text" name = "tussenvoegsel" /> <br/>
                    Email &nbsp &nbsp &nbsp <input type = "email" name = "email" /> <br/>
                    
                    <c:choose>
                        <c:when test="${adresId}">
                            Adres <input type = "text" name = "adresId" value = "${adresId}"/>
                        </c:when>    
                    </c:choose>     
                    <input type="submit" value="voeg toe" /> |
                    <a href="<c:url value='/adres/readalladres' />">Annuleer</a>
                    
                    <%--
                    doorverwijzen naar methode die klant kan terug geven
                    --%>
                   
                    
                    
              </c:otherwise>
           </c:choose> 
        </form>
           
                    <a href = "<c:url value = '/'/>"> Terug naar huis</a>
        
        
    </body>
</html>
