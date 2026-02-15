<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Revenus - Atlas</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light p-5">
    <div class="container">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h2>💰 Journal des Revenus</h2>
            <a href="/admin/dashboard" class="btn btn-outline-secondary">Retour au Dashboard</a>
        </div>

        <div class="card shadow border-0 mb-4">
            <div class="card-body text-center py-5">
                <h4 class="text-muted">Total des encaissements</h4>
                <h1 class="display-4 fw-bold text-success">${totalGains} FCFA</h1>
            </div>
        </div>

        <div class="card shadow border-0">
            <div class="card-body">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>Date</th>
                            <th>Client</th>
                            <th>Salle</th>
                            <th>Montant</th>
                            <th>Statut</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="res" items="${reservations}">
                            <tr>
                                <td>${res.dateReservation}</td>
                                <td>${res.client.nom}</td>
                                <td>${res.salle.nom}</td>
                                <td class="fw-bold">${res.montantTotal} FCFA</td>
                                <td><span class="badge bg-success">PAYÉ</span></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>