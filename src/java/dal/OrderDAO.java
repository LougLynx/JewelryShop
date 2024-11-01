/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import context.DBContext;
import entity.Order;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class OrderDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public int insertOrder(Order order) {
        String query = "INSERT INTO [Order](orderDate, accountID,addressReceive,sdt,name,totalPrice)\n"
                + "VALUES (GETDATE(), ?, ?, ?, ?, ?)";
        int generatedId = -1;
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query, PreparedStatement.RETURN_GENERATED_KEYS);
            ps.setInt(1, order.getAccountID());
            ps.setString(2, order.getAddress());
            ps.setString(3, order.getSdt());
            ps.setString(4, order.getName());
            ps.setDouble(5, order.getTotalPrice());
            ps.executeUpdate();
            rs = ps.getGeneratedKeys(); // Lấy các khóa tự động sinh sau khi insert
            if (rs.next()) {
                generatedId = rs.getInt(1); // Lấy ID tự động tăng của bản ghi vừa thêm
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return generatedId; // Trả về ID của bản ghi vừa thêm
    }

    public List<Double> getMonthlyRevenue(int year) {
        List<Double> revenueList = new ArrayList<>();
        String query = "WITH Months AS (\n"
                + "    SELECT 1 AS Month\n"
                + "    UNION ALL\n"
                + "    SELECT 2\n"
                + "    UNION ALL\n"
                + "    SELECT 3\n"
                + "    UNION ALL\n"
                + "    SELECT 4\n"
                + "    UNION ALL\n"
                + "    SELECT 5\n"
                + "    UNION ALL\n"
                + "    SELECT 6\n"
                + "    UNION ALL\n"
                + "    SELECT 7\n"
                + "    UNION ALL\n"
                + "    SELECT 8\n"
                + "    UNION ALL\n"
                + "    SELECT 9\n"
                + "    UNION ALL\n"
                + "    SELECT 10\n"
                + "    UNION ALL\n"
                + "    SELECT 11\n"
                + "    UNION ALL\n"
                + "    SELECT 12\n"
                + ")\n"
                + "SELECT \n"
                + "    M.Month,\n"
                + "    ISNULL(SUM(O.totalPrice), 0) AS MonthlyRevenue\n"
                + "FROM \n"
                + "    Months M\n"
                + "LEFT JOIN \n"
                + "    dbo.[Order] O ON MONTH(O.orderDate) = M.Month AND YEAR(O.orderDate) = ?\n"
                + "GROUP BY \n"
                + "    M.Month\n"
                + "ORDER BY \n"
                + "    M.Month;\n";

        try {
            conn = new DBContext().getConnection(); // Kết nối tới cơ sở dữ liệu
            ps = conn.prepareStatement(query); // Chuẩn bị câu truy vấn
            ps.setInt(1, year); // Thiết lập tham số năm
            rs = ps.executeQuery(); // Thực thi câu truy vấn và nhận kết quả
            while (rs.next()) {
                revenueList.add(rs.getDouble("MonthlyRevenue")); // Lấy doanh thu của mỗi tháng
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return revenueList;
    }
}
