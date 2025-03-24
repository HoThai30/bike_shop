package xeModal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import ketnoi.ketnoi;

public class XeDao {
	public ArrayList<Xe> getXe() throws Exception {
		ArrayList<Xe> ds = new ArrayList<Xe>();
		//String maxe, String tenxe, Long soluong, Long gia, String anh, String maloai
		ketnoi kn = new ketnoi();
		kn.ketnoi();
		// tao ra cau lenh sql
		String sql = "select* from xe";
		// thuc hien cau lenh sql
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery();
		// duyet rs va luu vao ds
		while (rs.next()) {
			String maxe = rs.getString("maxe");
			String tenxe = rs.getString("tenxe");
			Long soluong = rs.getLong("soluong");
			Long gia = rs.getLong("gia");
			String anh = rs.getString("anh");
			String maloai = rs.getString("maloai");
			String chitiet = rs.getString("chitiet");
			ds.add(new Xe(maxe, tenxe, soluong, gia, anh, maloai,chitiet));
		}
		rs.close();
		kn.cn.close();
		return ds;
	}
}
