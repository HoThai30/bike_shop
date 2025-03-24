package xeModal;

import java.util.ArrayList;



public class XeBo {
	 XeDao xdao= new XeDao();
	   ArrayList<Xe> ds;
	   public ArrayList<Xe> getXe() throws Exception{
		   ds=xdao.getXe();
		   return ds;
	   }
	   public ArrayList<Xe> Timma(String maloai){
		   ArrayList<Xe> tam= new ArrayList<Xe>();
		   for(Xe s: ds)
			   if(s.getMaloai().toLowerCase().trim().equals(
					   maloai.toLowerCase().trim()))
				   tam.add(s);
		   return tam;
	   }
	   public ArrayList<Xe> Tim(String key){
		   ArrayList<Xe> tam= new ArrayList<Xe>();
		   for(Xe s: ds)
			   if(s.getTenxe().toLowerCase().trim().contains(
					   key.toLowerCase().trim()))
				   tam.add(s);
		   return tam;
	   } 
	
	
}
