package DonHangModal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import giohangModal.Hang;
import ketnoi.ketnoi;

public class DonHangDao {
	// Thêm đơn hàng vào cơ sở dữ liệu
	public int themDonHang(long makh, String ngaymua, long tongTien) throws SQLException {
	    // Tạo kết nối
	    ketnoi kn = new ketnoi();  
	    try {
			kn.ketnoi();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} // Kết nối tới cơ sở dữ liệu
	    String sql = "INSERT INTO donhang (makh, ngaymua, tongtien) VALUES (?, ?, ?)";

	    // Sử dụng PreparedStatement với tùy chọn lấy khóa tự động
	    try (PreparedStatement cmd = kn.cn.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS)) {
	        // Thiết lập giá trị cho các tham số
	        cmd.setLong(1, makh);
	        cmd.setString(2, ngaymua);
	        cmd.setLong(3, tongTien);

	        // Thực thi câu lệnh INSERT
	        int affectedRows = cmd.executeUpdate();

	        // Kiểm tra nếu chèn thành công
	        if (affectedRows > 0) {
	            // Lấy khóa tự động (mahd) đã được tạo
	            try (ResultSet rs = cmd.getGeneratedKeys()) {
	                if (rs.next()) {
	                    return rs.getInt(1); // Trả về mã đơn hàng (mahd)
	                }
	            }
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	        // Xử lý lỗi (nếu cần thiết)
	    } finally {
	        // Đảm bảo kết nối được đóng
	        if (kn.cn != null) {
	            kn.cn.close();
	        }
	    }

	    // Trả về -1 nếu không thành công
	    return -1;
	}

	public int themChiTietDonHang(long mahd, List<Hang> chiTietDonHang) throws SQLException {
		ketnoi kn = new ketnoi(); // Tạo đối tượng kết nối CSDL
		try {
			kn.ketnoi();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String sql = "INSERT INTO ctdonhang (mahd, tenxe, soluong, gia, thanhtien) VALUES (?, ?, ?, ?, ?)";

		// Sử dụng PreparedStatement để thực thi câu lệnh SQL
		PreparedStatement cmd = kn.cn.prepareStatement(sql);

		try {
			// Lặp qua từng sản phẩm trong giỏ hàng và thêm vào bảng ChiTietDonHang
			for (Hang hang : chiTietDonHang) {
				cmd.setLong(1, mahd); // Mã hóa đơn
				cmd.setString(2, hang.getTenxe()); // 
				cmd.setInt(3, hang.getSoluong().intValue()); // Số lượng
				cmd.setLong(4, hang.getGia()); // Giá
				cmd.setLong(5, hang.getThanhtien()); // Thành tiền (số lượng * giá)

				// Thực thi câu lệnh chèn
				cmd.executeUpdate();
			}

			return 1; // Trả về 1 nếu việc thêm thành công
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// Đóng kết nối
			if (kn.cn != null) {
				kn.cn.close();
			}
		}

		return -1; // Trả về -1 nếu có lỗi
	}
	
	


}
