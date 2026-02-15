package com.ifri.atlas.repository;

import com.ifri.atlas.model.Salle;
import org.springframework.data.jpa.repository.JpaRepository;

public interface SalleRepository extends JpaRepository<Salle, Long> {
}