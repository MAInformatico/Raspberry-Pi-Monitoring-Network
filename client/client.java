import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.util.*;

public class client extends Thread{

	private URL    url      = null;
	private String location = null;	
	private FileOutputStream fileOutputStream = null;
	private InputStream      inputStream      = null;	
	static int len = 0;
	static int off = 0;
	static String IP = ""; //your IP
	static String Port = ""; //your Port
	static String path = "";	//the folder that you want to download the files
	static ArrayList<String> Files = new ArrayList<>();	
	
	static void  addFiles(ArrayList<String> Files){
		Files.add("temperature.txt");
		Files.add("ports.txt");
		Files.add("hosts.txt");
		Files.add("process.txt");	
	}	
	
	public client(final URL url,String location) {
		this.url      = url;
		this.location = location;
		try {
			URLConnection urlConnection = this.url.openConnection();
			inputStream = urlConnection.getInputStream();
			String p = url.getFile();
			String name = p.substring(p.lastIndexOf("/")+1, p.length());
			System.out.println("Filename: "+name);
			fileOutputStream = new FileOutputStream(new File(this.location+name));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	static byte[] buffer = new byte[1024];
	
	public static void main(String[] args) {		
	try {
		addFiles(Files);
		for(int i = 0; i<Files.size();i++){
			new client(new URL("http://"+ IP + ":" + Port + "/" + Files.get(i)), path).start();
		}
	} catch (MalformedURLException malformedURLException) {
		malformedURLException.printStackTrace();
		}
	}
	@Override
	public void run() {
		try {
			System.out.println("Downloading...");
			while((len=inputStream.read(buffer))>=0){
				fileOutputStream.write(buffer, off, len);
				fileOutputStream.flush();
			}
			System.out.println("Download completed: "+location+this);
		} catch (IOException ioException) {
			ioException.printStackTrace();
		}finally{
			try {
				fileOutputStream.close();
			} catch (IOException ioException2) {
				ioException2.printStackTrace();
			}
		}
	}
}

