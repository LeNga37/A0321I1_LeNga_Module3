package repository.impl;

import entity.Student;
import repository.StudentRepository;
import java.util.ArrayList;
import java.util.List;

public class StudentRepositoryImpl implements StudentRepository {
    static List<Student> studentList = new ArrayList<>();
    static {
        studentList.add(new Student(123,"Nguyen Van A","01/01/1990",1,8.0));
        studentList.add(new Student(124,"Nguyen Van B","09/05/1990",0,9.0));
        studentList.add(new Student(125,"Nguyen Van C","12/02/1990",1,4.0));
        studentList.add(new Student(126,"Nguyen Van D","17/03/1990",0,7.5));
    }

    @Override
    public List<Student> findAll() {
        return studentList;
    }

    @Override
    public Student findById(Integer id) {
        for(Student student : studentList){
            if(student.getId().equals(id)){
                return student;
            }
        }
        return null;
    }

    @Override
    public void updateStudent(Integer id, String name, String dateOfBirth) {
        for(Student student : studentList){
            if(student.getId().equals(id)){
                student.setName(name);
                student.setDateOfBirth(dateOfBirth);
            }
        }
    }
}
