<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Paiement Sécurisé - Atlas</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .momo-card { border: 2px solid #ffcc00; border-radius: 15px; }
        .flooz-card { border: 2px solid #0056b3; border-radius: 15px; }
    </style>
</head>
<body class="bg-light py-5">
    <div class="container">
        <div class="row justify-content-center text-center">
            <div class="col-md-5">
                <h4 class="mb-4">Finalisation du paiement</h4>
                <div class="card shadow border-0 p-4 mb-4">
                    <p class="text-muted mb-1">Montant à payer</p>
                    <h1 class="fw-bold text-success">${reservation.montantTotal} FCFA</h1>
                    <p class="small">Pour la salle : <strong>${reservation.salle.nom}</strong></p>
                </div>

                <form action="/reservations/finaliser" method="post">
                    <input type="hidden" name="salleId" value="${reservation.salle.id}">
                    <input type="hidden" name="date" value="${reservation.dateReservation}">
                    <input type="hidden" name="montant" value="${reservation.montantTotal}">

                    <div class="mb-3">
                        <label class="form-label d-block mb-3">Choisissez votre mode de paiement :</label>
                        <div class="row g-2">
                            <div class="col-6">
                                <input type="radio" class="btn-check" name="mode" id="momo" checked>
                                <label class="btn btn-outline-warning w-100 py-3 rounded-3" for="momo">MTN MoMo</label>
                            </div>
                            <div class="col-6">
                                <input type="radio" class="btn-check" name="mode" id="flooz">
                                <label class="btn btn-outline-primary w-100 py-3 rounded-3" for="flooz">Moov Money</label>
                            </div>
                        </div>
                    </div>

                    <div class="mb-4">
                        <input type="text" class="form-control form-control-lg text-center" placeholder="Numéro de téléphone" required>
                    </div>

                    <button type="submit" class="btn btn-dark btn-lg w-100 rounded-pill py-3 shadow">CONFIRMER LE PAIEMENT</button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>