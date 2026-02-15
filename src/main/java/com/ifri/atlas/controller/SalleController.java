package com.ifri.atlas.controller;

import com.ifri.atlas.repository.SalleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SalleController {

    @Autowired
    private SalleRepository salleRepo;

    @GetMapping("/salles/catalogue")
    public String afficherCatalogue(Model model) {
        model.addAttribute("salles", salleRepo.findAll());
        return "client/catalogue";
    }
}