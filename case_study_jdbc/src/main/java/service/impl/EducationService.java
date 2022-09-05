package service.impl;

import model.person.EducationDegree;
import repository.EducationRepository;
import repository.IEducationRepository;
import service.IEducationService;

import java.util.List;

public class EducationService implements IEducationService {
    IEducationRepository educationRepository = new EducationRepository();
    @Override
    public List<EducationDegree> displayAll() {
        return educationRepository.displayAll();
    }
}
