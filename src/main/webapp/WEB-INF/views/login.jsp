<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Atlas - Connexion</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #1e3c72 0%, #2a5298 100%);
            height: 100vh;
            display: flex;
            align-items: center;
        }
        .login-card {
            border: none;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.2);
        }
        .btn-login {
            background: #1e3c72;
            border: none;
            border-radius: 10px;
            padding: 12px;
            font-weight: bold;
        }
        .btn-login:hover { background: #2a5298; }
    </style>
</head>
<body>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-4">
                <div class="card login-card p-4">
                    <div class="card-body">
                        <h2 class="text-center fw-bold mb-4" style="color: #1e3c72;">ATLAS</h2>
                        <p class="text-center text-muted mb-4">Gestion de Salles de Fête</p>
                        
                        <c:if test="${not empty error}">
                            <div class="alert alert-danger small text-center">${error}</div>
                        </c:if>

                        <form action="/login" method="post">
                            <div class="mb-3">
                                <label class="form-label small fw-bold">Email</label>
                                <input type="email" name="email" class="form-control form-control-lg" placeholder="admin@atlas.com" required>
                            </div>
                            <div class="mb-4">
                                <label class="form-label small fw-bold">Mot de passe</label>
                                <input type="password" name="password" class="form-control form-control-lg" placeholder="••••••••" required>
                            </div>
                            <div class="d-grid">
                                <button type="submit" class="btn btn-primary btn-login">SE CONNECTER</button>
								<p class="text-center mt-3">
								    Nouveau sur Atlas ? <a href="/register" class="text-decoration-none text-primary">Créer un compte</a>
								</p>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>