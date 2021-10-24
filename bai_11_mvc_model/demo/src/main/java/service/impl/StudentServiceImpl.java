package service.impl;

import entity.Student;
import repository.StudentRepository;
import repository.impl.StudentRepositoryImpl;
import service.StudentService;

import java.util.List;

public class StudentServiceImpl implements StudentService {
    private StudentRepository studentRepository = new StudentRepositoryImpl();
    @Override
    public List<Student> findAll() {
        List<Student> students = studentRepository.findAll();
        return students;
//        return studentRepository.findAll();
    }

    @Override
    public Student findById(Integer id) {
        Student student = this.studentRepository.findById(id);
        return student;
    }

    @Override
    public void updateStudent(Integer id, String name, String dateOfBirth,Integer gender, Double grade) {
        if(name.equals("")){
            System.out.println("Tên không được để trống");
            return;
        }
        if(dateOfBirth.equals("")){
            System.out.println("Ngày sinh không được để trống");
            return;
        }
        if(this.studentRepository.findById(id)==null){
            System.out.println("Id không tồn tại trong database");
            return;
        }
        this.studentRepository.updateStudent(id, name, dateOfBirth, gender, grade);
    }
}
