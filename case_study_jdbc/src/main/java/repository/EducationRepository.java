package repository;

import model.person.EducationDegree;
import model.person.Position;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EducationRepository implements IEducationRepository{
    private static final String SELECT_ALL = "select * from education_degree";
    @Override
    public List<EducationDegree> displayAll() {
        List<EducationDegree> educationDegrees = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement statement = connection.prepareStatement(SELECT_ALL);
            ResultSet set = statement.executeQuery();
            while (set.next()){
                int id = set.getInt("id");
                String name = set.getString("name");
                educationDegrees.add(new EducationDegree(id,name));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return educationDegrees;
    }
}
