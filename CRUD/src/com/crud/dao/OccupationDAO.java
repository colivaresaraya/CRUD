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

public class OccupationDAO {

    private Connection connection;

    public OccupationDAO() {
        connection = DbUtil.getConnection();
    }



    public List<Occupation> getAllOccupation() {
        List<Occupation> occupations = new ArrayList<Occupation>();
        try {
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery("select * from occupation");
            while (rs.next()) {
            	Occupation occupation = new Occupation();
            	occupation.setId(rs.getInt("idoccupation"));
            	occupation.setName(rs.getString("occupation"));
            	occupations.add(occupation);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return occupations;
    }
}