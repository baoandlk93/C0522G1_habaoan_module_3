package service;

import model.person.EducationDegree;
import repository.impl.EducationRepository;
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
