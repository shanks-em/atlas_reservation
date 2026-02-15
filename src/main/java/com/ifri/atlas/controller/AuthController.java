package com.ifri.atlas.controller;

import com.ifri.atlas.model.Utilisateur;
import com.ifri.atlas.repository.UtilisateurRepository;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class AuthController {

    @Autowired
    private UtilisateurRepository utilisateurRepository;
    @Autowired private UtilisateurRepository utilisateurRepo;

	 
	@GetMapping("/register")
	public String showRegisterPage() {
	    return "register";
	}
	
	
	@PostMapping("/register")
	public String registerUser(@ModelAttribute Utilisateur user, Model model) {
	     
	    if (utilisateurRepo.findByEmail(user.getEmail()) != null) {
	        model.addAttribute("error", "Cet email est déjà utilisé.");
	        return "register";
	    }
	     
	    
	    user.setRole("CLIENT");
	    utilisateurRepo.save(user);
	     
	    return "redirect:/login?success";
	}

    @GetMapping("/login")
    public String showLogin() {
        return "login";
    }

    @PostMapping("/login")
    public String processLogin(@RequestParam String email, 
                               @RequestParam String password, 
                               HttpSession session, 
                               Model model) {
        Utilisateur user = utilisateurRepository.findByEmail(email);
        
        if (user != null && user.getMotDePasse() != null && user.getMotDePasse().equals(password)) {
            session.setAttribute("user", user);
            if ("ADMIN".equals(user.getRole())) {
                return "redirect:/admin/dashboard";
            }
            return "redirect:/client/dashboard";
        }
        
        model.addAttribute("error", "Email ou mot de passe invalide");
        return "login";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login";
    }
}