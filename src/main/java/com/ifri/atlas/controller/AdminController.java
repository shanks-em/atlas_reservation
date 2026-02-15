package com.ifri.atlas.controller;

import com.ifri.atlas.model.Salle;
import com.ifri.atlas.model.Utilisateur;
import com.ifri.atlas.repository.ReservationRepository;
import com.ifri.atlas.repository.SalleRepository;
import com.ifri.atlas.repository.UtilisateurRepository;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired private SalleRepository salleRepo;
    @Autowired private ReservationRepository resRepo;
    @Autowired private UtilisateurRepository utilisateurRepo;


	@GetMapping("/utilisateurs")
	public String listeUtilisateurs(HttpSession session, Model model) {
        Utilisateur current = (Utilisateur) session.getAttribute("user");
        if (current == null || !"ADMIN".equals(current.getRole())) return "redirect:/login";
	
        model.addAttribute("utilisateurs", utilisateurRepo.findAll());
        return "admin/liste-utilisateurs";
    }
	
	
	@GetMapping("/utilisateurs/changer-role/{id}")
	public String changerRole(@PathVariable Long id) {
        Utilisateur user = utilisateurRepo.findById(id).orElse(null);
        if (user != null) {
	         
            user.setRole("ADMIN".equals(user.getRole()) ? "CLIENT" : "ADMIN");
            utilisateurRepo.save(user);
        }
	    return "redirect:/admin/utilisateurs";
	}
   
    @GetMapping("/dashboard")
    public String dashboard(HttpSession session, Model model) {
        Utilisateur user = (Utilisateur) session.getAttribute("user");
        if (user == null || !"ADMIN".equals(user.getRole())) return "redirect:/login";

        model.addAttribute("totalSalles", salleRepo.count());
        model.addAttribute("totalReservations", resRepo.count());
        model.addAttribute("salles", salleRepo.findAll());
        return "admin/dashboard";
    }

    
    @GetMapping("/salles/nouvelle")
    public String formulaireSalle() {
        return "admin/form-salle";
    }

    
    @PostMapping("/salles/enregistrer")
    public String enregistrerSalle(@ModelAttribute Salle salle) {
        salleRepo.save(salle);
        return "redirect:/admin/dashboard";
    }
    
    @GetMapping("/revenus")
    public String afficherRevenus(HttpSession session, Model model) {
        Utilisateur current = (Utilisateur) session.getAttribute("user");
        if (current == null || !"ADMIN".equals(current.getRole())) return "redirect:/login";

       
        java.util.List<com.ifri.atlas.model.Reservation> reservations = resRepo.findAll();
        
       
        double totalGains = reservations.stream()
                                        .mapToDouble(r -> r.getMontantTotal())
                                        .sum();

        model.addAttribute("reservations", reservations);
        model.addAttribute("totalGains", totalGains);
        
        return "admin/revenus";
    }

  
    @GetMapping("/salles/supprimer/{id}")
    public String supprimerSalle(@PathVariable Long id) {
        salleRepo.deleteById(id);
        return "redirect:/admin/dashboard";
    }
}

