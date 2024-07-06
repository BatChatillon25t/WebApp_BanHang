package com.example.demo.Model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Date;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name="danh_muc")
public class DanhMuc {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id")
    private Integer id;
    @Column(name="ma_danh_muc")
    private String maDanhMuc;
    @Column(name="ten_danh_muc")
    private String tenDanhMuc;
    @Column(name="trang_thai")
    private String trangThai;
    @Column(name="ngay_tao")
    private Date ngayTao;
    @Column(name="ngay_sua")
    private Date ngaySua;

}
