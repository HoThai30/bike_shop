package giohangModal;

import java.util.ArrayList;
public class HangBo {
	public ArrayList<Hang> ds= new ArrayList<Hang>();
	  public ArrayList<Hang> getDs() {
		return ds;
       }
 public void Them(String anh, String maxe , String tenxe, Long gia, Long soluong) {
		    for(Hang h: ds)
			   if(h.getMaxe().equals(maxe)) {
				 h.setSoluong(h.getSoluong()+soluong);
				 return;
			 }
		  ds.add(new Hang(anh,maxe, tenxe, gia, soluong));
	  }  
 public void xoa(String maxe) {
	  for(Hang h: ds) 
			 if(h.getMaxe().equals(maxe)) {
				 ds.remove(h);break;
			 }
 }
 public long Tong() {
	  long s=0;
	  for(Hang h: ds)
	   s=s+h.getThanhtien();
	  return s;
 }  
}