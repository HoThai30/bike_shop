	package khachhangModal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import ketnoi.ketnoi;



public class KhachHangDao {
	public KhachHang KtDangNhap(String tendn, String pass)throws Exception{
		  ketnoi kn = new ketnoi();
			 kn.ketnoi();
	
			 String sql = "select* from khachhang where tendn=? and pass=?";
			 
			 PreparedStatement cmd = kn.cn.prepareStatement(sql);
			 cmd.setString(1, tendn);
			 cmd.setString(2, pass);
			 ResultSet rs = cmd.executeQuery();
			 KhachHang kh = null;
			 if(rs.next()) { 
				 long makh = rs.getLong("makh");
				 String hoten = rs.getString("hoten");
				 String diachi = rs.getString("diachi");
				 String sodt = rs.getString("sodt");
				 String email = rs.getString("email");
				 kh = new KhachHang(makh, hoten, diachi, sodt, email, tendn, pass);
			 }
			 rs.close();
			 kn.cn.close();
			 return kh;
	  }
	
	
	public boolean dangKyTaiKhoan(KhachHang khachHang) throws Exception {
	    ketnoi kn = new ketnoi();
	    kn.ketnoi();

	    
	    String sqlKiemTra = "SELECT * FROM khachhang WHERE tendn = ?";
	    PreparedStatement cmdKiemTra = kn.cn.prepareStatement(sqlKiemTra);
	    cmdKiemTra.setString(1, khachHang.getTendn());
	    ResultSet rsKiemTra = cmdKiemTra.executeQuery();
	    if (rsKiemTra.next()) {
	        
	        rsKiemTra.close();
	        cmdKiemTra.close();
	        kn.cn.close();
	        return false;
	    }
	    rsKiemTra.close();
	    cmdKiemTra.close();

	    
	    String sqlThem = "INSERT INTO khachhang (hoten, diachi, sodt, email, tendn, pass) VALUES (?, ?, ?, ?, ?, ?)";
	    PreparedStatement cmdThem = kn.cn.prepareStatement(sqlThem);
	    cmdThem.setString(1, khachHang.getHoten());
	    cmdThem.setString(2, khachHang.getDiachi());
	    cmdThem.setString(3, khachHang.getSodt());
	    cmdThem.setString(4, khachHang.getEmail());
	    cmdThem.setString(5, khachHang.getTendn());
	    cmdThem.setString(6, khachHang.getPass());

	    int result = cmdThem.executeUpdate(); 
	    cmdThem.close();
	    kn.cn.close();
	    return result > 0; 
	}

}
