package helpers;

public class UsersWithSales {
  private String name;
  private String productName;
  private float totalSales;
  
  public UsersWithSales(String name, String productName, float sales){
    this.name = name;
    this.productName = productName;
    this.totalSales = sales;
  }
  
  public String getName(){
    return this.name;
  }
  
  public String getProductName(){
    return this.productName;
  }
  
  public float getSales(){
    return this.totalSales;
  }
  
  public void setSales(float totalSales){
	this.totalSales = 0;
  }
}
