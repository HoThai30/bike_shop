package loaiModal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import ketnoi.ketnoi;

public class LoaiDao {
	public ArrayList<Loai> getloai() throws Exception {
		ArrayList<Loai> ds = new ArrayList<Loai>();
		// ket noi
		ketnoi kn = new ketnoi();
		kn.ketnoi();
		// tao ra cau lenh sql
		String sql = "select* from loai";
		// thuc hien cau lenh sql
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery();
		// duyet rs va luu vao ds
		while (rs.next()) {
			String maloai = rs.getString("maloai");
			String tenloai = rs.getString("tenloai");
			ds.add(new Loai(maloai, tenloai));

		}
		rs.close();
		kn.cn.close();
		return ds;
	}
}
