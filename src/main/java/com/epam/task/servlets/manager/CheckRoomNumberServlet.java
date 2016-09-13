package com.epam.task.servlets.manager;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.epam.task.database.model.Room;
import com.epam.task.database.service.RoomService;
import com.epam.task.util.StringUtil;

@WebServlet("/check_room_number")
public class CheckRoomNumberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public CheckRoomNumberServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String hotelIdString = request.getParameter("hotelId");
		String roomNumber = request.getParameter("roomNumber");
		
		if(hotelIdString == null || roomNumber == null || 
				!roomNumber.matches("^[1-9][0-9]*[a-zA-Z�-��-߳��������]?(, *[1-9][0-9]*[a-zA-Z�-��-߳��������]?)*$") || 
				!StringUtil.isPositiveInteger(hotelIdString)) {
			response.sendError(500);
			return;
		}

		String[] numbers = roomNumber.split(", *");
		
		response.setContentType("text/plain");
		response.setCharacterEncoding("UTF-8");
		int hotelId = Integer.parseInt(hotelIdString);
		
		List<Room> rooms = new RoomService().getAllRoomsForHotel(hotelId);	//all rooms
		for(int i = 0; i<numbers.length; i++) {
			for (Room room : rooms) {
				if(room.getNumber().equals(numbers[i])){		//if number exists for this hotel
					response.getWriter().write("false");		//we CANNOT create room, return false
					response.getWriter().flush();
					return;
				}
			}
		}
		
		response.getWriter().write("true");		//if we CAN create room, return true
		response.getWriter().flush();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
