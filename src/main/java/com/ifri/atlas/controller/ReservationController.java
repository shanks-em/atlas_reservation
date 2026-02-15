package com.ifri.atlas.controller;

import com.ifri.atlas.model.*;
import com.ifri.atlas.repository.*;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;

@Controller
@RequestMapping("/reservations")
public class ReservationController {

    @Autowired private ReservationRepository resRepo;
    @Autowired private SalleRepository salleRepo;

    
    @GetMapping("/nouvelle")
    public String nouvelleReservation(@RequestParam Long salleId, Model model, HttpSession session) {
        Utilisateur user = (Utilisateur) session.getAttribute("user");
        if (user == null) return "redirect:/login";

        Salle salle = salleRepo.findById(salleId).orElse(null);
        model.addAttribute("salle", salle);
        return "client/form-reservation";
    }

  
    @PostMapping("/preparer")
    public String preparerPaiement(@RequestParam Long salleId, 
                                   @RequestParam String date, 
                                   Model model) {
        Salle salle = salleRepo.findById(salleId).orElse(null);
        
        
        Reservation tempRes = new Reservation();
        tempRes.setSalle(salle);
        tempRes.setDateReservation(LocalDate.parse(date));
        tempRes.setMontantTotal(salle.getPrixJournalier()); 
        
        model.addAttribute("reservation", tempRes);
        return "client/page-paiement";
    }

 
    @PostMapping("/finaliser")
    public String finaliser(@RequestParam Long salleId, 
                            @RequestParam String date,
                            @RequestParam Double montant,
                            HttpSession session) {
        Utilisateur user = (Utilisateur) session.getAttribute("user");
        Salle salle = salleRepo.findById(salleId).orElse(null);

        Reservation res = new Reservation();
        res.setClient(user);
        res.setSalle(salle);
        res.setDateReservation(LocalDate.parse(date));
        res.setMontantTotal(montant);
        res.setStatutPaiement("PAYE"); // Simulé

        resRepo.save(res);
        return "redirect:/client/dashboard";
    }
}