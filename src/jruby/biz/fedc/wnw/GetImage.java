package biz.fedc.wnw;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class GetImage extends HttpServlet{
	public void doGet(HttpServletRequest req, HttpServletResponse res)
	throws IOException, ServletException {
		res.setContentType ( "image/jpeg" );

        ServletContext sc = getServletContext();
        String theRealPath = sc.getRealPath ( "/" );
        System.out.println ( "theRealPath=" + theRealPath );

        String imagePath = theRealPath + File.separator + "WEB-INF"
                           + File.separator + "img"
                           + File.separator
                           + "909.jpg";

        BufferedInputStream bis = new BufferedInputStream ( new FileInputStream ( imagePath ) );

        ServletOutputStream sos=res.getOutputStream();

        int i;
        while ( ( i = bis.read() ) != -1 ) {
            sos.write ( ( char ) i );
        }

        sos.close();
        bis.close();
	}
}
