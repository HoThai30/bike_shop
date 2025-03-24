package LichSuModal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import ketnoi.ketnoi;

public class LichSuDao {
	public ArrayList<LichSu> getLichSu() throws Exception{
	    ArrayList<LichSu> ds= new ArrayList<LichSu>();
	    ketnoi kn= new ketnoi();
	    kn.ketnoi();
	    String sql="select * from ctdonhang";
	    PreparedStatement cmd= kn.cn.prepareStatement(sql);
	    ResultSet rs= cmd.executeQuery();
	    //long id, long mahd, String tenxe, long soluong, long gia, long thanhTien
	    while(rs.next()) {
	        long id=rs.getLong("id");
	        long mahd=rs.getLong("mahd");
	        String tenxe=rs.getString("tenxe");
	        long soluong=rs.getLong("soluong");;
	        long gia=rs.getLong("gia");
	        long ThanhTien=rs.getLong("ThanhTien");;
	
	ds.add(new LichSu(id,mahd,tenxe,soluong,gia,ThanhTien));
	    } rs.close();kn.cn.close();
	    return ds;
	}
}
