package com.example.demo.Repository;

import com.example.demo.Model.SanPham;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface SanPhamRepository extends JpaRepository<SanPham,Integer> {
    List<SanPham> findAllByOrderByNgayTaoDesc();

    SanPham findAllById(Integer id);
}
