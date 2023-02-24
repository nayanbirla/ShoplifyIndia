/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import DBConnection.DBConnection;
import Log.Order;
import Log.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author nayan
 */
public class OrderDao {
    static Connection con;
    String query;
    PreparedStatement ps;
    ResultSet rs;
   
    
    public boolean insertOrder(Order model)
    {
        boolean result=false;
        try{
            con=DBConnection.getConnection();
            query="insert into orders(pid,uid,qty,odate) values(?,?,?,CURRENT_DATE)";
            ps=con.prepareStatement(query);
            ps.setInt(1,model.getId());
            ps.setInt(2,model.getUid());
            ps.setInt(3,model.getQty());
          //  ps.setString(4,model.getDate());
            ps.executeUpdate();
            result=true;
        }catch(Exception tt)
        {
            System.out.println(tt);
        }
        
        return result;
    }
    
    public List<Order> userOrders(int id){
        List<Order> list=new ArrayList<>();
        
        try{
            con=DBConnection.getConnection();
            
            query="select * from orders where uid=? order by oid desc ";
            ps=con.prepareStatement(query);
            ps.setInt(1,id);
            rs=ps.executeQuery();
            while(rs.next()){
                Order order=new Order();
                ProductDao pd=new ProductDao(con);
                int pid=rs.getInt("pid");
                Product product= pd.getSingleProduct(pid);
                order.setOrderid(rs.getInt("oid"));
                order.setId(pid);
                order.setName(product.getName());
                order.setCategory(product.getCategory());
                order.setPrice(product.getPrice()*rs.getInt("qty"));
                order.setQty(rs.getInt("qty"));
                order.setDate(rs.getString("odate"));
                list.add(order);
    
            }
            
        }catch(Exception tt){
            System.out.println(tt);
        }
        return list;
    }
    public void Cancelorder(int id)
    {
        try{
        con=DBConnection.getConnection();
        query="delete from orders where oid=?";
        ps=con.prepareStatement(query);
        ps.setInt(1,id);
        ps.execute();
        }catch(Exception tt)
        {
            System.out.println(tt);
        }
    }
        
}
