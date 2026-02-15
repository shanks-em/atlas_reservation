<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Atlas - Gestion Utilisateurs</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
    <style>
        .sidebar { background: #1a1d20; min-height: 100vh; color: white; position: fixed; width: 240px; }
        .main-content { margin-left: 240px; padding: 30px; }
        .user-card { border: none; border-radius: 12px; box-shadow: 0 4px 10px rgba(0,0,0,0.05); }
    </style>
</head>
<body class="bg-light">

    <div class="sidebar p-3">
        <h3 class="text-center py-4 fw-bold text-primary">ATLAS</h3>
        <nav class="nav flex-column">
            <a class="nav-link text-white-50" href="/admin/dashboard"><i class="bi bi-grid-1x2 me-2"></i> Dashboard</a>
            <a class="nav-link text-white bg-primary rounded" href="/admin/utilisateurs"><i class="bi bi-people me-2"></i> Utilisateurs</a>
            <a class="nav-link text-danger mt-5" href="/logout"><i class="bi bi-box-arrow-left me-2"></i> Déconnexion</a>
        </nav>
    </div>

    <div class="main-content">
        <h2 class="fw-bold mb-4">Gestion des Utilisateurs</h2>

        <div class="card user-card shadow-sm">
            <div class="card-body p-0">
                <table class="table table-hover align-middle mb-0">
                    <thead class="table-light">
                        <tr>
                            <th class="ps-4">Nom & Prénoms</th>
                            <th>Email</th>
                            <th>Téléphone</th>
                            <th>Rôle</th>
                            <th class="text-end pe-4">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="u" items="${utilisateurs}">
                            <tr>
                                <td class="ps-4 fw-bold">${u.nom}</td>
                                <td>${u.email}</td>
                                <td>${u.telephone}</td>
                                <td>
                                    <span class="badge ${u.role == 'ADMIN' ? 'bg-danger' : 'bg-info text-dark'}">
                                        ${u.role}
                                    </span>
                                </td>
                                <td class="text-end pe-4">
                                    <a href="/admin/utilisateurs/changer-role/${u.id}" 
                                       class="btn btn-sm btn-outline-secondary">
                                        Changer Rôle
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