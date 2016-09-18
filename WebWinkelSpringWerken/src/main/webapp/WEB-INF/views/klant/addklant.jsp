<%-- 
    Document   : addklant
    Created on : 17-sep-2016, 22:28:20
    Author     : Anne
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Klant toevoegen</title>
    </head>
    <body>
        <h1>Klant toevoegen</h1>
        
        <form method = "POST" >
                        
          <c:choose>
              <%-- <c:when test="${edit}">
                    klant nummer &nbsp <input type = "text" name = "klantNummer" /><br/>
                    Voornaam <input type = "text" name = "voornaam" /> <br/>
                    Achternaam <input type = "text" name = "achternaam" /> <br/>
                    Tussenvoegsel <input type = "text" name = "tussenvoegsel" /> <br/>
                    Email <input type = "text" name = "email" /> <br/>
              </c:when>
              --%>
              <c:otherwise>
                    klant nummer &nbsp <input type = "text" name = "klantNummer" /><br/>
                    Voornaam &nbsp &nbsp <input type = "text" name = "voornaam" /> <br/>
                    Achternaam &nbsp <input type = "text" name = "achternaam" /> <br/>
                    Tussenvoegsel &nbsp <input type = "text" name = "tussenvoegsel" /> <br/>
                    Email &nbsp &nbsp &nbsp <input type = "text" name = "email" /> <br/>
                    <input type="submit" value="voeg toe" /> |
                    <a href="<c:url value='/artikel/readallartikel' />">Annuleer</a>
              </c:otherwise>
           </c:choose> 
        </form>
           
                    <a href = "<c:url value = '/'/>"> Terug naar huis</a>
           
    </body>
</html>
