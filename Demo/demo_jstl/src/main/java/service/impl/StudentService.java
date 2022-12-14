package service.impl;

import common.Validation;
import model.Student;
import repository.IStudentRepository;
import repository.impl.StudentRepository;
import service.IStudentService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class StudentService  implements IStudentService {
    private IStudentRepository studentRepository = new StudentRepository();
    @Override
    public List<Student> findAll() {
        return studentRepository.findAll();
    }

    @Override
    public Student findBy(int id) {
        return null;
    }

    @Override
    public Map<String, String> add(Student student) {
        // check validate
        Map<String, String> map = new HashMap<>();
        if (student.getPoint()<0){
            map.put("point","Điểm phải nhỏ hơn 0");
        }else if (student.getPoint()>10){
            map.put("point","Điểm phải lớp hơn 10");
        }
        if ("".equals(student.getEmail())){
            map.put("email","Email không được để trống ");
        }else if(!Validation.checkEmail(student.getEmail())){
            map.put("email","Email không đúng định dạng");
        }
        if (map.isEmpty()){
            studentRepository.add(student);
        }

        return map;
    }

    @Override
    public boolean delete(int id) {
        return studentRepository.delete(id);
    }

    @Override
    public List<Student> search(String name, String account, String classID) {
        return studentRepository.search(name,account,classID);
    }

    @Override
    public String transaction() {
        return studentRepository.transaction();
    }
}
