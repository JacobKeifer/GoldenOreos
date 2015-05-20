<%@page
    import="java.util.List"
    import="java.util.ArrayList"
    import="helpers.*"%>
    
<%
try{
if (request.getParameter("runQuery") != null){

String customer = (String) request.getParameter("rowSelector");
String order = (String) request.getParameter("order");
String filter = (String) request.getParameter("categoryFilter");

List<ProductTotalHelper> products = AnalyticsHelper.listProductHeader();   
List<UsersWithSales> usersData = AnalyticsHelper.listUsers();
List<UserTotals> usersTotal = AnalyticsHelper.userTotals();

int productCounter = 0;
int counter;
int userCounter = 0;

if (filter.equals("all") && order.equals("alphabetical") && customer.equals("customer")){
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
} // If statement check for all, alphabetical, customer
} // If statement
} // Try statement
catch (Exception e){
  out.println("Filter your search");	
}

%>
  