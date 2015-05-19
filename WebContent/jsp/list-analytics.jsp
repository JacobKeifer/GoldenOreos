<%@page
    import="java.util.List"
    import="java.util.ArrayList"
    import="helpers.*"%>
    
<%
List<ProductTotalHelper> products = AnalyticsHelper.listProductHeader();   
List<UsersWithSales> usersData = AnalyticsHelper.listUsers();
List<UserTotals> usersTotal = AnalyticsHelper.userTotals();

int productCounter = 0;
int counter;
int userCounter = 0;
%>       
<table style="border:1px"
  class="table table-striped"
  align="center">
     
  <thead>
    <tr align="center">
    <th width=20%> Users </th>
<% 
  for (ProductTotalHelper us : products){
 
%>
    <th width=20%><B> <%=us.getProductName()%></B><br>(<%=us.getSales()%>)</th>
<%
productCounter++;
  }
%>
    </tr>
    
    
  </thead>
<%
  counter = 0;
  for (UsersWithSales pro : usersData){
%>
<% if(counter % productCounter == 0) {%>
    <tr>
      <td width=20%> <%=pro.getName()%><br>(<%=usersTotal.get(userCounter).getSales()%>)</td>
      <td width=20%> <%=pro.getSales()%></td>
    <%  
   userCounter++; 
   } 
else { %>

      <td width=20%> <%=pro.getSales()%></td>
      <%   } 
          if(counter % productCounter == (productCounter - 1)){
      %>
      </tr>
      <% }
          counter++;
      
      %>
<% 	  
  }
%>
  