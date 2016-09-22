<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : addbestelling
    Created on : Sep 18, 2016, 5:09:39 PM
    Author     : Excen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href = "<c:url value = "/resources/css/main.css"/>"  rel = "stylesheet" type = "text/css">
        <title>Invoer Bestelling</title>
    </head>
    <body>
         <h1>Bestelling</h1>
        <p> Het is vandaag:
        <%=new java.util.Date() %> 
        </p>
        
        <h3>Bestelling Gegevens</h3>
        <form method = "POST" >
                        
          <c:choose>
                    <c:when test="${edit}">
                        Artikel <input type = "text" name = "bestellingArtikellen"  /> <br/>
                        Aantal <input type = "text" name = "artikelAantal" /> <br/>
                        Datum <input type = "date" name = "bestellingDatum" value ="${bestelling.bestellingDatum}"/><br/>
                        Klant   <input type = "text" name = "klant"  /><br/>        
                        
                        <input type="submit" value="opslaan"/> | 
                        <a href="<c:url value='/artikel/readallartikel' />">Annuleer</a>
                    </c:when>
                        
                    <c:otherwise>
                             
                            Artikel <select name="artikelnaam" >                
                                <c:forEach items="${artikellijst}" var="option" varStatus = "status">
                                    <option value="${artikel.artikelNaam}" label="--Please Select">                                
                                        <c:out value="${artikel.artikelNaam}"></c:out>
                                        </option>
                                        <td><form method="POST"><input type ="hidden" name="ArtikelId" value="${artikel.id}">
                                        <input type="submit" value="Artikel toevoegen"></input></form></td>
                                        
                                </c:forEach> 
                            </select>         
                             
                             Datum <input type = "date" name = "bestellingDatum" /><br/>
                            <c:choose>
                        <c:when test="${klant}">
                            Klant <input type = "text" name = "klant" value ="${klant}"/>
                        </c:when>    
                            </c:choose>
                            <input type="submit" value="voeg toe" /> |
                            <a href="<c:url value='/bestelling/homebestelling' />">Annuleer</a>
                    </c:otherwise>
                </c:choose>  
        
        </form>   
        
        
        <a href = "<c:url value = '/'/>"> Terug naar huis</a>
    </body>
</html>

            