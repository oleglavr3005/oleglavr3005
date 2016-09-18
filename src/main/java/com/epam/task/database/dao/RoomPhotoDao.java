package com.epam.task.database.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;

import com.epam.task.database.model.RoomPhoto;
import com.epam.task.database.transformers.UniversalTransformer;

public class RoomPhotoDao {

	private Connection connection;
	private static final Logger LOGGER = Logger.getLogger(RoomPhotoDao.class);

	private final String SQL_GET_ALL = "SELECT * FROM room_photo";
	private final String SQL_CREATE_ROOM_PHOTO = "INSERT INTO room_photo (img, `desc`, room_id, is_main) VALUES (?, ?, ?, ?)";
	private final String SQL_READ_ROOM_PHOTO_BY_ID = "SELECT * FROM room_photo WHERE room_photo_id = ?";
	private final String SQL_READ_PHOTOS_BY_ROOM = "SELECT * FROM room_photo WHERE room_id = ?";
	private final String SQL_DELETE_PHOTO_BY_ID = "DELETE FROM room_photo WHERE room_photo_id = ?";
	
	private final String SQL_UPDATE_PHOTO = "UPDATE `room_photo` SET img = ?, `desc` = ?, room_id = ?, is_main = ? WHERE room_photo_id = ?";

	public RoomPhotoDao(Connection connection) {
		super();
		this.connection = connection;
	}
	public void setConnection(Connection connection) {
		this.connection = connection;
	}

	public List<RoomPhoto> getAllRoomPhotos() {
		List<RoomPhoto> photos = new ArrayList<>();
		try (PreparedStatement statement = connection.prepareStatement(SQL_GET_ALL);) {
			ResultSet rs = statement.executeQuery();
			photos = (List<RoomPhoto>) UniversalTransformer.getCollectionFromRS(rs, RoomPhoto.class);
		} catch (SQLException e) {
        	LOGGER.error("Cannot get all room photos", e);
		}

		return photos;
	}

	public int insertRoomPhoto(RoomPhoto photo) { // he do create
		int result = 0;
		try (PreparedStatement st = connection.prepareStatement(SQL_CREATE_ROOM_PHOTO)) {
			st.setString(1, photo.getImg());
			st.setString(2, photo.getDesc());
			st.setInt(3, photo.getRoomId());
			st.setBoolean(4, photo.isMain());
			result = st.executeUpdate();

			if(result > 0) {
				LOGGER.info("Room photo inserted");
			}
		} catch (SQLException e) {
        	LOGGER.error("Cannot insert room photo", e);
		}
		return result;
	}

	public RoomPhoto getRoomPhotoById(int id) {
		RoomPhoto photo = null;
		try (PreparedStatement st = connection.prepareStatement(SQL_READ_ROOM_PHOTO_BY_ID);) {
			st.setInt(1, id);
			ResultSet rs = st.executeQuery();
			photo = UniversalTransformer.getObjectFromRS(rs, RoomPhoto.class);
		} catch (SQLException e) {
        	LOGGER.error("Cannot get room photo by id", e);
		}
		return photo;
	}

	public List<RoomPhoto> getRoomPhotosByRoom(int id) {
		List<RoomPhoto> photos = new ArrayList<>();
		try (PreparedStatement statement = connection.prepareStatement(SQL_READ_PHOTOS_BY_ROOM);) {
			statement.setInt(1, id);
			ResultSet rs = statement.executeQuery();
			photos = (List<RoomPhoto>) UniversalTransformer.getCollectionFromRS(rs, RoomPhoto.class);
		} catch (SQLException e) {
        	LOGGER.error("Cannot get room photos by room", e);
		}
		return photos;
	}

	public int deleteRoomPhoto(int roomPhotoId) {
		try (PreparedStatement statement = connection.prepareStatement(SQL_DELETE_PHOTO_BY_ID);) {
			statement.setInt(1, roomPhotoId);
			int result = statement.executeUpdate();
			if(result > 0) {
				LOGGER.info("Room photo removed");
			}
			return result;
		} catch (Exception e) {
        	LOGGER.error("Cannot remove room photo", e);
			return -1;
		}
	}

	public int updateRoomPhoto(RoomPhoto photo) {
		try (PreparedStatement statement = connection.prepareStatement(SQL_UPDATE_PHOTO)) {
			int i = 1;
			statement.setString(i++, photo.getImg());
			statement.setString(i++, photo.getDesc());
			statement.setInt(i++, photo.getRoomId());
			statement.setBoolean(i++, photo.isMain());

			statement.setInt(i, photo.getId());
			int result = statement.executeUpdate();
			if(result > 0) {
				LOGGER.info("Room photo updated");
			}
			return result;
		} catch (SQLException e) {
        	LOGGER.error("Cannot remove update photo", e);
			return -1;
		}
	}

}
