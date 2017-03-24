package org.colman.liberty;

import java.io.IOException;
import java.io.InputStreamReader;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.*;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

@WebServlet("ComplexServlet")
public class ComplexServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -4995313776242501757L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		JSONParser parser = new JSONParser();
		try {
			parser.parse(new InputStreamReader(req.getInputStream()));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
 