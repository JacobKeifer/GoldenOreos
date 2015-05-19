<%@page
    import="java.util.List"
    import="helpers.*"%>
<div class="panel panel-default">
	<div class="panel-body">
		<div class="bottom-nav">
            <h4> Options </h4>
            <!-- Put your part 2 code here -->
            <form action="/jsp/list-analytics.jsp" method="post">
                <select name="rowSelector">
                   <option value="customer" selected="selected"> Customers </option>
                   <option value="state"> States </option>
                </select> <br />
                
                <select name="order">
                   <option value="alphabetical"> Alphabetical </option>
                   <option value="topK"> Top-K </option>
                </select> <br />
                
                
                <%
                	List<String> categoryNames = CategoriesHelper.getCategoryNames();
                %>
                <select name="categoryFilter">
                <% for(String s : categoryNames){ %>
                   <option value="<%= s %>"> <%= s %> </option>
                   <%}%>
                   <option value="all" selected="selected"> All Categories </option>
                </select> <br />
                
            	<input type="submit" name="runQuery" value="Run Query">
            </form>
		</div>
	</div>
</div>