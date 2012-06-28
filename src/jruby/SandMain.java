import java.awt.image.BufferedImage;
import java.io.FileNotFoundException;
import java.io.IOException;

import javax.imageio.ImageIO;


public class SandMain {

	/**
	 * @param args
	 * @throws IOException 
	 * @throws FileNotFoundException 
	 */
	public static void main(String[] args) throws FileNotFoundException, IOException {
		
		BufferedImage image = biz.fedc.wnw.FukidashiMaker.getFukidashiImage("/Users/fujisaki/src/jruby/neko.jpeg");
		ImageIO.write(image, "PNG", new java.io.File("sample.jpeg"));
		System.out.println("end");
	}

}
