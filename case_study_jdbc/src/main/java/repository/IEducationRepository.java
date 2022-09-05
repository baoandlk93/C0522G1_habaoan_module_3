package repository;

import model.person.EducationDegree;
import model.person.Position;

import java.util.List;

public interface IEducationRepository {
    List<EducationDegree> displayAll();
}
