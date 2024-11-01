/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import context.DBContext;
import entity.Category;
import entity.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class ProductDAO {
// Khai báo các biến kết nối với cơ sở dữ liệu

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Product> getProductsWithPaging(String txtSearch, Integer pageIndex, Integer pageSize, String cID, String sort, String priceRange) {
        List<Product> list = new ArrayList<>();
        // Câu lệnh SQL cơ bản với các điều kiện lọc theo danh mục và tên sản phẩm
        String query = "select P.*,C.* from Product P left join Category C on C.cID = P.cID where isDeleted != 1 and (? = '' or P.cID = ?) and (? = '' or pName like ?) ";
        // Thêm điều kiện lọc theo khoảng giá
        if (priceRange != null) {
            if (priceRange.equals("low")) {
                query += " and price between 0 and 300 ";
            } else if (priceRange.equals("medium")) {
                query += " and price between 300 and 1000 ";
            } else if (priceRange.equals("high")) {
                query += " and price > 1000 ";
            }
        }
// Thêm điều kiện sắp xếp theo giá hoặc ID sản phẩm
        if (sort != null && sort.equals("asc")) {
            query += " ORDER BY price\n";
        } else if (sort != null && sort.equals("desc")) {
            query += " ORDER BY price desc\n";
        } else {
            query += " ORDER BY pID desc\n";
        }
        // Áp dụng phân trang nếu có chỉ số trang
        if (pageIndex != null) {
            query += " OFFSET (?*?-?) ROWS FETCH NEXT ? ROWS ONLY";
        }

        try {
            conn = new DBContext().getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(query);//nem cau lenh query sang sql
            // Thiết lập các giá trị cho tham số
            ps.setString(1, cID);
            ps.setString(2, cID);
            ps.setString(3, txtSearch);
            ps.setString(4, "%" + txtSearch + "%");
            if (pageIndex != null) {
                ps.setInt(5, pageIndex);
                ps.setInt(6, pageSize);
                ps.setInt(7, pageSize);
                ps.setInt(8, pageSize);
            }
            rs = ps.executeQuery();//chay cau lenh query, nhan ket qua tra ve
            while (rs.next()) {
                // Tạo đối tượng sản phẩm và danh mục từ kết quả
                Product p = new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7), rs.getInt(8), rs.getInt(9));
                Category c = new Category();
                c.setName(rs.getString("cName"));
                p.setCategory(c);
                list.add(p);
            }

        } catch (Exception e) {
        }
        return list;
    }

    public Product getProductByID(String id) {
        String query = "select * from Product P left join Category C on C.cID = P.cID where P.pID = ?";
        try {
            conn = new DBContext().getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(query);//nem cau lenh query sang sql
            ps.setString(1, id);
            rs = ps.executeQuery();//chay cau lenh query, nhan ket qua tra ve
            while (rs.next()) {
                Product p = new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7), rs.getInt(8), rs.getInt(9));
                Category c = new Category();
                c.setName(rs.getString("cName"));
                p.setCategory(c);
                return p;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public void updateAmounProduct(int amount, int productID) {
        String query = "UPDATE Product SET pAmount = ? WHERE pID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, amount);
            ps.setInt(2, productID);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void addProduct(Product p) {
        String query = "INSERT into Product (pName, [image], price, [description], cID, pAmount, isDeleted)\n"
                + "VALUES (?, ?, ?, ?, ?, ?, 0)";
        try {
            conn = new DBContext().getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(query);//nem cau lenh query sang sql
            ps.setString(1, p.getName());
            ps.setString(2, p.getImage());
            ps.setDouble(3, p.getPrice());
            ps.setString(4, p.getDescription());
            ps.setInt(5, p.getCateID());
            ps.setInt(6, p.getAmount());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void updateProduct(Product p) {
        String query = "UPDATE Product set pName = ?, image = ?, price = ?, description = ?, cID = ?, pAmount = ? where pID = ?";
        try {
            conn = new DBContext().getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(query);//nem cau lenh query sang sql
            ps.setString(1, p.getName());
            ps.setString(2, p.getImage());
            ps.setDouble(3, p.getPrice());
            ps.setString(4, p.getDescription());
            ps.setInt(5, p.getCateID());
            ps.setInt(6, p.getAmount());
            ps.setInt(7, p.getId());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void deleteProduct(String pid) {//edit param
        //edit query (my_table), number of param
        String query = "Update Product\n"
                + "set isDeleted = 1 WHERE pID = ?";
        try {
            conn = new DBContext().getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(query);//nem cau lenh query sang sql
            ps.setString(1, pid);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Product> getTop8NewestProduct() {
        List<Product> list = new ArrayList<>();
        String query = "select top 8 * from Product P left join Category C on C.cID = P.cID where isDeleted != 1 order by P.pID desc";
        try {
            conn = new DBContext().getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(query);//nem cau lenh query sang sql
            rs = ps.executeQuery();//chay cau lenh query, nhan ket qua tra ve
            while (rs.next()) {
                Product p = new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7), rs.getInt(8), rs.getInt(9));
                Category c = new Category();
                c.setName(rs.getString("cName"));
                p.setCategory(c);
                list.add(p);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
