<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Réserver ${salle.nom}</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container py-5">
        <div class="row justify-content-center">
            <div class="col-md-8 col-lg-6">
                <div class="card border-0 shadow-lg rounded-4 overflow-hidden">
                    <img src="${salle.imageUrl}" class="card-img-top" style="height: 200px; object-fit: cover;">
                    <div class="card-body p-4">
                        <h2 class="fw-bold text-dark">${salle.nom}</h2>
                        <p class="text-muted"><i class="bi bi-geo-alt"></i> ${salle.localisation}</p>
                        <hr>
                        <form action="/reservations/preparer" method="post">
                            <input type="hidden" name="salleId" value="${salle.id}">
                            
                            <div class="mb-4">
                                <label class="form-label fw-bold">Choisir la date de l'événement</label>
                                <input type="date" name="date" class="form-control form-control-lg" required 
                                       min="<%= java.time.LocalDate.now() %>">
                            </div>

                            <div class="bg-light p-3 rounded-3 mb-4">
                                <div class="d-flex justify-content-between">
                                    <span>Prix de la location :</span>
                                    <span class="fw-bold text-primary">${salle.prixJournalier} FCFA</span>
                                </div>
                            </div>

                            <div class="d-grid">
                                <button type="submit" class="btn btn-primary btn-lg rounded-pill">Continuer vers le paiement</button>
                                <a href="/client/dashboard" class="btn btn-link text-muted mt-2">Annuler</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>