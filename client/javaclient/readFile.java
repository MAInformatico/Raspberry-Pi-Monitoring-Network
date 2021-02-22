
import java.io.*;
import java.util.*;


class readFile {
	private File archive = null;	
      	private FileReader fr = null;
	private BufferedReader br = null;
	private String linea;
	private String[] IPandPort;

	public String getLinea(){
		return linea;
	}
	public String getIPandPort(int n){
		String value = "";
		if (n == 0){
			value = IPandPort[0];
		}
		if (n == 1){
			value = IPandPort[1];
		}
		return value;	
	}


   public readFile() {
      try {
         archive = new File ("config/parameters.txt");
         fr = new FileReader (archive);
         br = new BufferedReader(fr);

	linea = br.readLine();
	IPandPort = linea.split(" ");
         //while((linea=br.readLine())!=null)
//            System.out.println(linea);
      }
      catch(Exception e){
         e.printStackTrace();
      }finally{
         try{                    
            if( null != fr ){   
               fr.close();     
            }                  
         }catch (Exception e2){ 
            e2.printStackTrace();
         }
      }
   }

}
