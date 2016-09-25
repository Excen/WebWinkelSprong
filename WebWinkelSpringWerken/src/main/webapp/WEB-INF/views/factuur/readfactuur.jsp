<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- 
    Document   : readfactuur
    Created on : 19-sep-2016, 16:29:27
    Author     : Wendy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href = "<c:url value = "/resources/css/main.css"/>"  rel = "stylesheet" type = "text/css">
        
        <title>FACTUUR NR-${factuurId}</title>
    </head>
    <body><div align ="center">
        <h1>Factuur</h1>
       <table>
           <tr>
               <td> factuurId</td>
               <td>${factuurId}</td>
           </tr>    
           <tr>
               <td> factuurnummer</td>
               <td>${factuurnummer}</td>
           </tr>  
           <tr>
               <td> factuurdatum</td>              
                <td><fmt:formatDate type="both" 
                   dateStyle="long" timeStyle="short" 
                   value="${factuurdatum}" /></td>              
            </tr>  
           <tr>
               <td> factuur bij bestelling</td>
               <td>${factuurbestelling}</td>
           </tr>  
           <tr>
               <td> factuur van klant</td>
               <td>${factuurklant}</td>
           </tr>  
           
           <tr><tr>
           <tr>
               <td >Totaalbedrag van factuur</td>
               <td><fmt:setLocale value='de-DE' />
                    <fmt:formatNumber type="currency" maxFractionDigits='2' minFractionDigits="2" currencySymbol="€" value="${factuurbedrag}" />
                    </td>
                   
           <%--tr>
               <td>Betalingen bij factuur</td>
               <c:forEach var="factuur" items="${factuurbetalingset}" varStatus="status">
               <td>${factuurbetalingset}</td>
               </c:forEach>
           </tr--%>  
       </table>
        
        <br/>
        <br/>
        <a href = "<c:url value = '/factuur/readallfactuur'/>" >Terug naar factuurlijst </a>
        <br/>
        <a href = "<c:url value = '/'/>"> Terug naar huis</a>
        </div>
    </body>
</html>
