/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Lenovo
 */
public class Product {
    private int ID;
    private String Name;
    private int Quantity;
    private float Price;
    private int CategoryID;
    private String Brand;
    private String Description;
    private float OldPrice;
    private String Image;
    private String Color;
    private String Size;

    public Product() {
    }

    public Product(int ID, String Name, int Quantity, float Price, int CategoryID, String Brand, String Description, float OldPrice, String Image, String Color, String Size) {
        this.ID = ID;
        this.Name = Name;
        this.Quantity = Quantity;
        this.Price = Price;
        this.CategoryID = CategoryID;
        this.Brand = Brand;
        this.Description = Description;
        this.OldPrice = OldPrice;
        this.Image = Image;
        this.Color = Color;
        this.Size = Size;
    }

    
    public int getID() {
        return ID;
    }

    public String getName() {
        return Name;
    }

    public int getQuantity() {
        return Quantity;
    }

    public int getCategoryID() {
        return CategoryID;
    }

    public String getBrand() {
        return Brand;
    }

    public String getDescription() {
        return Description;
    }

    public float getOldPrice() {
        return OldPrice;
    }


    public String getImage() {
        return Image;
    }

    public String getColor() {
        return Color;
    }

    public String getSize() {
        return Size;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public void setQuantity(int Quantity) {
        this.Quantity = Quantity;
    }

    public void setCategoryID(int CategoryID) {
        this.CategoryID = CategoryID;
    }

    public void setBrand(String Brand) {
        this.Brand = Brand;
    }

    public void setPrice(float Price) {
        this.Price = Price;
    }

    public float getPrice() {
        return Price;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }

    public void setOldPrice(float OldPrice) {
        this.OldPrice = OldPrice;
    }


    public void setImage(String Image) {
        this.Image = Image;
    }

    public void setColor(String Color) {
        this.Color = Color;
    }

    public void setSize(String Size) {
        this.Size = Size;
    }

    @Override
    public String toString() {
        return "Product{" + "ID=" + ID + ", Name=" + Name + ", Quantity=" + Quantity + ", Price=" + Price + ", CategoryID=" + CategoryID + ", Brand=" + Brand + ", Description=" + Description + ", OldPrice=" + OldPrice + ", Image=" + Image + ", Color=" + Color + ", Size=" + Size + '}';
    }

    
    
    
}
