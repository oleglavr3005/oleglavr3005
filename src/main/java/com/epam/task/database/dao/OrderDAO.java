package com.epam.task.database.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.epam.task.database.model.Order;
import com.epam.task.database.transformers.UniversalTransformer;

public class OrderDAO {

	private Connection connection;

	private final String SQL_GET_ALL = "SELECT * FROM order;";
	private final String SQL_CREATE_ORDER = "INSERT INTO order (user_id, room_id, start_date, end_date, status, order_date, price) VALUES (?, ?, ?, ?, ?, ?, ?);";
	private final String SQL_READ_ORDER_BY_ID = "SELECT * FROM order WHERE order_id = ?";
	private final String SQL_UPDATE_ORDER = "";

	public OrderDAO(Connection connection) {
		super();
		this.connection = connection;
	}

	public void setConnection(Connection connection) {
		this.connection = connection;
	}

	public List<Order> getAll() {
		List<Order> orders = null;
		try (PreparedStatement statement = connection.prepareStatement(SQL_GET_ALL);) {
			ResultSet rs = statement.executeQuery();
			orders = (List<Order>) UniversalTransformer.getCollectionFromRS(rs, Order.class);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return orders;
	}

	public int incertOrder(Order order) { // he do create
		int result = 0;
		try (PreparedStatement st = connection.prepareStatement(SQL_CREATE_ORDER);) {
			st.setInt(1, order.getUserId());
			st.setInt(2, order.getRoomId());
			st.setTimestamp(3, order.getStartDate());
			st.setTimestamp(4, order.getEndDate());
			st.setString(5, order.getStartDate().toString());
			st.setTimestamp(6, order.getOrderDate());
			st.setInt(7, order.getPrice());
			result = st.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	public Order getOrderById(int id) {
		Order order = null;
		try (PreparedStatement st = connection.prepareStatement(SQL_CREATE_ORDER);) {
			st.setInt(1, id);
			ResultSet rs = st.executeQuery();
			order = UniversalTransformer.getObjectFromRS(rs, Order.class);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return order;
	}

//	public Order changeOrder(Order order) {
//		try (PreparedStatement st = connection.prepareStatement(SQL);) {
//
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//	}
}
