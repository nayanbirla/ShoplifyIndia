/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DBConnection;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author nayan
 */
public class DBConnection implements DBProperties {
     static Connection con1;
    public static Connection getConnection()
    {
        try{
            Class.forName(driver);
            con1=DriverManager.getConnection(conn,unm,ps);
            System.out.println("connected");
        }catch(Exception tt)
        {
            System.out.println(tt);
        }
        return con1;
    }
}
