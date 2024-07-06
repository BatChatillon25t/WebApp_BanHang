package com.example.demo.Controller;

import com.example.demo.Model.CTSP;
import com.example.demo.Model.HoaDon;
import com.example.demo.Model.HoaDonCT;
import com.example.demo.Repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;
@Controller
public class BanHangController {
    @Autowired
    HoaDonRepository hdr;
    @Autowired
    MauSacRepository mr;
    @Autowired
    HoaDonChiTietRepository hdctr;
    @Autowired
    CTSPRepository ctspr;
    @Autowired
    KhachHangRepository khr;
    Integer idHD;
    double tongTien;

    public BanHangController() {
        idHD = 0;
        tongTien = 0;

    }

    @RequestMapping("/ban-hang/view")
    public String view(Model model, @RequestParam(value = "id", defaultValue = "0") Integer id,
                       @RequestParam(value = "sdt", defaultValue = "a") String sdt)
                        {

   model.addAttribute("listhd", hdr.findAllByTrangThaiOrderByNgayTaoDesc("Pending"));
        model.addAttribute("listctsp", ctspr.findAll());
        model.addAttribute("listkh", khr.findTop1BySdtLike(sdt));
        model.addAttribute("listctsp", ctspr.findAll());
        idHD = id;
        //model.addAttribute("listtthd", hdr.findById(id));
        model.addAttribute("listtthd", hdr.findTop1ById(idHD));
        List<HoaDonCT> hdctList = hdctr.findByIdHoaDon_Id(id);
        model.addAttribute("listhdct", hdctList);
        double tongTienHoaDon = 0;
        for (HoaDon hd : hdr.findTop1ById(idHD)
        ) {
            for (HoaDonCT hdct : hdctr.findAll()
            ) {
                if (hd.getId().equals(hdct.getIdHoaDon().getId())) {
                    tongTienHoaDon += hdct.getTongTien();
                }
            }

        }
        model.addAttribute("tongTienHD", tongTienHoaDon);
        model.addAttribute("idHD",id);
        return "BanHang";
    }

    @PostMapping("/ban-hang/them-hd")
    public String themHD(@ModelAttribute("hd") HoaDon hoaDon, Model model) {
        if (hoaDon.getIdKhachHang() == null) {
            model.addAttribute("message", "vui long chon, tim khach hang de tao hoa don");
            model.addAttribute("listhd", hdr.findAll());
            model.addAttribute("listctsp", ctspr.findAll());
            return "BanHang";
        }
        hoaDon.setNgaySua(new Date());
        hoaDon.setNgayTao(new Date());
        hoaDon.setTrangThai("Pending");
        hdr.save(hoaDon);
        return "redirect:/ban-hang/view";
    }

    @GetMapping("/ban-hang/thanh-toan")
    public String thanhToan(@RequestParam("idHoaDon") Integer id) {
        HoaDon hd = hdr.findAllById(id);
        hd.setTrangThai("Completed");
        hd.setNgaySua(new Date());
        hdr.save(hd);
        return "redirect:/ban-hang/view";
    }

    @GetMapping("/ban-hang/them-sp")
    public String themSP(@RequestParam("idSPCT") Integer idSPCT, @RequestParam("soLuong") Integer soLuong,@RequestParam("idHD") Integer idHD) {
        HoaDonCT hoaDonChiTietTonTai = hdctr.findTop1ByIdCtsp_Id(idSPCT);
        CTSP ctsp = ctspr.findAllById(idSPCT);
        ctsp.setId(idSPCT);
        HoaDonCT hoaDonCT = new HoaDonCT();
        HoaDon hd = new HoaDon();
        hd.setId(idHD);
        boolean productExistsInCurrentOrder = false;
        for (HoaDonCT hdct : hdctr.findAll()) {
            if (hdct.getIdHoaDon().getId().equals(idHD) && hdct.getIdCtsp().getId().equals(idSPCT)) {
                productExistsInCurrentOrder = true;
                hoaDonChiTietTonTai = hdct;
                break;
            }
        }
        if (productExistsInCurrentOrder) {
            int soLuongMoi = hoaDonChiTietTonTai.getSoLuong() + soLuong;
            hoaDonChiTietTonTai.setSoLuong(soLuongMoi);
            hoaDonChiTietTonTai.setTongTien(hoaDonChiTietTonTai.getGiaBan() * soLuongMoi);
            ctsp.setSoLuongTon(ctsp.getSoLuongTon() - soLuong);
            hoaDonChiTietTonTai.setNgaySua(new Date());
            hdctr.save(hoaDonChiTietTonTai);

        } else {
            int soLuongMoi = soLuong;
            ctsp.setSoLuongTon(ctsp.getSoLuongTon() - soLuong);
            hoaDonCT.setIdHoaDon(hd);
            hoaDonCT.setGiaBan(ctsp.getGiaBan());
            hoaDonCT.setIdCtsp(ctsp);
            hoaDonCT.setSoLuong(soLuongMoi);
            hoaDonCT.setTrangThai("Active");
            hoaDonCT.setNgayTao(new Date());
            hoaDonCT.setNgaySua(new Date());
            hoaDonCT.setTongTien(hoaDonCT.getGiaBan() * hoaDonCT.getSoLuong());
            hdctr.save(hoaDonCT);
        }
        return "redirect:/ban-hang/view?id="+idHD ;
    }

    @GetMapping("/ban-hang/xoaSP")
    public String xoaSP(@RequestParam("idHDCT") Integer id) {
        HoaDon hd =hdr.findAllById(idHD);
        if (hd.getTrangThai().equals("Pending")){
            HoaDonCT hdct = hdctr.findAllById(id);
            int soLuongMoi = hdct.getSoLuong();
            CTSP ctsp = ctspr.findAllById(hdct.getIdCtsp().getId());
            ctsp.setSoLuongTon(ctsp.getSoLuongTon() + soLuongMoi);
            ctspr.save(ctsp);
            hdctr.deleteById(id);

        }
        return "redirect:/ban-hang/view";
    }

}
