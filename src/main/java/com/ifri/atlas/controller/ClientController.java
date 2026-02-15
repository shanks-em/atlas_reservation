package com.ifri.atlas.controller;

import com.ifri.atlas.model.Utilisateur;
import com.ifri.atlas.repository.ReservationRepository;
import com.ifri.atlas.repository.SalleRepository;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/client")
public class ClientController {

    @Autowired private SalleRepository salleRepo;
    @Autowired private ReservationRepository resRepo;

    @GetMapping("/dashboard")
    public String dashboard(HttpSession session, Model model) {
        Utilisateur user = (Utilisateur) session.getAttribute("user");
        if (user == null) return "redirect:/login";

        model.addAttribute("salles", salleRepo.findAll());
        model.addAttribute("mesReservations", resRepo.findByClientId(user.getId()));
        return "client/dashboard";
    }
}