package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * To open your MySQL
 *
 * @author Khang Ta
 */
public class DBContext {

    protected Connection connection;

    public DBContext() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            //url, username, password of MySQL
            String url = "jdbc:mysql://localhost:3306/coffeeweb";
            String username = "root";
            String password = "";
            connection = DriverManager.getConnection(url, username, password);
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e);
        }

    }

}
