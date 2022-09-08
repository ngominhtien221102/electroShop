/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Lenovo
 */
public class OrderDetail {
    private int ID;
    private int TrasactionID;
    private int ProductID;
    private String ProductName;
    private int Quantity;
    private float Total;

    public OrderDetail() {
    }

    public OrderDetail(int ID, int TrasactionID, int ProductID, String ProductName, int Quantity, float Total) {
        this.ID = ID;
        this.TrasactionID = TrasactionID;
        this.ProductID = ProductID;
        this.ProductName = ProductName;
        this.Quantity = Quantity;
        this.Total = Total;
    }

    public int getID() {
        return ID;
    }

    public int getTrasactionID() {
        return TrasactionID;
    }

    public int getProductID() {
        return ProductID;
    }

    public String getProductName() {
        return ProductName;
    }

    public int getQuantity() {
        return Quantity;
    }

    public float getTotal() {
        return Total;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public void setTrasactionID(int TrasactionID) {
        this.TrasactionID = TrasactionID;
    }

    public void setProductID(int ProductID) {
        this.ProductID = ProductID;
    }

    public void setProductName(String ProductName) {
        this.ProductName = ProductName;
    }

    public void setQuantity(int Quantity) {
        this.Quantity = Quantity;
    }

    public void setTotal(float Total) {
        this.Total = Total;
    }

    @Override
    public String toString() {
        return "OrderDetail{" + "ID=" + ID + ", TrasactionID=" + TrasactionID + ", ProductID=" + ProductID + ", ProductName=" + ProductName + ", Quantity=" + Quantity + ", Total=" + Total + '}';
    }
    
    
}
