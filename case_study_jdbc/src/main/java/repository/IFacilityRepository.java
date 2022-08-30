package repository;

import model.facility.Facility;

import java.util.List;

public interface IFacilityRepository {
    List<Facility> displayAll();

    void add();

    void edit();

    void delete();
}
