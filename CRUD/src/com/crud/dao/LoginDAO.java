package com.crud.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.crud.model.Login;
import com.crud.model.Occupation;
import com.crud.model.User;
import com.crud.util.DbUtil;

public class LoginDAO {

    private Connection connection;

    public LoginDAO() {
        connection = DbUtil.getConnection();
    }


    public Boolean getLogin(Login login) {
    	Boolean ok = Boolean.FALSE;
        try {
            PreparedStatement preparedStatement = connection.
                    prepareStatement("select count(user) as ok from login where user=? AND pass=?");
            preparedStatement.setString(1, login.getUser());
            preparedStatement.setString(2, login.getPass());
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
            	if(1==rs.getInt("ok")){
            		ok = Boolean.TRUE;
            	}
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return ok;
    }
}