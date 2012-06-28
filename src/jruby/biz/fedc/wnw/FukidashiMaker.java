package biz.fedc.wnw;

import java.awt.AlphaComposite;
import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.Polygon;
import java.awt.RenderingHints;
import java.awt.geom.RoundRectangle2D;
import java.awt.image.BufferedImage;
import java.io.FileInputStream;
import java.io.IOException;

import javax.imageio.ImageIO;

public class FukidashiMaker {
	static public BufferedImage getFukidashiImage(String fileName) throws IOException, IOException{
		BufferedImage image = ImageIO.read(new FileInputStream(fileName));
		Graphics g = image.getGraphics();
		Graphics2D g2 = (Graphics2D)g;
		
        // アルファ値
        AlphaComposite composite = AlphaComposite.getInstance(
                AlphaComposite.SRC_OVER, 0.3f);

        // アルファ値をセット（以後の描画は半透明になる）
        g2.setComposite(composite);
	
		g2.setColor(Color.CYAN);
		g2.fill(new RoundRectangle2D.Double(50.0d, 50.0d, 170.0d, 90.0d, 20.0d, 20.0d));
		
		int[] xpoints1 = {150, 200, 200};
		int[] ypoints1 = {140, 140, 180};
		Polygon polygon1 = new Polygon(xpoints1, ypoints1, xpoints1.length);
		  
		g2.fill(polygon1);
		//文字
		composite = AlphaComposite.getInstance(
                AlphaComposite.SRC_OVER, 0.9f);
		g2.setComposite(composite);
		g2.setRenderingHint(RenderingHints.KEY_TEXT_ANTIALIASING, 
                RenderingHints.VALUE_TEXT_ANTIALIAS_ON);
		g2.setFont(new Font(null,Font.PLAIN,20));
		g2.setColor(Color.BLACK);
		g2.drawString("ニャー", 70, 100);
		
		// 縁
		//BasicStroke wideStroke = new BasicStroke(4.0f);
		//g2.setStroke(wideStroke);
		//g2.setColor(Color.BLUE);
		//g2.draw(new RoundRectangle2D.Double(50.0d, 50.0d, 170.0d, 90.0d, 20.0d, 20.0d));

		return image;
	}
}
