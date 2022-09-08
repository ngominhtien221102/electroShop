/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.time.LocalDate;


/**
 *
 * @author Lenovo
 */
public class Transaction {
    private int ID;
    private float Total;
    private String Note;
    private String Address;
    private String Phone;
    private int UserID;
    private LocalDate Time;

    public Transaction(int ID, float Total, String Note, String Address, String Phone, int UserID, LocalDate Time) {
        this.ID = ID;
        this.Total = Total;
        this.Note = Note;
        this.Address = Address;
        this.Phone = Phone;
        this.UserID = UserID;
        this.Time = Time;
    }

    public Transaction() {
    }

    public int getID() {
        return ID;
    }

    public float getTotal() {
        return Total;
    }

    public String getNote() {
        return Note;
    }

    public String getAddress() {
        return Address;
    }

    public String getPhone() {
        return Phone;
    }

    public int getUserID() {
        return UserID;
    }

    public LocalDate getTime() {
        return Time;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public void setTotal(float Total) {
        this.Total = Total;
    }

    public void setNote(String Note) {
        this.Note = Note;
    }

    public void setAddress(String Address) {
        this.Address = Address;
    }

    public void setPhone(String Phone) {
        this.Phone = Phone;
    }

    public void setUserID(int UserID) {
        this.UserID = UserID;
    }

    public void setTime(LocalDate Time) {
        this.Time = Time;
    }

    @Override
    public String toString() {
        return "Transaction{" + "ID=" + ID + ", Total=" + Total + ", Note=" + Note + ", Address=" + Address + ", Phone=" + Phone + ", UserID=" + UserID + ", Time=" + Time + '}';
    }
    
    
    
}
