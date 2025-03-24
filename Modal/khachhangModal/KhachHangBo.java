package khachhangModal;

public class KhachHangBo {
	 KhachHangDao khdao = new KhachHangDao();
	 public KhachHang KtDangNhap(String tendn, String pass)throws Exception{
		return khdao.KtDangNhap(tendn, pass);
	 }
}
