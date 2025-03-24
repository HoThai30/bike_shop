package giohangModal;

public class Hang {
	 private String anh;
	 private String maxe;
	 private String tenxe;
	 private Long gia;
	 private Long soluong;
	 private Long thanhtien;
	public Hang(String anh, String maxe, String tenxe, Long gia, Long soluong) {
		super();
		this.anh = anh;
		this.maxe = maxe;
		this.tenxe = tenxe;
		this.gia = gia;
		this.soluong = soluong;
		this.thanhtien = soluong*gia;
		
	   
	}

	public Hang(String tenXe, long soLuong, long gia, long thanhTien) {
    this.tenxe = tenXe;
    this.soluong = soLuong;
    this.gia = gia;
    this.thanhtien = thanhTien;
}

	public String getAnh() {
		return anh;
	}

	public void setAnh(String anh) {
		this.anh = anh;
	}

	public String getMaxe() {
		return maxe;
	}
	public void setMaxe(String maxe) {
		this.maxe = maxe;
	}
	public String getTenxe() {
		return tenxe;
	}
	public void setTenxe(String tenxe) {
		this.tenxe = tenxe;
	}
	public Long getGia() {
		return gia;
	}
	public void setGia(Long gia) {
		this.gia = gia;
	}
	public Long getSoluong() {
		return soluong;
	}
	public void setSoluong(Long soluong) {
		this.soluong = soluong;
	}
	public Long getThanhtien() {
		return soluong*gia;
	}
	public void setThanhtien(Long thanhtien) {
		this.thanhtien = soluong*gia;
	}

	 
}
