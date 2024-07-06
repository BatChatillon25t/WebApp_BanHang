package com.example.demo.Repository;

import com.example.demo.Model.HoaDon;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Locale;
import java.util.stream.Collectors;

public interface HoaDonRepository extends JpaRepository<HoaDon,Integer> {
    List<HoaDon> findTop1ById(Integer id);

    HoaDon findAllById(Integer id);
    Page<HoaDon> findAllByOrderByNgayTaoDesc(Pageable pageable);
    List<HoaDon> findAllByTrangThaiOrderByNgayTaoDesc(String trangThai);

}
