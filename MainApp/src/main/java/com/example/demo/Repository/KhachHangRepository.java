package com.example.demo.Repository;

import com.example.demo.Model.KhachHang;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface KhachHangRepository extends JpaRepository<KhachHang,Integer> {
    List<KhachHang> findTop1BySdtLike(String sdt);

}
