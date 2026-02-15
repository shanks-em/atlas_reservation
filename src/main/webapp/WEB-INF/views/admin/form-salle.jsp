<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Ajouter une Salle - Atlas</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light py-5">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card shadow-lg border-0 rounded-4">
                    <div class="card-body p-5">
                        <h3 class="fw-bold mb-4">Nouvelle Salle</h3>
                        <form action="/admin/salles/enregistrer" method="post">
                            <div class="mb-3">
                                <label class="form-label">Nom de la salle</label>
                                <input type="text" name="nom" class="form-control form-control-lg" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Localisation (Ville/Quartier)</label>
                                <input type="text" name="localisation" class="form-control" required>
                            </div>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Capacité (personnes)</label>
                                    <input type="number" name="capacite" class="form-control" required>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Prix par jour (FCFA)</label>
                                    <input type="number" step="0.01" name="prixJournalier" class="form-control" required>
                                </div>
                            </div>
                            <div class="mb-4">
                                <label class="form-label">URL de l'image</label>
                                <input type="url" name="imageUrl" class="form-control" placeholder="https://image.com/ma-salle.jpg">
                                <div class="form-text">Utilisez un lien direct vers une image web pour le test.</div>
                            </div>
                            <div class="d-grid gap-2">
                                <button type="submit" class="btn btn-primary btn-lg rounded-3">Enregistrer la salle</button>
                                <a href="/admin/dashboard" class="btn btn-link text-muted">Annuler</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>