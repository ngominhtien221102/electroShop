/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import DAL.DAO;
import java.util.ArrayList;

/**
 *
 * @author Lenovo
 */
public class Cart {

    private ArrayList<Items> items;

    public Cart() {
        items = new ArrayList<>();
    }

    public Cart(String txt) {
        DAO dao = new DAO();
        ArrayList<Product> pList = dao.getProL();
        items = new ArrayList<>();
        try {
            if(txt != null && txt.length() != 0){
            String[] s = txt.split("/");
            for(String i: s)
            {
                String[] n = i.split(":");
                int ID = Integer.parseInt(n[0]);
                int quantity = Integer.parseInt(n[1]);
                Product p = getProductByID(ID, pList);
                Items t = new Items(p, quantity, p.getPrice());
                addItem(t);
                
            }
        }
        } catch (NumberFormatException e) {
        }
        
        
    }
    
    private Product getProductByID(int ID, ArrayList<Product> pList)
    {
        for (Product product : pList) {
            if(product.getID() == ID)
                return product;
        }
        return null;
    }

    public ArrayList<Items> getItems() {
        return items;
    }

    public void setItems(ArrayList<Items> items) {
        this.items = items;
    }

    public int getQuantityByID(int id) {
        return getItemByID(id).getQuantity();
    }

    private Items getItemByID(int id) {
        for (Items i : items) {
            if (i.getProduct().getID() == id) {
                return i;
            }
        }
        return null;
    }

    public void addItem(Items t) {
        // Neu san pham co san thi cong 1 vao danh sach
        if (getItemByID(t.getProduct().getID()) != null) {
            Items m = getItemByID(t.getProduct().getID());
            m.setQuantity(m.getQuantity() + t.getQuantity());
        } // neu san pham chua co thi add vao list
        else {
            items.add(t);
        }
    }

    public void removeItem(int id) {
        if (getItemByID(id) != null) {
            items.remove(getItemByID(id));
        }
    }
    
    public void reduceItem(int id, int quantity)
    {
        for (Items item : items) {
            if(item.getProduct().getID() == id && item.getQuantity() > 0)
            {
                item.setQuantity(item.getQuantity()-quantity);
            }  
        }
        if(getItemByID(id) != null)
        {
            if(getItemByID(id).getQuantity() == 0)
            {
                removeItem(id);
            }
        }
        
    }

    // tong so tien
    public float getTotalMoney() {
        float t = 0;
        for (Items i : items) {
            t += (i.getQuantity() * i.getProduct().getPrice());
        }
        return t;
    }
    
public String toCookie() {
        String s = "";
        for (Items i : items){
            s= s+ i.getProduct().getID() +":"+i.getQuantity()+"/";
        }
        if(!s.isEmpty())
        {
            s = s.substring(0, s.length()-1);
        }
        
        return s;
    }

}
