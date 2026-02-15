<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Atlas - Mon Espace</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
</head>
<body class="bg-light">
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark mb-4">
        <div class="container">
            <a class="navbar-brand fw-bold" href="#">ATLAS</a>
            <div class="ms-auto text-white me-3">Bonjour, ${sessionScope.user.nom}</div>
            <a href="/logout" class="btn btn-sm btn-outline-danger">Déconnexion</a>
        </div>
    </nav>

    <div class="container">
        <div class="row mb-5">
            <div class="col-12">
                <div class="p-5 bg-white shadow-sm rounded-4 text-center">
                    <h1 class="display-5 fw-bold text-dark">Trouvez la salle parfaite</h1>
                    <p class="lead text-muted">Réservez en quelques clics pour vos événements mémorables.</p>
                    <div class="mt-4">
                        <a href="/salles/catalogue" class="btn btn-primary btn-lg px-5 rounded-pill shadow">Découvrir les salles</a>
                        <a href="#mes-res" class="btn btn-outline-secondary btn-lg px-5 rounded-pill ms-2">Mes réservations</a>
                    </div>
                </div>
            </div>
        </div>

        <div id="mes-res" class="row">
            <div class="col-12">
                <h3 class="mb-4">Vos dernières réservations</h3>
                <div class="card border-0 shadow-sm rounded-4 overflow-hidden">
                    <table class="table table-hover mb-0">
                        <thead class="table-light">
                            <tr>
                                <th class="ps-4">Date</th>
                                <th>Salle</th>
                                <th>Montant</th>
                                <th>Statut</th>
                                <th class="text-end pe-4">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="res" items="${mesReservations}">
                                <tr>
                                    <td class="ps-4">${res.dateReservation}</td>
                                    <td class="fw-bold">${res.salle.nom}</td>
                                    <td>${res.montantTotal} FCFA</td>
                                    <td>
                                        <span class="badge ${res.statutPaiement == 'PAYE' ? 'bg-success' : 'bg-warning'} rounded-pill">
                                            ${res.statutPaiement}
                                        </span>
                                    </td>
                                    <td class="text-end pe-4">
                                        <button class="btn btn-sm btn-light">Détails</button>
                                    </td>
                                </tr>
                            </c:forEach>
                            <c:if test="${empty mesReservations}">
                                <tr>
                                    <td colspan="5" class="text-center py-5 text-muted small">Aucune réservation trouvée.</td>
                                </tr>
                            </c:if>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</body>
</html>