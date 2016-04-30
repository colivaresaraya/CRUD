package com.crud.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.crud.model.Occupation;
import com.crud.model.User;
import com.crud.util.DbUtil;

public class UserDAO {

    private Connection connection;

    public UserDAO() {
        connection = DbUtil.getConnection();
    }

    public void addUser(User user) throws Exception {
        try {
            PreparedStatement preparedStatement = connection
                    .prepareStatement("INSERT INTO users(rut,firstname,secondname,lastname,surname,address,weight,height,age,idoccupation) VALUES (?,?,?,?,?,?,?,?,?,?)");
            // Parameters start with 1
            preparedStatement.setString(1, user.getRut());
            preparedStatement.setString(2, user.getFirstName());
            preparedStatement.setString(3, user.getSecondName());
            preparedStatement.setString(4, user.getLastName());
            preparedStatement.setString(5, user.getSurName());
            preparedStatement.setString(6, user.getAddress());
            preparedStatement.setString(7, user.getWeight().toString());
            preparedStatement.setString(8, user.getHeight().toString());
            preparedStatement.setInt(9, user.getAge());
            preparedStatement.setInt(10, user.getOccupation().getId());
            
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
            throw new Exception(e.getMessage());
        }
    }

    public void deleteUser(String rut) {
        try {
            PreparedStatement preparedStatement = connection
                    .prepareStatement("DELETE FROM users WHERE users.rut=?");
            // Parameters start with 1
            preparedStatement.setString(1, rut);
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateUser(User user) {
        try {
            PreparedStatement preparedStatement = connection
                    .prepareStatement("UPDATE users SET firstname=?, secondname=?, lastname=?, surname=?,  address=?, weight=?, height=? , age=?, idoccupation=? WHERE rut=?");
            // Parameters start with 1
            preparedStatement.setString(1, user.getFirstName());
            preparedStatement.setString(2, user.getSecondName());
            preparedStatement.setString(3, user.getLastName());
            preparedStatement.setString(4, user.getSurName());
            preparedStatement.setString(5, user.getAddress());
            preparedStatement.setString(6, user.getWeight().toString());
            preparedStatement.setString(7, user.getHeight().toString());
            preparedStatement.setInt(8, user.getAge());
            preparedStatement.setInt(9, user.getOccupation().getId());
            preparedStatement.setString(10, user.getRut());
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<User> getAllUsers() {
        List<User> users = new ArrayList<User>();
        try {
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery("select users.*, occupation.occupation from users, occupation where users.idoccupation = occupation.idoccupation");
            while (rs.next()) {
            	Occupation occupation = new Occupation();
            	occupation.setId(rs.getInt("idoccupation"));
            	occupation.setName(rs.getString("occupation"));
                User user = new User( rs.getString("rut"),rs.getString("firstname"),rs.getString("secondname"),rs.getString("lastname"),rs.getString("surname"),rs.getString("address"),Double.valueOf(rs.getString("weight")),Double.valueOf(rs.getString("height")),rs.getInt("age"),occupation);
                users.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return users;
    }

    public User getUserById(String rut) {
        User user =  new User();
        try {
            PreparedStatement preparedStatement = connection.
                    prepareStatement("select users.*, occupation.occupation from users, occupation where users.idoccupation = occupation.idoccupation and rut=?");
            preparedStatement.setString(1, rut);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
            	Occupation occupation = new Occupation();
            	occupation.setId(rs.getInt("idoccupation"));
            	occupation.setName(rs.getString("occupation"));
                user = new User( rs.getString("rut"),rs.getString("firstname"),rs.getString("secondname"),rs.getString("lastname"),rs.getString("surname"),rs.getString("address"),rs.getDouble("weight"),rs.getDouble("height"),rs.getInt("age"),occupation);
                
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return user;
    }
}