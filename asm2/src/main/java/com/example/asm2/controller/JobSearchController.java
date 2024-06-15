package com.example.asm2.controller;

import com.example.asm2.entity.*;
import com.example.asm2.service.JobSearchService;
import org.apache.commons.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileInputStream;
import java.util.List;


@Controller
@RequestMapping("/auth")
public class JobSearchController {
    @Autowired
    private JobSearchService jobSearchService;

    //Hiển thị trang chủ
    @RequestMapping("/home")
    public String showHome(Model model) {
        jobSearchService.updateCategory();
        List<Category> categoryList = jobSearchService.getFourFeaturedCategories();
        model.addAttribute("categories", categoryList);
        List<Recruitment> recruitments = jobSearchService.getTenFeaturedRecruitment();
        model.addAttribute("recruitments", recruitments);
        List<Company> companies = jobSearchService.getFiveFeaturedCompany();
        model.addAttribute("companies", companies);
        return "public/home";
    }

    //Hiển trị trang đăng nhập
    @RequestMapping("/login")
    public String showLogin() {
        return "public/login";
    }

    //thực hiện đăng ký
    @RequestMapping("/register")
    public String register(Model theModel, @ModelAttribute User user,
                           @RequestParam("rePassword") String rePassword,
                           @RequestParam("roleName") String roleName) {
        try {
            if (user.getPassword().equals(rePassword)) {
                Role role = null;
                try {
                    role = jobSearchService.getRoleByName(roleName);
                } catch (Exception e) {
                    jobSearchService.saveOrUpdate(new Role(roleName));
                    role = jobSearchService.getRoleByName(roleName);
                }
                user.setRole(role);
                BCryptPasswordEncoder passBCry = new BCryptPasswordEncoder();
                String newPassword = passBCry.encode(user.getPassword());
                user.setPassword(newPassword);
                user.setStatus(1);
                jobSearchService.saveOrUpdate(user);
                theModel.addAttribute("message", "Đăng ký thành công");
            } else {
                theModel.addAttribute("message", "Mật khẩu trùng khớp");
            }
        } catch (Exception e) {
            theModel.addAttribute("message", "Email đã tồn tại");
        }
        return "redirect:/auth/login?success";
    }

    //thông tin chi tiết công ty
    @RequestMapping("/company")
    public String detailCompany(@RequestParam("idCompany") int idCompany, Model model) {
        Company company = jobSearchService.getCompanyByIdCompany(idCompany);
        if (company.getLogo() != null) {
            try {
                String path = "C:/image/logo/" + company.getLogo();
                File file = new File(path);
                FileInputStream fis = new FileInputStream(file);
                byte[] imageBytes = new byte[(int) file.length()];
                fis.read(imageBytes);
                fis.close();
                String logo = Base64.encodeBase64String(imageBytes);
                model.addAttribute("logoCompany", logo);
            } catch (Exception e) {

            }
        }
        model.addAttribute("company", company);
        return "public/detail-company";
    }

    //danh sách đăng tuyển của công ty
    @RequestMapping("/listOfCompanyPost")
    public String listOfCompanyPost(@RequestParam("idCompany") int idCompany, Model model) {
        List<Recruitment> recruitments = jobSearchService.getListRecruitmentByIdCompany(idCompany);
        model.addAttribute("recruitments", recruitments);
        return "public/post-company";
    }

    //cập nhật avatar cho user và hr
    @RequestMapping("/updateAvatar")
    public String updateAvatar(@RequestParam("email") String email, @RequestParam("avatar") MultipartFile avatar) {
        User user = jobSearchService.getUserByEmail(email);
        if (avatar != null) {
            File logoCurrent = new File("C:\\image\\avatar\\" + user.getImage());
            if (logoCurrent.exists()) {
                logoCurrent.delete();
            }
            File file = new File("C:\\image\\avatar\\");
            if (!file.exists()) {
                file.mkdirs();
            }
            String nameImage = "-" + user.getId() + "-" + avatar.getOriginalFilename();
            File logoNew = new File("C:\\image\\avatar\\" + nameImage);
            try {
                user.setImage(nameImage);
                avatar.transferTo(logoNew);
                jobSearchService.saveOrUpdate(user);
            } catch (Exception e) {
            }
        }
        return "redirect:/admin/editProfile";
    }

    //trang khi truy cập vào đường dẫn ngoài quyền
    @GetMapping("/access-denied")
    public String showAccessDenied() {
        return "access-denied";
    }

}
