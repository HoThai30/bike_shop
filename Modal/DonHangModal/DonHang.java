package DonHangModal;

import java.util.List;

import giohangModal.Hang;

public class DonHang {
	    private int mahd;
	    private long makh; // ID khách hàng
	    private String ngayTao;
	    private Long tongTien;
	    private List<Hang> chiTietDonHang;
		public DonHang(int mahd, long makh, String ngayTao, Long tongTien, List<Hang> chiTietDonHang) {
			super();
			this.mahd = mahd;
			this.makh = makh;
			this.ngayTao = ngayTao;
			this.tongTien = tongTien;
			this.chiTietDonHang = chiTietDonHang;
		}
		public int getMahd() {
			return mahd;
		}
		public void setMahd(int mahd) {
			this.mahd = mahd;
		}
		public long getMakh() {
			return makh;
		}
		public void setMakh(long makh) {
			this.makh = makh;
		}
		public String getNgayTao() {
			return ngayTao;
		}
		public void setNgayTao(String ngayTao) {
			this.ngayTao = ngayTao;
		}
		public Long getTongTien() {
			return tongTien;
		}
		public void setTongTien(Long tongTien) {
			this.tongTien = tongTien;
		}
		public List<Hang> getChiTietDonHang() {
			return chiTietDonHang;
		}
		public void setChiTietDonHang(List<Hang> chiTietDonHang) {
			this.chiTietDonHang = chiTietDonHang;
		}
		
	    
	    
}
