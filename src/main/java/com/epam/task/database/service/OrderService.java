package com.epam.task.database.service;

import java.sql.Timestamp;
import java.util.List;

import com.epam.task.database.dao.manager.DaoManager;
import com.epam.task.database.model.Order;
import com.epam.task.database.model.Order;
import com.epam.task.database.model.enums.OrderStatus;

public class OrderService {

	private DaoManager daoManager;

	public OrderService() {
		super();
		daoManager = new DaoManager();
	}

	public List<Order> getAllOrders() {
		return daoManager.executeAndClose(() -> daoManager.getOrderDao().getAllOrders());
	}

	public List<Order> getordersByStatus(OrderStatus status) {
		return daoManager.executeAndClose(() -> daoManager.getOrderDao().getOrdersByStatus(status));
	}

	public Order getOrderById(int id) {
		return daoManager.executeAndClose(() -> daoManager.getOrderDao().getOrderById(id));
	}

	public int updateOrder(Order order) {
		return daoManager.executeAndClose(() -> daoManager.getOrderDao().updateOrder(order));
	}

	public int insertOrder(Order order) {
		return daoManager.executeAndClose(() -> daoManager.getOrderDao().insertOrder(order));
	}

	public List<Order> getordersByUser(int userId) {
		return daoManager.executeAndClose(() -> daoManager.getOrderDao().getOrdersByUser(userId));
	}

	public List<Order> getordersByRoom(int roomId) {
		return daoManager.executeAndClose(() -> daoManager.getOrderDao().getOrdersByRoom(roomId));
	}

	public static void main(String[] args) {
		OrderService service = new OrderService();
		service.testing();
	}

	private void testing() {
		OrderService service = new OrderService();
		System.out.println("ById");
		Order order = service.getOrderById(1);
		System.out.println(order.getId());
		System.out.println("ByStatus");
		List<Order> photos = service.getordersByStatus(OrderStatus.ACTIVE);
		for (Order photo : photos) {
			System.out.println(photo.getId());
		}
		System.out.println("All");
		photos = service.getAllOrders();
		for (Order photo : photos) {
			System.out.println(photo.getId());
		}

		System.out.println("Insert");
		Order newPhoto = new Order(8, 2, 1, new Timestamp(7000000), new Timestamp(8070000), "ACTIVE",
				new Timestamp(6070000), 2000);
		service.insertOrder(newPhoto);
		System.out.println("All");
		photos = service.getAllOrders();
		for (Order photo : photos) {
			System.out.println(photo.getId());
		}

		System.out.println("ByUser");
		photos = service.getordersByUser(1);
		for (Order photo : photos) {
			System.out.println(photo.getId());
		}
		System.out.println("ByRoom");
		photos = service.getordersByRoom(2);
		for (Order photo : photos) {
			System.out.println(photo.getId());
		}
		System.out.println("All");
		photos = service.getAllOrders();
		for (Order photo : photos) {
			System.out.println(photo.getId());
		}

		// System.out.println("update");
		// service.updateOrder(new Order(8,1,2,new Timestamp(1000000),new
		// Timestamp(1070000),"ACTIVE",new Timestamp(1070000),2000));

		System.out.println("All");
		photos = service.getAllOrders();
		for (Order photo : photos) {
			System.out.println(photo.getId());
		}

	}
}
