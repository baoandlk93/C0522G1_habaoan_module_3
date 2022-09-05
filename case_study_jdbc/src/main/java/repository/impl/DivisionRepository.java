package repository.impl;

import model.person.Division;
import model.person.Position;
import repository.BaseRepository;
import repository.IDivisionRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DivisionRepository implements IDivisionRepository {
    private static final String SELECT_ALL = "select * from division";

    @Override
    public List<Division> displayAll() {
        List<Division> divisions = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement statement = connection.prepareStatement(SELECT_ALL);
            ResultSet set = statement.executeQuery();
            while (set.next()){
                int id = set.getInt("id");
                String name = set.getString("name");
                divisions.add(new Division(id,name));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return divisions;
    }
}
