/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import DBConnection.DBConnection;
import Log.Cart;
import Log.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;
/**
 *
 * @author nayan
 */
public class ProductDao {
     private Connection con;
    String query;
    PreparedStatement ps;
    ResultSet rs;
    public ProductDao(Connection con)
    {
        this.con=con;
    }
    public  List<Product> getAllProduct(){
        List<Product> products =new ArrayList<Product>();
        try{
            query="select * from product";
            ps=this.con.prepareStatement(query);
            rs=ps.executeQuery();
            while(rs.next())
            {
                Product row=new Product();
                row.setId(rs.getInt("pid"));
                row.setName(rs.getString("pname"));
                row.setCategory(rs.getString("category"));
                row.setPrice(rs.getFloat("price"));
                row.setImage(rs.getString("image"));
                products.add(row);
               
            }
        }catch(Exception tt)
        {
            System.out.println(tt);
        } return products;
    }
    
    public Product getSingleProduct(int id)
    {Product row=null;
    try{
        query="select * from product where pid=?";
        con=DBConnection.getConnection();
        ps=con.prepareStatement(query);
        ps.setInt(1,id);
        rs=ps.executeQuery();
        while(rs.next())
        {
            row=new Product();
            row.setId(rs.getInt("pid"));
            row.setName(rs.getString("pname"));
            row.setCategory(rs.getString("category"));
            row.setPrice(rs.getFloat("price"));
            row.setImage(rs.getString("image"));
        }
    }catch(Exception tt)
    {
        System.out.println(tt);
    }
        return row;
    }
    public List<Cart> getCartProduct(ArrayList<Cart> cartList){
        List<Cart> products=new ArrayList<Cart>();
        try{
            if(cartList.size()>0)
            {
                for(Cart item:cartList)
                {
                    query="select * from product where pid=?";
                    ps=con.prepareStatement(query);
                    ps.setInt(1,item.getId());
                    rs=ps.executeQuery();
                    while(rs.next())
                    {
                        Cart row=new Cart();
                        row.setId(rs.getInt("pid"));
                        row.setName(rs.getString("pname"));
                        row.setCategory(rs.getString("category"));
                        row.setPrice(rs.getFloat("price")*item.getQuantity());
                        row.setQuantity(item.getQuantity());
                        products.add(row);
                        
                        
                    }
                }
            }
        }catch(Exception tt)
        {
            System.out.println(tt);
        }
        return products;
    }
    
    public float getTotalCartPrice(ArrayList<Cart> cartList){
        float sum=0;
        
        try{
            if(cartList.size()>0)
            {
                for(Cart item:cartList)
                {
            query="select price from product where pid=?";
            ps=con.prepareStatement(query);
            ps.setInt(1,item.getId());
            rs=ps.executeQuery();
            while(rs.next())
            {
                sum+=((float)rs.getFloat("price"))*(item.getQuantity());
            }
                }
            }
            
        }catch(Exception tt)
        {
            
        }
        return sum;
    }
    public boolean insertpro(Product pd)
    {
        boolean b=false;
        try{
            ps=con.prepareStatement("insert into product(pname,category,price,image) values(?,?,?,?)");
            ps.setString(1,pd.getName());
            ps.setString(2,pd.getCategory());
            ps.setFloat(3,pd.getPrice());
            ps.setString(4,pd.getImage());
            ps.executeUpdate();
            b=true;
            
        }catch(Exception tt)
        {
            System.out.println(tt);
        }
        return b;
    }
    public int delete(int id)
    {
        try{
            ps=con.prepareStatement("delete from product where pid=?");
            ps.setInt(1,id);
            int i=ps.executeUpdate();
            return i;
            
           
        }catch(Exception tt)
        {
            
        }
        return -1;
    }
}
