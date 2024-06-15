package com.example.asm2.controller;

import com.example.asm2.entity.Company;
import com.example.asm2.entity.Recruitment;
import com.example.asm2.service.JobSearchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/search")
public class SearchController {
    @Autowired
    private JobSearchService jobSearchService;

    //Tìm kiếm theo thể loại công việc
    @RequestMapping("/searchByJob")
    public String searchByJob(Model model, @RequestParam("keySearch") String jobSearchKeywords) {
        List<Recruitment> recruitments = jobSearchService.getListRecruitment();
        List<Recruitment> list = new ArrayList<>();
        for (Recruitment recruitment : recruitments) {
            if (recruitment.getCategoryRe().getName().toLowerCase().contains(jobSearchKeywords.toLowerCase())) {
                list.add(recruitment);
            }
        }
        model.addAttribute("recruitments", list);
        model.addAttribute("keySearch", jobSearchKeywords);
        return "public/result-search";
    }

    //tìm kiếm theo địa chỉ
    @RequestMapping("/searchByAddress")
    public String searchByAddress(Model model, @RequestParam("keySearch") String addressSearchKeywords) {
        List<Recruitment> recruitments = jobSearchService.getListRecruitment();
        List<Recruitment> list = new ArrayList<>();
        for (Recruitment recruitment : recruitments) {
            if (recruitment.getAddress().toLowerCase().contains(addressSearchKeywords.toLowerCase())) {
                list.add(recruitment);
            }
        }
        model.addAttribute("recruitments", list);
        model.addAttribute("keySearch", addressSearchKeywords);
        return "public/result-search";
    }

    //tìm kiếm theo thên công ty
    @RequestMapping("/searchByCompany")
    public String searchByComapany(Model model, @RequestParam("keySearch") String companySearchKeywords) {
        List<Recruitment> recruitments = jobSearchService.getListRecruitment();
        List<Recruitment> list = new ArrayList<>();
        for (Recruitment recruitment : recruitments) {
            try {
                Company company = recruitment.getCompanyRe();
                if (company.getNameCompany().toLowerCase().contains(companySearchKeywords.toLowerCase())) {
                    list.add(recruitment);
                }
            } catch (Exception e) {

            }
        }
        model.addAttribute("recruitments", list);
        model.addAttribute("keySearch", companySearchKeywords);
        return "public/result-search";
    }
}
