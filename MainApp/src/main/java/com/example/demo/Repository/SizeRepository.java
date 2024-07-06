package com.example.demo.Repository;

import com.example.demo.Model.Size;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface SizeRepository extends JpaRepository<Size,Integer> {
    List<Object> findAllById(Integer id);
}
