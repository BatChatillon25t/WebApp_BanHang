package com.example.demo.Controller;

import com.example.demo.Model.KhachHang;
import com.example.demo.Model.SanPham;
import com.example.demo.Repository.KhachHangRepository;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.Date;

@Controller
public class KhachHangController {
    @Autowired
    KhachHangRepository repo;
    @GetMapping("/kh/hien-thi")
    public String hienThi(Model model){
        model.addAttribute("dm", repo.findAll());
        return "KH";
    }
    @PostMapping("/kh/add")
    public String addms(@ModelAttribute KhachHang kh){
        kh.setNgayTao(new Date());
        kh.setNgaySua(new Date());
        repo.save(kh);
        return "redirect:/kh/hien-thi";

    }
    //Xoa
    @GetMapping("/delete")
    public String delms(HttpServletRequest request){
        Integer id = Integer.valueOf(request.getParameter("id"));
        repo.deleteById(id);

        return "redirect:/kh/hien-thi";
    }
    //Chi tiet
    @GetMapping("/detail")
    public String detailms(HttpServletRequest request, Model model){
        Integer id = Integer.valueOf(request.getParameter("id"));
        model.addAttribute("up", repo.findById(id).get());
        return "khdetail";
    }
    //Update
    @PostMapping("/update")
    public String updatems(@ModelAttribute KhachHang kh){
        kh.setNgaySua(new Date());
        repo.save(kh);

        return "redirect:/kh/hien-thi";
    }
}
