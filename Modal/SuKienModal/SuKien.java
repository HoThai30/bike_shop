package SuKienModal;

public class SuKien {
    private int suKienID;
    private int ngay;
    private String thang;
    private String tieuDe;
    private String moTa;
    private String anh;

    // Constructor
    public SuKien(int suKienID, int ngay, String thang, String tieuDe, String moTa, String anh) {
        this.suKienID = suKienID;
        this.ngay = ngay;
        this.thang = thang;
        this.tieuDe = tieuDe;
        this.moTa = moTa;
        this.anh = anh;
    }

    // Getters và Setters
    public int getSuKienID() {
        return suKienID;
    }

    public void setSuKienID(int suKienID) {
        this.suKienID = suKienID;
    }

    public int getNgay() {
        return ngay;
    }

    public void setNgay(int ngay) {
        this.ngay = ngay;
    }

    public String getThang() {
        return thang;
    }

    public void setThang(String thang) {
        this.thang = thang;
    }

    public String getTieuDe() {
        return tieuDe;
    }

    public void setTieuDe(String tieuDe) {
        this.tieuDe = tieuDe;
    }

    public String getMoTa() {
        return moTa;
    }

    public void setMoTa(String moTa) {
        this.moTa = moTa;
    }

    public String getAnh() {
        return anh;
    }

    public void setAnh(String Anh) {
        this.anh = Anh;
    }
}

