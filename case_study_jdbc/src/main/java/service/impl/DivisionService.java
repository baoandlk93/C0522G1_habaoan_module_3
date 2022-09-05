package service.impl;

import model.person.Division;
import repository.IDivisionRepository;
import repository.impl.DivisionRepository;
import service.IDivisionService;

import java.util.List;

public class DivisionService implements IDivisionService {
    IDivisionRepository divisionRepository = new DivisionRepository();
    @Override
    public List<Division> displayAll() {
        return divisionRepository.displayAll();
    }
}
