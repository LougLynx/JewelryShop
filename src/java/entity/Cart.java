// Đây là lớp đại diện cho giỏ hàng, chứa danh sách các sản phẩm (Product) trong giỏ
package entity;

import java.math.BigDecimal;
import java.util.List;

public class Cart {
    private List<Product> items; // Danh sách các sản phẩm hiện có trong giỏ hàng

    // Constructor mặc định, không có tham số
    public Cart() {
    }

    // Constructor với tham số là một danh sách sản phẩm để khởi tạo giỏ hàng
    public Cart(List<Product> items) {
        this.items = items;
    }

    // Phương thức thêm sản phẩm vào giỏ hàng
    public void add(Product ci) {
        for (Product product : items) {
            // Kiểm tra xem sản phẩm đã có trong giỏ chưa bằng cách so sánh id
            if (ci.getId() == product.getId()) {
                // Nếu số lượng hiện tại trong giỏ + 1 không vượt quá số lượng còn lại của sản phẩm
                if ((product.getNumberInCart() + 1) <= product.getAmount()) {
                    // Tăng số lượng sản phẩm trong giỏ lên 1
                    product.setNumberInCart(product.getNumberInCart() + 1);
                }
                return; // Kết thúc phương thức nếu đã tìm thấy và cập nhật số lượng
            }
        }
        // Nếu sản phẩm chưa tồn tại trong giỏ, thêm mới vào danh sách sản phẩm trong giỏ
        items.add(ci);
    }

    // Phương thức giảm số lượng của một sản phẩm trong giỏ hàng
    public void minus(Product ci) {
        for (Product product : items) {
            // Tìm sản phẩm trong giỏ dựa vào id
            if (ci.getId() == product.getId()) {
                // Nếu số lượng trong giỏ lớn hơn 1, giảm đi 1
                if (product.getNumberInCart() > 1) {
                    product.setNumberInCart(product.getNumberInCart() - 1);
                } else {
                    // Nếu số lượng là 1, xóa sản phẩm khỏi giỏ
                    items.remove(product);
                }
                return; // Kết thúc phương thức sau khi xử lý xong
            }
        }
    }

    // Phương thức xóa sản phẩm khỏi giỏ hàng dựa vào id
    public void remove(int id) {
        for (Product product : items) {
            // Kiểm tra id sản phẩm, nếu trùng khớp thì xóa khỏi giỏ
            if (product.getId() == id) {
                items.remove(product);
                return; // Kết thúc phương thức sau khi xóa
            }
        }
    }

    // Phương thức tính tổng tiền của tất cả sản phẩm trong giỏ hàng
    public double getAmount() {
        double s = 0;
        for (Product product : items) {
            // Tính tổng bằng cách nhân giá với số lượng của từng sản phẩm
            s += product.getPrice() * product.getNumberInCart();
        }
        // Làm tròn tổng tiền đến 2 chữ số thập phân
        return Math.round(s * 100.0) / 100.0;
    }

    // Getter để lấy danh sách sản phẩm trong giỏ hàng
    public List<Product> getItems() {
        return items;
    }
}
