<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

  <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
   
   
  <div id="paging">
     <table>
      <tr>      
        <!-- 처음/이전 --> 
          <td><a href="/BoardPaing/List?nowpage=1&menu_id=M${menu_id}">⏮</a></td>        
          <td><a href="">⏪</a></td>        
        
        <c:forEach var="pagenum" begin="1" end="10" step="1">
          <td>
            <a href="/BoardPaing/List?nowpage=${pagenum}&menu_id=${menu_id}">
              ${ pagenum }
            </a>
          </td>        
        </c:forEach>
        
        <!-- 다음/마지막 -->  
          <td><a href="">⏩</a></td>        
          <td><a href="">⏭</a></td>              
      </tr>
     </table>
   </div>
    
 
    
    