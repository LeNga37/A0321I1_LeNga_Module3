package repository.impl;

import entity.Student;
import repository.DBConnection;
import repository.StudentRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class StudentRepositoryImpl implements StudentRepository {
    private static final String SELECT_ALL_STUDENT = "SELECT * FROM student_management.student";
    private static final String INSERT_PRODUCT = "INSERT INTO `student_management`.`student` (`name_student`, " +
            "`date_of_birth`, `gender`, `grade`) VALUES (?, ?, ?, ?);";

    @Override
    public List<Student> findAll() {
        List<Student> studentList = new ArrayList<>();
        Connection connection = DBConnection.getConnection();
        if (connection != null) {
            try {
                PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_STUDENT);
                ResultSet resultSet = preparedStatement.executeQuery();
                while (resultSet.next()){
                    int id = resultSet.getInt("id");
                    String name = resultSet.getString("name_student");
                    Date date = resultSet.getDate("date_of_birth");
                    int gender = resultSet.getInt("gender");
                    Double grade =resultSet.getDouble("grade");
                    studentList.add(new Student(id,name,date,gender,grade));
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }finally {
                try {
                    connection.close();
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
            }
        }
        return studentList;
    }

    @Override
    public Student findById(Integer id) {
        return null;
    }

    @Override
    public void updateStudent(Integer id, String name, String dateOfBirth, Integer gender, Double grade) {

    }
}

////    static List<Student> studentList = new ArrayList<>();
////    static {
////        studentList.add(new Student(123,"Nguyen Van A","01/01/1990",1,8.0));
////        studentList.add(new Student(124,"Nguyen Van B","09/05/1990",0,9.0));
////        studentList.add(new Student(125,"Nguyen Van C","12/02/1990",1,4.0));
////        studentList.add(new Student(126,"Nguyen Van D","17/03/1990",0,7.5));
////    }
//
//    @Override
//    public List<Student> findAll() {
////        return studentList;
//    }
//
//    @Override
//    public Student findById(Integer id) {
////        for(Student student : studentList){
////            if(student.getId().equals(id)){
////                return student;
////            }
////        }
////        return null;
//    }
//    @Override
//    public void updateStudent(Integer id, String name, String dateOfBirth,Integer gender, Double grade) {
//
////        for(Student student : studentList){
////            if(student.getId().equals(id)){
////                student.setName(name);
////                student.setDateOfBirth(dateOfBirth);
////                student.setGender(gender);
////                student.setGrade(grade);
////            }
////        }
////    }
//}
