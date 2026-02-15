
# Projet Atlas - Gestion de Réservation de Salles

## Configuration de la Base de Données
1. Assurez-vous d'avoir PostgreSQL installé.
2. Créez la base de données :
   `CREATE DATABASE atlas_db;`
3. Importez le schéma et les données :
```bash
psql -U postgres -d atlas_db -f db/atlas_db_backup.sql
```

## Configuration de l'Application
- Modifiez `src/main/resources/application.properties` pour ajuster :
  - `spring.datasource.username`
  - `spring.datasource.password`

## Lancement
Exécutez la commande suivante à la racine :
```bash
mvn spring-boot:run
```

## Affichage
Rendez vous ensuite dans votre navigateur puis 
```bash
http://localhost/8080/login
```

Entre deux modification du code, avant de compiler faites un 
```bash
fuser -k 8080/tcp
```
afin de libérer le port de la précédente compilation.

## Accès 
### Admin
```bash
mail : admin@atlas.com
pass : 1234
```

### Client 
```bash
mail : jeandalle@gmail.com
pass : 1234
```

Vous pouvez tout aussi bien créer un compte utilisateur en vous inscrivant via la page d'inscription
