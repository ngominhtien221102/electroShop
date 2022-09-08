/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Lenovo
 */
public class Role {
    private int ID;
    private String name;
    private String Description;

    public Role() {
    }

    public Role(int ID, String name) {
        this.ID = ID;
        this.name = name;
    }
    
    

    public Role(int ID, String name, String Description) {
        this.ID = ID;
        this.name = name;
        this.Description = Description;
    }

    public int getID() {
        return ID;
    }

    public String getName() {
        return name;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "Role{" + "ID=" + ID + ", name=" + name + ", Description=" + Description + '}';
    }
    
    
}
