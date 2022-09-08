/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Lenovo
 */
public class Items {

    private Product product;
    private int quantity;
    private float price;

    public Items() {
    }

    public Items(Product product, int quantity, float price) {
        this.product = product;
        this.quantity = quantity;
        this.price = price;
    }

    public Product getProduct() {
        return product;
    }

    public int getQuantity() {
        return quantity;
    }

    public float getPrice() {
        return price;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    
    
    
    public float getTotal()
    {
        return product.getPrice()*quantity;
    }

    @Override
    public String toString() {
        return "Items{" + "product=" + product + ", quantity=" + quantity + ", price=" + price + '}';
    }
    
    
}
