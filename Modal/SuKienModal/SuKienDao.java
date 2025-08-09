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
	
	public SuKien getSuKienByID(int id) throws Exception {
	    SuKien suKien = null;
	    ketnoi kn = new ketnoi();
	    kn.ketnoi();

	    String sql = "SELECT * FROM SuKien WHERE SuKienID = ?";
	    PreparedStatement cmd = kn.cn.prepareStatement(sql);
	    cmd.setInt(1, id);

	    ResultSet rs = cmd.executeQuery();
	    if (rs.next()) {
	        suKien = new SuKien(
	            rs.getInt("SuKienID"),
	            rs.getInt("Ngay"),
	            rs.getString("Thang"),
	            rs.getString("TieuDe"),
	            rs.getString("MoTa"),
	            rs.getString("DuongDanAnh")
	        );
	    }

	    rs.close();
	    kn.cn.close();
	    return suKien;
	}

}
