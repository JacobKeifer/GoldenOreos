<%@page
    import="java.util.List"
    import="helpers.*"%>
<div class="panel panel-default">
	<div class="panel-body">
		<div class="bottom-nav">
            <h4> Options </h4>
            <!-- Put your part 2 code here -->
            <form action="analytics" method="post">
<%
String customer = "";
String order = "";
String filter = "";

try{
  if (request.getParameter("runQuery") != null){
    customer = (String) request.getParameter("rowSelector");
    order = (String) request.getParameter("order");
    filter = (String) request.getParameter("categoryFilter");
  }
}
catch (Exception e){
	
}
%>  
          
                <select name="rowSelector">                
                   <option value="customer" <%if(customer.equals("customer")){%> 
                    selected="selected"<%}%>> Customers </option>
                   <option value="state"<%if(customer.equals("state")){%> 
                    selected="selected"<%}%>> States </option>
                </select> <br />
                
                <select name="order">
                   <option value="alphabetical" <%if(order.equals("alphabetical")){%>
                   selected="selected"<%}%>> Alphabetical </option>
                   <option value="topK" <%if(order.equals("topK")){%>
                   selected="selected"<%}%>> Top-K </option>
                </select> <br />
                
                
                <%
                	List<String> categoryNames = CategoriesHelper.getCategoryNames();
                %>
                <select name="categoryFilter">
                <% for(String s : categoryNames){ %>
                   <option value="<%= s %>"<%if(filter.equals(s)){%>
                   selected="selected"<%}%>> <%= s %> </option>
                   <%}%>
                   <option value="all" <%if(filter.equals("all") || filter.equals("")){%>
                   selected="selected"<%}%>> All Categories </option>
                </select> <br />
                
            	<input type="submit" name="runQuery" value="Run Query">
            </form>
		</div>
	</div>
</div>