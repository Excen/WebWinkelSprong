<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core"%>

<%-- 
    Document   : addaccount
    Created on : 18-sep-2016, 12:49:39
    Author     : Anne
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Account toevoegen</title>
    </head>
    <body>
        <h1>Account toevoegen</h1>
        
        <form method = "POST" >
                        
            <c:choose>
                 <c:when test="${edit}">
                     
                  Account gebruikersnaam &nbsp <input type = "text" name = "username" value = "${account.username}" /><br/>
                  Wachtwoord &nbsp &nbsp <input type = "text" name = "password" value = "${account.password}" /> <br/>
                  Creatiedatum <input type = "text" name = "creatiedatum" value = "${account.creatieDatum}"/> <br/>   
                    
                    <input type = "submit" value = "opslaan"/> 
                    <a href="<c:url value='/account/readallaccount' />">Annuleer</a> 
                    
              </c:when>
              <c:otherwise>
                    Account gebruikersnaam &nbsp <input type = "text" name = "username" /><br/>
                    Wachtwoord &nbsp &nbsp <input type = "text" name = "password" /> <br/>
                    Creatiedatum <input type = "text" name = "creatiedatum" value =  <%= (new java.util.Date()) %>/> <br/>
                    
                    <input type="submit" value="voeg toe" /> |
                    <a href="<c:url value='/account/readallaccount' />">Annuleer</a>
                    
              </c:otherwise>
           </c:choose> 
        </form>
           
                    <a href = "<c:url value = '/'/>"> Terug naar huis</a>
                 
    </body>
</html>


