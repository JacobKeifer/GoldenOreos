package helpers;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

public class AnalyticsHelper {
  public static List<ProductTotalHelper> listProductHeader(){
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
    
    String userName;
    String productName;
    Float totalSales;
    
    List<ProductTotalHelper> productTotals = new ArrayList<ProductTotalHelper>();
    List<UsersWithSales> users = new ArrayList<UsersWithSales>();
    try {
      try {
        conn = HelperUtils.connect(); 
      } catch (Exception e) {
    	  System.err.println("Internal Server error. This shouldn't happen");
      }
      stmt = conn.createStatement();
      String query = "Select p.name, sum(s.quantity*s.price) as totalSale from sales s RIGHT OUTER JOIN products p on p.id = s.pid group by p.name order by p.name LIMIT 20 OFFSET 0";

      rs = stmt.executeQuery(query);
      while(rs.next()){
        //userName = rs.getString(1);
        productName = rs.getString(1);
        totalSales = rs.getFloat(2);
        productTotals.add(new ProductTotalHelper(productName, totalSales));
      }
      return productTotals;
    } catch (Exception e) {
    	System.err.println("Some error happened!" + e.getMessage());
    	return new ArrayList<ProductTotalHelper>();
    } finally {
    	try {
    		//stmt.close();
    		conn.close();
    	} catch (SQLException e) {
    		System.err.println("HELP!!");
    	}
    }
  }
  
  public static List<UsersWithSales> listUsers(){
	  Connection conn = null;
	    Statement stmt = null;
	    ResultSet rs = null;
	    
	    String userName;
	    String productName;
	    Float totalSales;
	    
	    List<UsersWithSales> users = new ArrayList<UsersWithSales>();
	    try {
	      try {
	        conn = HelperUtils.connect(); 
	      } catch (Exception e) {
	    	  System.err.println("Internal Server error. This shouldn't happen");
	      }
	      stmt = conn.createStatement();
	      System.out.println("HERE");
	      String query = "Select uName, pName, sum(total) as sumTotal from (Select uName, pName, COALESCE(quantity*price,0) as total"
	      		+ " from (Select * from (select name as uName, id as uid from users) as t1"
	      		+ " cross join (select name as pName, id as pid from products) as t2) as t3"
	      		+ " full join sales on t3.uid = sales.uid and t3.pid = sales.pid order by uName, pName) as t4 group by uName, pName LIMIT 20 OFFSET 0;";

	      rs = stmt.executeQuery(query);
	      System.out.println("HEllo");
	      while(rs.next()){
	        userName = rs.getString(1);
	        productName = rs.getString(2);
	        totalSales = rs.getFloat(3);
	        users.add(new UsersWithSales(userName, productName, totalSales));
	      }
	      return users;
	    } catch (Exception e) {
	    	System.err.println("Some error happened!" + e.getMessage());
	    	return new ArrayList<UsersWithSales>();
	    } finally {
	    	try {
	    		stmt.close();
	    		conn.close();
	    	} catch (SQLException e) {
	    		System.err.println("HELP!!");
	    	}
	    }
  }
  
  public static List<UserTotals> userTotals(){
	    Connection conn = null;
	    Statement stmt = null;
	    ResultSet rs = null;
	    
	    String userName;
	    Float totalSales;
	    
	    List<UserTotals> userTotals = new ArrayList<UserTotals>();
	    try {
	      try {
	        conn = HelperUtils.connect(); 
	      } catch (Exception e) {
	    	  System.err.println("Internal Server error. This shouldn't happen");
	      }
	      stmt = conn.createStatement();
	      String query = "Select u.name, sum(s.quantity*s.price) as totalSale from sales s RIGHT OUTER JOIN users u on u.id = s.uid group by u.name order by u.name LIMIT 20 OFFSET 0";

	      rs = stmt.executeQuery(query);
	      while(rs.next()){

	        userName = rs.getString(1);
	        totalSales = rs.getFloat(2);
	        userTotals.add(new UserTotals(userName, totalSales));
	      }
	      return userTotals;
	    } catch (Exception e) {
	    	System.err.println("Some error happened!" + e.getMessage());
	    	return new ArrayList<UserTotals>();
	    } finally {
	    	try {
	    		//stmt.close();
	    		conn.close();
	    	} catch (SQLException e) {
	    		System.err.println("HELP!!");
	    	}
	    }
	  }
}
