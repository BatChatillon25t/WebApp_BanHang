package com.example.demo.Controller;

import com.example.demo.Model.CTSP;
import com.example.demo.Repository.CTSPRepository;
import com.example.demo.Repository.MauSacRepository;
import com.example.demo.Repository.SanPhamRepository;
import com.example.demo.Repository.SizeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Date;
@Controller
public class CTSPController {
    @Autowired
    CTSPRepository ctspr;
    @Autowired
    SanPhamRepository spr;
    @Autowired
    SizeRepository sizer;
    @Autowired
    MauSacRepository mr;

    @RequestMapping("/ctsp/view")
    public String page(@RequestParam(value = "pageNo", defaultValue = "0") Integer pageNo, Model model, @RequestParam(value = "id_size", defaultValue = "0") Integer id) {
        Pageable pageable = PageRequest.of(pageNo, 2);
        Page<CTSP> page = ctspr.findAll(pageable);
        model.addAttribute("page", page);
        model.addAttribute("currentPage", pageNo);
        model.addAttribute("listctsp", ctspr.findAll());
        model.addAttribute("listsp", spr.findAll());
        model.addAttribute("listsize", sizer.findAll());
        model.addAttribute("listmau", mr.findAll());
        model.addAttribute("test", sizer.findAllById(id));
        return "CTSP";
    }

    @PostMapping("/ctsp/add")
    public String add(@ModelAttribute("ctsp") CTSP ctsp, RedirectAttributes redirectAttributes) {
        ctsp.setNgaySua(new Date());
        ctsp.setNgayTao(new Date());
        ctspr.save(ctsp);
        redirectAttributes.addFlashAttribute("message", "Thêm thành công");
        return "redirect:/ctsp/view";
    }

    @GetMapping("/ctsp/delete")
    public String delete(@RequestParam("id") Integer id) {
        ctspr.deleteById(id);
        return "redirect:/ctsp/view";
    }
}
