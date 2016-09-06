package com.epam.task.servlets.manager;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.epam.task.database.model.Hotel;
import com.epam.task.database.service.HotelService;

@WebServlet("/change_hotel_status")
public class ChangeHotelStatusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ChangeHotelStatusServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String hotelIdString = request.getParameter("hotelId");
		String deletedString = request.getParameter("deleted"); //true or false
		
		if(hotelIdString == null || deletedString == null) {
			return;
		}
		
		int hotelId = Integer.parseInt(hotelIdString);
		boolean deleted = Boolean.parseBoolean(deletedString);
		
		HotelService hotelService = new HotelService();
		Hotel hotel = hotelService.getHotelById(hotelId);
		hotel.setDeleted(deleted);
		int changed = hotelService.updateHotel(hotel);
		
		response.getWriter().write(changed > 0 ? "true" : "false");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
