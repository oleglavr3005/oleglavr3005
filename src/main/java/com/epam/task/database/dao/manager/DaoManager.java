package com.epam.task.database.dao.manager;

import java.sql.Connection;
import java.sql.SQLException;

import com.epam.task.database.dao.ConveniencesDao;
import com.epam.task.database.dao.CounterDao;
import com.epam.task.database.dao.FeedbackDao;
import com.epam.task.database.dao.HotelDao;
import com.epam.task.database.dao.HotelPhotoDao;
import com.epam.task.database.dao.MailConfirmDao;
import com.epam.task.database.dao.OrderDAO;
import com.epam.task.database.dao.RequestDao;
import com.epam.task.database.dao.RoomDao;
import com.epam.task.database.dao.RoomPhotoDao;
import com.epam.task.database.dao.UserDao;
import com.epam.task.database.util.HikariConnManager;

public class DaoManager {

    private Connection connection;
    private UserDao userDao;
    private RoomDao roomDao;
    private FeedbackDao feedbackDao;
    private OrderDAO orderDAO;
    private HotelDao hotelDao;
    private HotelPhotoDao hotelPhotoDao;
	private RoomPhotoDao roomPhotoDao; 
	private ConveniencesDao conveniencesDao;
    private RequestDao requestDao;
    private MailConfirmDao mailConfirmDao;
    private CounterDao counterDao;
    
    public DaoManager() {
    }

    private Connection getConnection(){
        try {
            if(this.connection == null || this.connection.isClosed()){
                this.connection = HikariConnManager.getConnection();
                if (connection == null) throw new NullPointerException("No connection.");
            }
        } catch (SQLException e) {
        	e.printStackTrace();
            throw new NullPointerException("No connection.");
        }
        return connection;
    }

    public UserDao getUserDao() {
        if (userDao == null) userDao = new UserDao(getConnection());
        else userDao.setConnection(getConnection());
        return userDao;
    }

    public RoomDao getRoomDao() {
        if (roomDao == null) roomDao = new RoomDao(getConnection());
        else roomDao.setConnection(getConnection());
        return roomDao;
    }

    public FeedbackDao getFeedbackDao() {
    	if (feedbackDao == null) feedbackDao = new FeedbackDao(getConnection());
        else feedbackDao.setConnection(getConnection());
        return feedbackDao;
	}
    
    public OrderDAO getOrderDao() {
    	if (orderDAO == null) orderDAO = new OrderDAO(getConnection());
        else orderDAO.setConnection(getConnection());
        return orderDAO;
	}
    
    public ConveniencesDao getConveniencesDao(){
    	if(conveniencesDao == null) conveniencesDao = new ConveniencesDao(getConnection());
    	else conveniencesDao.setConnection(getConnection());
    	return conveniencesDao;
    }
    
    public RequestDao getRequestDao(){
    	if(requestDao == null) requestDao = new RequestDao(getConnection());
    	else requestDao.setConnection(getConnection());
    	return requestDao;
    }
    
    public HotelDao getHotelDao(){
    	if(hotelDao == null) hotelDao = new HotelDao(getConnection());
    	else hotelDao.setConnection(getConnection());
    	return hotelDao;
    }
    
    public HotelPhotoDao getHotelPhotoDao() {
		if (hotelPhotoDao == null)
			hotelPhotoDao = new HotelPhotoDao(getConnection());
		else
			hotelPhotoDao.setConnection(getConnection());
		return hotelPhotoDao;
	}

	public RoomPhotoDao getRoomPhotoDao() {
		if (roomPhotoDao == null)
			roomPhotoDao = new RoomPhotoDao(getConnection());
		else
			roomPhotoDao.setConnection(getConnection());
		return roomPhotoDao;
	}

	public MailConfirmDao getMailConfirmDao() {
		if (mailConfirmDao == null)
			mailConfirmDao = new MailConfirmDao(getConnection());
		else
			mailConfirmDao.setConnection(getConnection());
		return mailConfirmDao;
	}

	public CounterDao getCounterDao() {
		if (counterDao == null)
			counterDao = new CounterDao(getConnection());
		else
			counterDao.setConnection(getConnection());
		return counterDao;
	}
	
    public <T> T executeAndClose(DaoCommand<T> command){
        try{
            return command.execute();
        } finally {
            try {
                getConnection().close();
            } catch (SQLException e) {
            	e.printStackTrace();
            }
        }
    }

    public void executeVoidAndClose(DaoVoidCommand command){
        try{
            command.execute();
        } finally {
            try {
                getConnection().close();
            } catch (SQLException e) {
            	e.printStackTrace();
            }
        }
    }
}
