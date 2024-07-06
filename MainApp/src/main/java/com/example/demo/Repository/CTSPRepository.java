package com.example.demo.Repository;

import com.example.demo.Model.CTSP;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CTSPRepository extends JpaRepository<CTSP, Integer> {
    CTSP findAllById(Integer id);

    List<CTSP> findAllByTrangThaiLike(String trangThai);
}
