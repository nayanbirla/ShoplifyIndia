/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import DBConnection.DBConnection;
import Log.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author nayan
 */
public class UserDao {
    static Connection con;
    String query;
    PreparedStatement ps;
    ResultSet rs;
    
    public User userlogin(String email,String pass)
    {
        User user=null;
        try{
            con=DBConnection.getConnection();
            query="select * from users where email=? and pass=?";
            ps=con.prepareStatement(query);
            ps.setString(1,email);
            ps.setString(2,pass);
            rs=ps.executeQuery();
            if(rs.next())
            {
                user=new User();
                user.setId(rs.getInt("id"));
                user.setName("uname");
                user.setEmail("email");  
                user.setTyp(rs.getInt("typ"));
            }
        }catch(Exception tt)
        {
            System.out.println(tt);
        }
        return user;
    }
    public boolean insert(String name,String email,String pass)
    {boolean b=false;
        try{
            con=DBConnection.getConnection();
            ps=con.prepareStatement("insert into users(uname,email,pass) values(?,?,?)");
            ps.setString(1,name);
            ps.setString(2,email);
            ps.setString(3,pass);
            ps.executeUpdate();
            b=true;
        }catch(Exception tt)
        {
            System.out.println(tt);
        }
        return b;
    }
     public boolean ainsert(User u)
    {boolean b=false;
        try{
            con=DBConnection.getConnection();
            ps=con.prepareStatement("insert into users(uname,email,pass,typ) values(?,?,?,?)");
            ps.setString(1,u.getName());
            ps.setString(2,u.getEmail());
            ps.setString(3,u.getPassword());
            ps.setInt(4,u.getTyp());
            ps.executeUpdate();
            b=true;
        }catch(Exception tt)
        {
            System.out.println(tt);
        }
        return b;
    }
}
