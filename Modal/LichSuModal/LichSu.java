package LichSuModal;

import java.util.Date;

public class LichSu {
	private long id;
	private long mahd;
	private String tenxe;
	private long soluong;
	private long gia;
	private long ThanhTien;
	
	public LichSu(long id, long mahd, String tenxe, long soluong, long gia, long thanhTien) {
		super();
		this.id = id;
		this.mahd = mahd;
		this.tenxe = tenxe;
		this.soluong = soluong;
		this.gia = gia;
		ThanhTien = thanhTien;
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public long getMahd() {
		return mahd;
	}
	public void setMahd(long mahd) {
		this.mahd = mahd;
	}
	public String getTenxe() {
		return tenxe;
	}
	public void setTenxe(String tenxe) {
		this.tenxe = tenxe;
	}
	public long getSoluong() {
		return soluong;
	}
	public void setSoluong(long soluong) {
		this.soluong = soluong;
	}
	public long getGia() {
		return gia;
	}
	public void setGia(long gia) {
		this.gia = gia;
	}
	public long getThanhTien() {
		return ThanhTien;
	}
	public void setThanhTien(long thanhTien) {
		ThanhTien = thanhTien;
	}
	

	
	
}
