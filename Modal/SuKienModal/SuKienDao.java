package SuKienModal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import ketnoi.ketnoi;


public class SuKienDao {
	public ArrayList<SuKien>  getAllSuKien() throws Exception {
		ArrayList<SuKien> sk = new ArrayList<SuKien>();
		ketnoi kn = new ketnoi();
		kn.ketnoi();
		// tao ra cau lenh sql
		String sql ="SELECT * FROM SuKien ORDER BY NgayTao DESC";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery();
		while (rs.next()) {
            SuKien suKien = new SuKien(
                rs.getInt("SuKienID"),
                rs.getInt("Ngay"),
                rs.getString("Thang"),
                rs.getString("TieuDe"),
                rs.getString("MoTa"),
                rs.getString("DuongDanAnh")
            );
            sk.add(suKien);
        }
		rs.close();
		kn.cn.close();
		return sk;
   }
}
