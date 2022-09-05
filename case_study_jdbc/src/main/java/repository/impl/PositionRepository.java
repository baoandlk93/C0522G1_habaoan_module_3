package repository.impl;

import model.person.Position;
import repository.BaseRepository;
import repository.IPositionRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PositionRepository implements IPositionRepository {
    private static final String SELECT_ALL = "select * from position";
    @Override
    public List<Position> displayAll() {
        List<Position> positions = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement statement = connection.prepareStatement(SELECT_ALL);
            ResultSet set = statement.executeQuery();
            while (set.next()){
                int id = set.getInt("id");
                String name = set.getString("name");
                positions.add(new Position(id,name));

            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return positions;
    }
}
