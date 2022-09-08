/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import java.util.*;
import Model.*;
import Utility.Ultilities;
import java.sql.*;
import java.time.LocalDate;

/**
 *
 * @author Lenovo
 */
public class DAO {

    private ArrayList<Product> proList;
    private ArrayList<Categories> cateList;
    private ArrayList<User> userList;
    private String status;
    private Connection con;

    public String getStatus() {
        return status;
    }

    public ArrayList<User> getUserList() {
        return userList;
    }

    public void setUserList(ArrayList<User> userList) {
        this.userList = userList;
    }

    public Connection getCon() {
        return con;
    }

    public ArrayList<Product> getProList() {
        return proList;
    }

    public ArrayList<Categories> getCateList() {
        return cateList;
    }

    public ArrayList<Categories> getCateL() {
        ArrayList<Categories> cList = new ArrayList<>();
        String sql = "Select * from Categories_HE161579";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                cList.add(new Categories(rs.getInt(1), rs.getString(2)));
            }
        } catch (SQLException e) {
            status = "Error at read Categories_HE161579" + e.getMessage();
        }
        return cList;
    }

    public ArrayList<Product> getProL() {
        ArrayList<Product> pList = new ArrayList<>();
        String sql = "Select * from Product_HE161579";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {

                pList.add(new Product(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getFloat(4), rs.getInt(5), rs.getString(6), rs.getString(7), rs.getFloat(8), rs.getString(9), rs.getString(10), rs.getString(11)));
            }
        } catch (SQLException e) {
            status = "Error at read Product_HE161579" + e.getMessage();
        }
        return pList;
    }
    
    public ArrayList<Product> getTopselling() {
        Ultilities u = new Ultilities();
        ArrayList<Product> pList = new ArrayList<>();
        String sql = "Select top(5)ProductID from OrderDetail_HE161579 order by Quantity desc";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {

                pList.add(u.getProductById(rs.getInt(1)));
            }
        } catch (SQLException e) {
            status = "Error at read Product_HE161579" + e.getMessage();
        }
        return pList;
    }

    public ArrayList<User> getUsers() {
        ArrayList<User> uList = new ArrayList<>();
        String sql = "Select * from User_HE161579";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                uList.add(new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getInt(9), rs.getBoolean(8)));

            }
        } catch (SQLException e) {
            status = "Error at read User_HE161579" + e.getMessage();
        }
        return uList;
    }

    

    //Tra ve list các laptop moi nhat
    public ArrayList<Product> getNewLapTop() {
        ArrayList<Product> pList = new ArrayList<>();
        String sql = "select top(6) * from Product_HE161579 where CategoryID = 1 order by ID desc";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {

                pList.add(new Product(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getFloat(4), rs.getInt(5), rs.getString(6), rs.getString(7), rs.getFloat(8), rs.getString(9), rs.getString(10), rs.getString(11)));
            }
        } catch (SQLException e) {
            status = "Error at read Product_HE161579" + e.getMessage();
        }
        return pList;
    }

    //Tra ve list các laptop moi nhat
    public ArrayList<Product> getNewPhone() {
        ArrayList<Product> pList = new ArrayList<>();
        String sql = "select top(6) * from Product_HE161579 where CategoryID = 2 order by ID desc";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {

                pList.add(new Product(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getFloat(4), rs.getInt(5), rs.getString(6), rs.getString(7), rs.getFloat(8), rs.getString(9), rs.getString(10), rs.getString(11)));
            }
        } catch (SQLException e) {
            status = "Error at read Product_HE161579" + e.getMessage();
        }
        return pList;
    }

    public ArrayList<Product> getNewAccess() {
        ArrayList<Product> pList = new ArrayList<>();
        String sql = "select top(6) * from Product_HE161579 where CategoryID = 3 order by ID desc";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {

                pList.add(new Product(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getFloat(4), rs.getInt(5), rs.getString(6), rs.getString(7), rs.getFloat(8), rs.getString(9), rs.getString(10), rs.getString(11)));
            }
        } catch (SQLException e) {
            status = "Error at read Product_HE161579" + e.getMessage();
        }
        return pList;
    }

    public ArrayList<Product> getProRelated(int CateID) {
        ArrayList<Product> pList = new ArrayList<>();
        String sql = "select top(4) * from Product_HE161579 where CategoryID = " + CateID + " order by newid()";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {

                pList.add(new Product(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getFloat(4), rs.getInt(5), rs.getString(6), rs.getString(7), rs.getFloat(8), rs.getString(9), rs.getString(10), rs.getString(11)));
            }
        } catch (SQLException e) {
            status = "Error at read Product_HE161579" + e.getMessage();
        }
        return pList;
    }

    public ArrayList<String> getBrand() {
        ArrayList<String> bList = new ArrayList<>();
        String sql = "Select distinct brand  from Product_HE161579";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {

                bList.add(rs.getString(1));
            }
        } catch (SQLException e) {
            status = "Error at read brand" + e.getMessage();
        }
        return bList;
    }

    public int getIdMax() {
        String sql = "Select top(1)[ID] from User_HE161579 order by ID desc";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }

        } catch (Exception e) {
            status = "Error at get index max" + e.getMessage();
        }
        return 0;
    }

    public ArrayList<Role> getRoleList() {
        ArrayList<Role> rList = new ArrayList<>();
        String sql = "Select *   from Role_HE161579";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {

                rList.add(new Role(rs.getInt(1), rs.getString(2), rs.getString(3)));
            }
        } catch (SQLException e) {
            status = "Error at read brand" + e.getMessage();
        }
        return rList;
    }

    public DAO() {
        try {
            con = new DBContext().getConnection();
        } catch (Exception e) {
            status = "Error connection" + e.getMessage();
        }
    }

    public void delUser(int id) {
        String sql = "delete from User_HE161579 where id=?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.execute();
        } catch (Exception e) {
            status = "Error at delete User_HE161579" + e.getMessage();
        }
    }

    public void UpdateUser(int ID, String UserName,
            String PassWord, String Name, String Adddresss,
            String Email, String Phone, boolean Status, int RoleID) {
        String sql = "Update User_HE161579 set UserName=?, Password=?, [Name]=?,  "
                + "[Address]=? , Email =?, Phone=?,Status=?, RoleID=? where ID =?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(9, ID);
            ps.setString(1, UserName);
            ps.setString(2, PassWord);
            ps.setString(3, Name);
            ps.setString(4, Adddresss);
            ps.setString(5, Email);
            ps.setString(6, Phone);
            ps.setBoolean(7, Status);
            ps.setInt(8, RoleID);
            ps.execute();
        } catch (Exception e) {
            status = "Error at Update User" + e.getMessage();
        }
    }

    public void updateCode(int ID, String code) {
        String sql = "Update User_HE161579 set [Code]=? where ID =?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(2, ID);
            ps.setString(1, code);
            ps.execute();
        } catch (Exception e) {
            status = "Error at Update Code" + e.getMessage();
        }
    }

    public String getCode(int ID) {
        String sql = "Select Code from User_HE161579 where ID = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, ID);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return rs.getString(1);
            }

        } catch (Exception e) {
            status = "Error at get Code" + e.getMessage();
        }
        return null;
    }

    public void UpdateProfile(int ID,
            String Name, String Addresss,
            String Email, String Phone) {
        String sql = "Update User_HE161579 set [Name]=?,  "
                + "[Address]=? , Email =?, Phone=? where ID =?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, Name);
            ps.setString(2, Addresss);
            ps.setString(3, Email);
            ps.setString(4, Phone);
            ps.setInt(5, ID);
            ps.execute();
        } catch (Exception e) {
            status = "Error at Update Profile" + e.getMessage();
        }
    }

    public void delProduct(int id) {
        String sql = "delete from Product_HE161579 where id=?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.execute();
        } catch (Exception e) {
            status = "Error at delete Product_HE161579" + e.getMessage();
        }
    }

    public void InsertUser(String UserName, String Password, String Name,
            String Address, String Email, String Phone) {
        int ID = getIdMax() + 1;
        boolean Status = false;
        int RoleID = 4;

        String sql = "Insert into User_HE161579 ([ID],[UserName],[Password],[Name],[Address],"
                + "[Email],[Phone],[Status],[RoleID]) values (?,?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, ID);
            ps.setString(2, UserName);
            ps.setString(3, Password);
            ps.setString(4, Name);
            ps.setString(5, Address);
            ps.setString(6, Email);
            ps.setString(7, Phone);
            ps.setBoolean(8, Status);
            ps.setInt(9, RoleID);
            ps.execute();
        } catch (Exception e) {
            status = "Error at insert User " + e.getMessage();
        }
    }

    public void InsertProduct(String name, int Quantity, float Price, int CategoryID, String Brand, String Description,
            float OldPrice, String image, String Color, String size) {
        String sql = "Insert into Product_HE161579 values(?,?,?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, name);
            ps.setInt(2, Quantity);
            ps.setFloat(3, Price);
            ps.setInt(4, CategoryID);
            ps.setString(5, Brand);
            ps.setString(6, Description);
            ps.setFloat(7, OldPrice);
            ps.setString(8, image);
            ps.setString(9, Color);
            ps.setString(10, size);
            ps.execute();
        } catch (Exception e) {
            status = "Error at insert Product " + e.getMessage();
        }
    }

    public void UpdateProduct(int ID, String name, int Quantity, float Price, int CategoryID, String Brand, String Description,
            float OldPrice, String image, String Color, String size) {
        String sql = "Update Product_HE161579 set [Name]=?, Quantity=?, Price=?, CategoryID=?, Brand=?, Description=?,"
                + "OldPrice=?,[Image]=?,color=?,size=?  where ID =?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, name);
            ps.setInt(2, Quantity);
            ps.setFloat(3, Price);
            ps.setInt(4, CategoryID);
            ps.setString(5, Brand);
            ps.setString(6, Description);
            ps.setFloat(7, OldPrice);
            ps.setString(8, image);
            ps.setString(9, Color);
            ps.setString(10, size);
            ps.setInt(11, ID);
            ps.execute();
        } catch (Exception e) {
            status = "Error at update Product " + e.getMessage();
        }
    }

    public void addOrder(User u, Cart cart, String note) {
        LocalDate curDate = LocalDate.now();
        String date = curDate.toString();
        try {
            String sql = "Insert into Transaction_HE161579 ([Total],[Note],[Address],[Phone],[UserID],[Time]) values(?,?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setFloat(1, cart.getTotalMoney());
            ps.setString(2, note);
            ps.setString(3, u.getAddress());
            ps.setString(4, u.getPhone());
            ps.setInt(5, u.getID());
            ps.setString(6, date);
            ps.executeUpdate();

            //lay id cua order vua insert
            String sql1 = "Select Top 1 ID from Transaction_HE161579 order by ID desc";
            PreparedStatement ps1 = con.prepareStatement(sql1);
            ResultSet rs = ps1.executeQuery();
            //add vao bang orderdetail

            if (rs.next()) {
                String sql2 = "Insert into [OrderDetail_HE161579] ([ID],[TransactionID],[ProductID],[ProductName],[Quantity],[Total])   values(?,?,?,?,?,?)";
                PreparedStatement ps2 = con.prepareStatement(sql2);
                int orderId = rs.getInt("ID");
                for (Items i : cart.getItems()) {
                    ps2.setInt(1, getIdProMax() + 1);
                    ps2.setInt(2, orderId);
                    ps2.setInt(3, i.getProduct().getID());
                    ps2.setString(4, i.getProduct().getName());
                    ps2.setInt(5, i.getQuantity());
                    ps2.setFloat(6, i.getTotal());
                    ps2.executeUpdate();
                }
            }
            //cap nhat lai so luong
            String sql3 = "Update Product_HE161579 set Quantity = Quantity-? where ID = ?";
            PreparedStatement ps3 = con.prepareStatement(sql3);
            for (Items i : cart.getItems()) {
                ps3.setInt(1, i.getQuantity());
                ps3.setInt(2, i.getProduct().getID());
                ps3.executeUpdate();
            }

        } catch (Exception e) {
            status = "Error at insert Transaction " + e.getMessage();
        }
    }
    
    public User getUs(String UserName) {
        User u;
        String sql = "Select * from User_HE161579 where UserName=? ";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, UserName);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                u = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getInt(9), rs.getBoolean(8));
                return u;
            }
        } catch (SQLException e) {
            status = "Error at find User" + e.getMessage();
        }
        return null;
    }

    public int getIdProMax() {
        String sql = "Select top(1)[ID] from OrderDetail_HE161579 order by ID desc";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }

        } catch (Exception e) {
            status = "Error at get index max" + e.getMessage();
        }
        return 0;
    }
    
    
    public ArrayList<Transaction> getTransaction() {
        ArrayList<Transaction> listTran = new ArrayList<>();
        String sql = "Select * from Transaction_HE161579";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                listTran.add(new Transaction(rs.getInt(1), rs.getFloat(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getDate(7).toLocalDate()));
                
            }
        } catch (SQLException e) {
            status = "Error at read Transaction_HE161579" + e.getMessage();
        }
        return listTran;
    }
    
    public ArrayList<OrderDetail> getOrderDetails() {
        ArrayList<OrderDetail> listOrder = new ArrayList<>();
        String sql = "Select * from OrderDetail_HE161579";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                listOrder.add(new OrderDetail(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getString(4), rs.getInt(5), rs.getFloat(6)));
                
            }
        } catch (SQLException e) {
            status = "Error at read Transaction_HE161579" + e.getMessage();
        }
        return listOrder;
    }

    public static void main(String[] args) {
        DAO dao = new DAO();

        System.out.println(dao.getCode(7));
        System.out.println(dao.getUs("ngoanh2211").toString());
        for (Transaction transaction : dao.getTransaction()) {
            System.out.println(transaction.toString());
        }
        
        for (Product product : dao.getTopselling()) {
            System.out.println(product);
        }

    }

}
