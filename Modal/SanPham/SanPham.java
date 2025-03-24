package SanPham;

public class SanPham {
    private String maxe;      // Mã sản phẩm (xe)
    private String tenxe;     // Tên sản phẩm (xe)
    private Long gia;       // Giá sản phẩm
    private String anh;       // Đường dẫn ảnh sản phẩm
    private String chitiet;   // Thông tin chi tiết sản phẩm
    private String maloai;    // Mã loại sản phẩm

    // Constructor đầy đủ
    public SanPham(String maxe, String tenxe, Long gia, String anh, String chitiet, String maloai) {
        this.maxe = maxe;
        this.tenxe = tenxe;
        this.gia = gia;
        this.anh = anh;
        this.chitiet = chitiet;
        this.maloai = maloai;
    }

    // Constructor không tham số (nếu cần)
    public SanPham() {
    }

    // Getter và Setter cho từng thuộc tính
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

    public double getGia() {
        return gia;
    }

    public void setGia(Long gia) {
        this.gia = gia;
    }

    public String getAnh() {
        return anh;
    }

    public void setAnh(String anh) {
        this.anh = anh;
    }

    public String getChitiet() {
        return chitiet;
    }

    public void setChitiet(String chitiet) {
        this.chitiet = chitiet;
    }

    public String getMaloai() {
        return maloai;
    }

    public void setMaloai(String maloai) {
        this.maloai = maloai;
    }
}