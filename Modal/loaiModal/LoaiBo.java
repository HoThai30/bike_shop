package loaiModal;

import java.util.ArrayList;

public class LoaiBo {
	LoaiDao ldao = new LoaiDao();
	public ArrayList<Loai> getloai() throws Exception{
		return ldao.getloai();
}
}