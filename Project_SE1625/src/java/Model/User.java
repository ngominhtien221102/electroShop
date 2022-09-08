/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Lenovo
 */
public class User {
    private int ID;
    private String userName;
    private String password;
    private String Name;
    private String address;
    private String email;
    private String phone;
    private int roleId ;
    private boolean Status;
    private String Code;

    public User(int ID, String userName, String password, String Name, String address, String email, String phone, int roleId, boolean Status) {
        this.ID = ID;
        this.userName = userName;
        this.password = password;
        this.Name = Name;
        this.address = address;
        this.email = email;
        this.phone = phone;
        this.roleId = roleId;
        this.Status = Status;
    }

    public User() {
    }

    public String getCode() {
        return Code;
    }

    public void setCode(String Code) {
        this.Code = Code;
    }
    
    

    public int getID() {
        return ID;
    }

    public String getUserName() {
        return userName;
    }

    public String getPassword() {
        return password;
    }

    public String getName() {
        return Name;
    }

    public String getAddress() {
        return address;
    }

    public String getEmail() {
        return email;
    }

    public String getPhone() {
        return phone;
    }

    public int getRoleId() {
        return roleId;
    }

    public boolean isStatus() {
        return Status;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    public void setStatus(boolean Status) {
        this.Status = Status;
    }

    @Override
    public String toString() {
        return "User{" + "ID=" + ID + ", userName=" + userName + ", password=" + password + ", Name=" + Name + ", address=" + address + ", email=" + email + ", phone=" + phone + ", roleId=" + roleId + ", Status=" + Status + '}';
    }

    
    
    

    
    
    
    
    
    
    
}
