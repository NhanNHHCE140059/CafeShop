/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package db;

import model.Feedback;
import model.Product;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.util.ArrayList;
import java.util.Hashtable;
import model.Order;
import model.OrderStatus;

/**
 *
 * @author Khang Ta
 */
public class CategoryDAO extends DBContext {

    public boolean isUserExisted(String username, String password) {
        String sql = "select * from users where username = ? and password= md5(?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            return rs.next();
        } catch (Exception e) {
            return false;
        }
    }

    public boolean isCustomerExisted(String username, String password) {
        String sql = "select * from customers where phone = ? and password = md5(?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            return rs.next();

        } catch (Exception e) {
            return false;
        }
    }

    public boolean isCustomerExisted(String username) {
        String sql = "select * from customers where phone = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            return rs.next();
        } catch (Exception e) {
            return false;
        }
    }

    public void addCustomer(String phone, String password, String dob, String sex, String name) {
        String sql = "INSERT INTO `customers`VALUES (?,?,md5(?),?,?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, phone);
            ps.setString(2, name);
            ps.setString(3, password);
            ps.setString(4, dob);
            ps.setString(5, sex);
            ps.executeUpdate();

        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void addCustomer(String phone, String dob, String gender, String name) {
        String sql = "UPDATE `customers` SET `Username`=?,`Dob`=?,`Gender`=? WHERE Phone=?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(4, phone);
            ps.setString(1, name);
            ps.setString(2, dob);
            ps.setString(3, gender);
            ps.executeUpdate();

        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public String getUsername(String username) {
        String sql = "select * from users where username = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            rs.next();
            return rs.getString(2);
        } catch (Exception e) {
            return null;
        }
    }

    public String getCustomername(String phone) {
        String sql = "select * from customers where phone = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, phone);
            ResultSet rs = ps.executeQuery();
            rs.next();
            return rs.getString(2);
        } catch (Exception e) {
            return null;
        }
    }

    public ArrayList<Product> getAllProducts() {
        ArrayList<Product> product = new ArrayList<>();
        String sql = " select * from products order by category desc";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                double price = rs.getDouble(3);
                double sellPercent = rs.getDouble(4);
                String category = rs.getString(5);
                String description = rs.getString(6);
                product.add(new Product(id, name, price, sellPercent, category, description));
            }
            return product;
        } catch (Exception e) {
            return null;
        }
    }

    public void deleteFood(String id) {
        String sql = "delete from products where id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(id));
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void addFood(String name, double price, double sale, String category, String description) {
        String sql = "INSERT INTO `products`( `name`, `price`, `SalePercent`, `Category`, `Description`) VALUES (?,?,?,?,?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ps.setDouble(2, price);
            ps.setDouble(3, sale);
            ps.setString(4, category);
            ps.setString(5, description);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void updateFood(int id, String name, double price, double sale, String category, String description) {
        String sql = "UPDATE `products` SET `name`=?,`price`=?,`SalePercent`=?,`Category`=?,`Description`=? WHERE `id`=?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ps.setDouble(2, price);
            ps.setDouble(3, sale);
            ps.setString(4, category);
            ps.setString(5, description);
            ps.setInt(6, id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public ArrayList<Feedback> getAllFeedbacks() {
        ArrayList<Feedback> feedback = new ArrayList<>();
        String sql = "SELECT id,c.Username,content,type,date FROM feedback f join customers c on f.Customerid= c.Phone";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String customerName = rs.getString(2);
                String content = rs.getString(3);
                String type = rs.getString(4);
                Date date = rs.getDate(5);
                feedback.add(new Feedback(id, customerName, content, type, date));
            }
            return feedback;
        } catch (Exception e) {
            return null;
        }
    }

    public ArrayList<Product> getProducts(String keyword) {
        ArrayList<Product> product = new ArrayList<>();
        String sql = "SELECT * FROM `products` WHERE name like ? order by category desc";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + keyword + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                double price = rs.getDouble(3);
                double sellPercent = rs.getDouble(4);
                String category = rs.getString(5);
                String description = rs.getString(6);
                product.add(new Product(id, name, price, sellPercent, category, description));
            }
            return product;
        } catch (Exception e) {
            return null;
        }
    }

    public Product getProducts(int i) {
        Product p = new Product();
        String sql = "SELECT * FROM `products` WHERE id= ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, i);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                double price = rs.getDouble(3);
                double salePercent = rs.getDouble(4);
                String category = rs.getString(5);
                String description = rs.getString(6);
                p = new Product(id, name, price, salePercent, category, description);
            }
            return p;
        } catch (Exception e) {
            return null;
        }
    }

    public void addCustomerOrder(int id) {
        if (isCustomerOrder(id)) {
            String sql = "update customerOrder set quantity = quantity+1 where id=?";
            try {
                PreparedStatement ps = connection.prepareStatement(sql);
                ps.setInt(1, id);
                ps.executeUpdate();
            } catch (Exception e) {
            }
        } else {
            String sql = "INSERT INTO `customerorder`(`id`, `quantity`) VALUES (?,?)";
            try {
                PreparedStatement ps = connection.prepareStatement(sql);
                ps.setInt(1, id);
                ps.setInt(2, 1);
                ps.executeUpdate();
            } catch (Exception e) {
            }
        }
    }

    private boolean isCustomerOrder(int id) {
        String sql = "select * from customerOrder where id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            return rs.next();
        } catch (Exception e) {
            return false;
        }
    }

    public Hashtable<Integer, Integer> getAllCustomerOrder() {
        Hashtable<Integer, Integer> a = new Hashtable<>();
        String sql = "SELECT * from customerOrder";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                int quantity = rs.getInt(2);
                a.put(id, quantity);
            }
            return a;
        } catch (Exception e) {
            return null;
        }
    }

    public void setOrder(String phone, String dateHour, double total, String date, String hour, String address) {
        String sql = " INSERT INTO `orders`( `customerid`, `orderstatusid`, `total`, `orderdate`, `ordertime`, `address`) VALUES (?,?,?,?,?,?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, phone);
            ps.setString(2, dateHour);
            ps.setDouble(3, total);
            ps.setString(4, date);
            ps.setString(5, hour);
            ps.setString(6, address);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void setOrderStatus(String dateHour, String name, double realPrice, int quantity, double total) {
        String sql = "INSERT INTO `orderstatus`(`id`, `NameProduct`, `UnitPrice`, `Quantity`, `total`) VALUES (?,?,?,?,?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, dateHour);
            ps.setString(2, name);
            ps.setDouble(3, realPrice);
            ps.setInt(4, quantity);
            ps.setDouble(5, total);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void addFeedback(String type, String content, String date, String phone) {
        String sql = "INSERT INTO `feedback`(`Customerid`, `content`, `type`, `date`) VALUES (?,?,?,?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, phone);
            ps.setString(2, content);
            ps.setString(3, type);
            ps.setString(4, date);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public ArrayList<Order> getOrders(String phone) {
        ArrayList<Order> order = new ArrayList<>();
        String sql = "SELECT total,orderdate,ordertime, orderstatusid,address  FROM `orders` WHERE customerid=?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, phone);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String total = rs.getString(1);
                Date date = rs.getDate(2);
                Time time = rs.getTime(3);
                String status = rs.getString(4);
                String address = rs.getString(5);

                ArrayList<OrderStatus> orderStatus = getOrderStatus(status);
                order.add(new Order(total, date, time, orderStatus, address));
            }
            return order;
        } catch (Exception e) {
            return null;
        }
    }

    public ArrayList<OrderStatus> getOrderStatus(String status) {
        ArrayList<OrderStatus> orderStatus = new ArrayList<>();
        String sql = "SELECT `NameProduct`, `UnitPrice`, `Quantity`, `total` FROM `orderstatus` WHERE id =?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, status);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String name = rs.getString(1);
                String price = rs.getString(2);
                String quantity = rs.getString(3);
                String total = rs.getString(4);
                orderStatus.add(new OrderStatus(name, price, quantity, total));
            }
            return orderStatus;
        } catch (Exception e) {
            return null;
        }
    }

    public void changePassword(String phone, String newPass) {
        String sql = "UPDATE `customers` SET Password = md5(?) WHERE phone = ?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(2, phone);
            ps.setString(1, newPass);

            ps.executeUpdate();

        } catch (Exception e) {
            System.out.println(e);
        }

    }
}
