package SanPham;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import ketnoi.ketnoi;

public class SanPhamDao {
    public ArrayList<SanPham> getSanPhamByLoai(String maloai) throws Exception {
        ArrayList<SanPham> ds = new ArrayList<>();
        // Tạo đối tượng kết nối
        ketnoi kn = new ketnoi();
        kn.ketnoi(); // Kết nối đến cơ sở dữ liệu

        // Câu lệnh SQL
        String sql = "SELECT * FROM Xe WHERE maloai = ?";
        PreparedStatement cmd = kn.cn.prepareStatement(sql);
        cmd.setString(1, maloai);
        ResultSet rs = cmd.executeQuery();

        // Duyệt kết quả và thêm vào danh sách
        while (rs.next()) {
            String maxe = rs.getString("maxe");
            String tenxe = rs.getString("tenxe");
            Long gia = rs.getLong("gia");
            String anh = rs.getString("anh");
            String chitiet = rs.getString("chitiet");
            ds.add(new SanPham(maxe, tenxe, gia, anh, chitiet, maloai));
        }

        // Đóng tài nguyên
        rs.close();
        cmd.close();
        kn.cn.close();

        return ds;
    }

}
