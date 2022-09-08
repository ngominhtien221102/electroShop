/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Utility;

import DAL.DAO;
import Model.*;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class Ultilities {

    DAO dao = new DAO();
    private ArrayList<Product> pList = dao.getProL();
    private ArrayList<User> uList = dao.getUsers();
    private ArrayList<Categories> cList = dao.getCateL();

    public Ultilities() {
    }

    public Product getProductById(int id) {
        for (Product p : pList) {
            if (p.getID() == id) {
                return p;
            }
        }
        return null;
    }
    
    public User getUser(String s) {
        for (User u : uList) {
            if (u.getUserName().equals(s)) {
                return u;
            }
        }
        return null;
    }

    public boolean checkCode(int ID, String OTP) {
        String code = dao.getCode(ID);
        if (code.trim().equals(OTP.trim())) {
            return true;
        }
        return false;

    }
    public static void main(String[] args) {
        Ultilities u = new Ultilities();
        System.out.println(u.checkCode(7, "8429"));
    }

    public ArrayList<Product> search(String s, int cateID) {
        ArrayList<Product> searchList = new ArrayList<>();
        ArrayList<Product> cateList = new ArrayList<>();

        if (cateID == 0) {
            cateList = pList;
        } else {
            cateList = ArrayCate(cateID);
        }
        for (Product p : cateList) {
            if (p.getName().toLowerCase().contains(s.toLowerCase()) || p.getDescription().toLowerCase().contains(s.toLowerCase())
                    || p.getBrand().equalsIgnoreCase(s)) {
                searchList.add(p);
            }
        }
        return searchList;

    }

    public ArrayList<Product> ArrayCate(int ID) {
        ArrayList<Product> proList = new ArrayList<>();
        for (Product p : pList) {
            if (p.getCategoryID() == ID) {
                proList.add(p);
            }
        }
        return proList;
    }

    public ArrayList<Product> FilterProductsByCate(int ID) {
        ArrayList<Product> productList = new ArrayList<>();
        for (Product p : pList) {
            if (p.getCategoryID() == ID) {
                productList.add(p);
            }
        }
        return productList;
    }

    public ArrayList<Product> FilterProductsByBrand(String brand) {
        ArrayList<Product> productList = new ArrayList<>();
        for (Product p : pList) {
            if (p.getBrand().equalsIgnoreCase(brand)) {
                productList.add(p);
            }
        }
        return productList;
    }

//    check exist email
    public boolean checkExistEmail(String email) {
        for (User u : uList) {
            if (u.getEmail().equals(email)) {
                return true;
            }
        }
        return false;
    }

    // check exist username
    public boolean checkExistUsername(String s) {
        for (User u : uList) {
            if (u.getUserName().equals(s)) {
                return true;
            }
        }
        return false;
    }

    //check repeat pass matching
    public boolean checkRepeatPass(String p, String cp) {
        return cp.equals(p);
    }

    // validate fullname of user
    public boolean validName(String f) {
        if (f.length() < 2 || f.length() > 32) {
            return false;
        }
        return true;
    }

    //validate email
    public boolean validEmail(String email) {
        String regex = "\\w+@\\w+[.]\\w+";
        if (!email.matches(regex)) {
            return false;
        }
        return true;
    }

    // validate username
    public boolean validUsername(String u) {
        String regex = "[a-zA-Z0-9 ]+";
        if (u.length() < 4 || u.length() > 12 || !u.matches(regex)) {
            return false;
        }
        return true;
    }

    // validate pass
    public boolean validPass(String p) {
        if (p.length() < 4 || p.length() > 12) {
            return false;
        }
        return true;
    }

    //check user and password
    public User checkExistAccount(String user, String pass) {
        for (User u : uList) {
            if (u.getUserName().equals(user) && u.getPassword().equals(pass)) {
                return u;
            }
        }
        return null;
    }

    //Check Phone valid
    public boolean validPhone(String p) {
        String regex = "[0-9]+";
        if ((p.length() == 10 || p.length() == 9) && p.matches(regex)) {
            return true;
        }
        return false;
    }

    public User getUserByID(int ID) {
        for (User u : uList) {
            if (u.getID() == ID) {
                return u;
            }
        }
        return null;
    }

}
