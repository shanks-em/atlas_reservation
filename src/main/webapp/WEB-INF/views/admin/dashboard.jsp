<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Atlas Admin - Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
    <style>
        .sidebar { background: #1a1d20; min-height: 100vh; color: white; position: fixed; width: 240px; }
        .main-content { margin-left: 240px; padding: 30px; }
        .card-custom { border: none; border-radius: 15px; box-shadow: 0 4px 12px rgba(0,0,0,0.05); }
        .btn-add { border-radius: 10px; padding: 10px 20px; }
    </style>
</head>
<body class="bg-light">

    <div class="sidebar p-3">
        <h3 class="text-center py-4 fw-bold text-primary">ATLAS</h3>
        <hr>
        <nav class="nav flex-column">
            <a class="nav-link text-white bg-primary rounded mb-2" href="/admin/dashboard"><i class="bi bi-grid-1x2 me-2"></i> Dashboard</a>
            <a class="nav-link text-white-50" href="/admin/utilisateurs"><i class="bi bi-people me-2"></i> Utilisateurs</a>
            <a class="nav-link text-white-50" href="/admin/revenus"><i class="bi bi-wallet2 me-2"></i> Revenus</a>
            <a class="nav-link text-danger mt-5" href="/logout"><i class="bi bi-box-arrow-left me-2"></i> Déconnexion</a>
        </nav>
    </div>

    <div class="main-content">
        <div class="d-flex justify-content-between align-items-center mb-5">
            <div>
                <h2 class="fw-bold mb-0">Gestion des Salles</h2>
                <p class="text-muted">Consultez et gérez le parc de salles Atlas</p>
            </div>
            <a href="/admin/salles/nouvelle" class="btn btn-primary btn-add"><i class="bi bi-plus-lg me-2"></i> Ajouter une salle</a>
        </div>

        <div class="row mb-5">
            <div class="col-md-4">
                <div class="card card-custom p-4 bg-white">
                    <h6 class="text-muted small text-uppercase">Total Salles</h6>
                    <h2 class="fw-bold text-dark">${totalSalles}</h2>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card card-custom p-4 bg-white border-start border-success border-4">
                    <h6 class="text-muted small text-uppercase">Réservations Actives</h6>
                    <h2 class="fw-bold text-dark">${totalReservations}</h2>
                </div>
            </div>
        </div>

        <div class="card card-custom shadow-sm">
            <div class="card-body p-0">
                <table class="table table-hover mb-0">
                    <thead class="table-light">
                        <tr>
                            <th class="ps-4">Image</th>
                            <th>Nom de la salle</th>
                            <th>Localisation</th>
                            <th>Capacité</th>
                            <th>Prix/Jour</th>
                            <th class="text-end pe-4">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="s" items="${salles}">
                            <tr class="align-middle">
                                <td class="ps-4">
                                    <img src="${s.imageUrl}" class="rounded" width="60" height="40" style="object-fit: cover;">
                                </td>
                                <td class="fw-bold">${s.nom}</td>
                                <td>${s.localisation}</td>
                                <td><span class="badge bg-light text-dark">${s.capacite} pers.</span></td>
                                <td class="text-primary fw-bold">${s.prixJournalier} FCFA</td>
                                <td class="text-end pe-4">
                                    <a href="/admin/salles/supprimer/${s.id}" class="btn btn-sm btn-outline-danger border-0" onclick="return confirm('Supprimer cette salle ?')">
                                        <i class="bi bi-trash fs-5"></i>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>