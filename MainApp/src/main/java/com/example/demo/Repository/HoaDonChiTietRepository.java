package com.example.demo.Repository;

import com.example.demo.Model.HoaDonCT;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface HoaDonChiTietRepository extends JpaRepository<HoaDonCT,Integer> {
    List<HoaDonCT> findByIdHoaDon_Id(Integer idHoaDon);
    HoaDonCT findTop1ByIdCtsp_Id(Integer idCTSP);

    HoaDonCT findAllById(Integer id);
}
