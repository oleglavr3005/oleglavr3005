package com.epam.task.servlets.manager;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.epam.task.database.model.Hotel;
import com.epam.task.database.model.HotelPhoto;
import com.epam.task.database.model.User;
import com.epam.task.database.service.HotelPhotoService;
import com.epam.task.database.service.HotelService;
import com.epam.task.util.StringUtil;

@WebServlet("/add_hotel")
public class AddHotelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AddHotelServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User manager = (User) request.getSession().getAttribute("user");
		
		String name = request.getParameter("name");
		String city = request.getParameter("city");
		String street = request.getParameter("street");
		String starsString = request.getParameter("stars");
		String description = request.getParameter("description");
		String xCoordString = request.getParameter("xCoord");
		String yCoordString = request.getParameter("yCoord");
		String phoneNumber = request.getParameter("phoneNumber");
		String hotelImagesString = request.getParameter("hotelImages");
		
		if (name == null || city == null || street == null || starsString == null || description == null ||
				xCoordString == null || yCoordString == null || phoneNumber == null || hotelImagesString == null ||
				hotelImagesString.equals("error") || !StringUtil.isInStarsRange(starsString) || 
				!StringUtil.isDouble(xCoordString) || !StringUtil.isDouble(yCoordString)) {
			response.sendError(500);
			return;
		}
		
		int stars = Integer.parseInt(starsString);		
		double xCoord = Double.parseDouble(xCoordString);
		double yCoord = Double.parseDouble(yCoordString);
		
		int hotelId = new HotelService().insertHotel(new Hotel(0, name, city, street, stars, description, manager.getId(), xCoord, yCoord, 0, false, phoneNumber));
		
		if(hotelImagesString.length() > 0 && hotelId > 0) {
			String[] hotelImagesArray = hotelImagesString.split(":::");
			HotelPhotoService hotelPhotoService = new HotelPhotoService();

			for (int i = 0; i < hotelImagesArray.length; i++) {
				hotelPhotoService.insertHotelPhoto(new HotelPhoto(0, hotelImagesArray[i], "", hotelId));
			}
		}		
		
		response.getWriter().write(hotelId > 0 ? ""+hotelId : "error");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
