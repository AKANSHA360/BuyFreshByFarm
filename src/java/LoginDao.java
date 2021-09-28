/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Shree
 */
import java.sql.*;
public class LoginDao {
    public static boolean validate(String UserName,String Password)
    {
        boolean status=false;
        try{
           Class.forName("com.mysql.jdbc.Driver");  
            Connection con=DriverManager.getConnection(  
            "jdbc:mysql://localhost:3306/reguser","root","");  
            //here sonoo is database name, root is username and password  
            Statement stmt=con.createStatement();  
            PreparedStatement ps=con.prepareStatement("select * from register where UserName=? and Password=?");
            ps.setString(1,UserName);
            ps.setString(2,Password);
            ResultSet rs=ps.executeQuery();  
            status=rs.next();  
            }catch(Exception e){ System.out.println(e);}
        return status;
        }
    }
