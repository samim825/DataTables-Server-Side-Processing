package com.example.crud.service.impl;

import com.example.crud.model.Student;
import com.example.crud.repository.StudentRepository;
import com.example.crud.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
@Service
public class StudentServiceImpl implements StudentService {

    @Autowired
    StudentRepository studentRepository;

    @Override
    public Student save(Student student) {
        return studentRepository.save(student);
    }

    @Override
    public Optional<Student> findById(Integer id) {
        return studentRepository.findById(id);
    }

    @Override
    public void deleteById(Integer id) {
        studentRepository.deleteById(id);
    }

    @Override
    public Page<Student> findAll(Pageable pageable) {
        return  studentRepository.findAll(pageable);
    }

    @Override
    public Page<Student> searchStudents(String search, Pageable pageable) {
        return studentRepository.searchBy(search, pageable);
    }

    @Override
    public Boolean isExistsByEmail(String email) {
        return studentRepository.existsByEmail(email);
    }
}
