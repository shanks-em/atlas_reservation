<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Catalogue des Salles - Atlas</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .card-img-top {
            height: 200px;
            object-fit: cover; /* Pour que l'image remplisse le cadre sans se déformer */
            border-bottom: 1px solid #eee;
        }
        .salle-card {
            transition: all 0.3s ease;
            border: none;
            border-radius: 15px;
        }
        .salle-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 30px rgba(0,0,0,0.1) !important;
        }
        .price-badge {
            position: absolute;
            top: 15px;
            right: 15px;
            background: rgba(255, 255, 255, 0.9);
            padding: 5px 15px;
            border-radius: 20px;
            font-weight: bold;
            color: #2c3e50;
        }
    </style>
</head>
<body class="bg-light">
    <nav class="navbar navbar-dark bg-dark mb-5">
        <div class="container">
            <a class="navbar-brand" href="/client/dashboard">← Retour</a>
            <span class="navbar-text text-white">Nos Salles Disponibles</span>
        </div>
    </nav>

    <div class="container">
        <div class="row row-cols-1 row-cols-md-3 g-4">
            <c:forEach var="salle" items="${salles}">
                <div class="col">
                    <div class="card h-100 shadow-sm salle-card position-relative">
                        <div class="price-badge">${salle.prixJournalier} FCFA / jour</div>
                        
                        <img src="${empty salle.imageUrl ? 'https://via.placeholder.com/400x250?text=Image+indisponible' : salle.imageUrl}" 
                             class="card-img-top rounded-top-4" alt="${salle.nom}">
                        
                        <div class="card-body">
                            <h5 class="card-title fw-bold">${salle.nom}</h5>
                            <p class="card-text text-muted small">
                                <i class="bi bi-geo-alt"></i> ${salle.localisation}<br>
                                <i class="bi bi-people"></i> Capacité : ${salle.capacite} personnes
                            </p>
                        </div>
                        <div class="card-footer bg-transparent border-0 pb-3">
                            <a href="/reservations/nouvelle?salleId=${salle.id}" 
                               class="btn btn-primary w-100 rounded-pill">Réserver maintenant</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</body>
</html>