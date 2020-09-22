show databases;
use gest_comm;

SELECT NOM, PRENOM, REND_COMPTE FROM EMPLOYES WHERE REND_COMPTE = 18;
SELECT NOM, PRENOM, SALAIRE FROM EMPLOYES WHERE REND_COMPTE IS NULL;
SELECT NOM, PRENOM, SALAIRE FROM EMPLOYES WHERE SALAIRE > 13000;
SELECT NOM_PRODUIT, NO_FOURNISSEUR FROM PRODUITS WHERE NO_FOURNISSEUR <= 2;
SELECT NOM, PRENOM, FONCTION FROM EMPLOYES WHERE FONCTION <>'Représentant(e)' ;
SELECT NOM, PRENOM, FONCTION FROM EMPLOYES WHERE FONCTION != 'Représentant(e)' ;
SELECT NOM_PRODUIT, QUANTITE FROM PRODUITS WHERE QUANTITE LIKE '%boîtes%kg%' ;
SELECT NOM_PRODUIT, QUANTITE FROM PRODUITS WHERE QUANTITE LIKE '___%pièces' ;
SELECT NOM_PRODUIT, QUANTITE FROM PRODUITS WHERE QUANTITE LIKE '___pièces' ;
CREATE TABLE PRODUITS_LIKE(NOM_PRODUIT STRING, QUANTITE STRING);
INSERT INTO PRODUITS_LIKE VALUES
  ("Fruit Cocktail","430_g"),
  ("Chocolate Biscuits Mix","10 boîtes_de_12_pièces"),
  ("Marmalade","30 boîtes%cadeau"),
  ("Scones","24 paquets de 4_pièces");
SELECT NOM_PRODUIT, QUANTITE FROM PRODUITS_LIKE   WHERE QUANTITE LIKE '%/%%' ESCAPE '/'
SELECT NOM_PRODUIT, QUANTITE FROM PRODUITS_LIKE   WHERE QUANTITE LIKE '%#_%' ESCAPE '#'
SELECT QUANTITE FROM PRODUITS WHERE RLIKE (QUANTITE,'^(10).*(pièces)$');
SELECT QUANTITE FROM PRODUITS WHERE RLIKE (QUANTITE,'^2.*(carton|pièces|bouteilles)');
SELECT QUANTITE FROM PRODUITS WHERE RLIKE (QUANTITE,'^[^1-3]');
SELECT QUANTITE FROM PRODUITS WHERE RLIKE(QUANTITE,"^\\d{2,3}\\s\\w{3,6}\\s[\\(]\\d{1,3}\\s\\w?(g[\\)])$");
SELECT NOM_PRODUIT, NO_FOURNISSEUR FROM PRODUITS  WHERE NO_FOURNISSEUR BETWEEN 2 AND 3;
SELECT NOM_PRODUIT, NO_FOURNISSEUR FROM PRODUITS  WHERE NO_FOURNISSEUR IN (1,3,6,8);
SELECT VILLE FROM VILLES WHERE VILLE IN ('Paris','Strasbourg','Toulouse') ;
SELECT NOM, FONCTION, SALAIRE FROM EMPLOYES WHERE SALAIRE > 2500 AND NOT FONCTION LIKE 'Rep%';
SELECT NOM, FONCTION, SALAIRE FROM EMPLOYES WHERE SALAIRE > 2500 AND FONCTION NOT LIKE 'Rep%';
SELECT NOM,PRENOM, TITRE  FROM EMPLOYES WHERE TITRE NOT IN ('M.','Mme');

SELECT NOM_PRODUIT, QUANTITE,NO_FOURNISSEUR,CODE_CATEGORIE
FROM PRODUITS
WHERE QUANTITE LIKE '%boîtes%'
      AND  NO_FOURNISSEUR BETWEEN 2 AND 6
      AND  CODE_CATEGORIE = 2;

SELECT NOM_PRODUIT, QUANTITE,NO_FOURNISSEUR,CODE_CATEGORIE
FROM PRODUITS
WHERE QUANTITE LIKE '%boîtes%'
      AND  ( NO_FOURNISSEUR BETWEEN 2 AND 6
             OR   CODE_CATEGORIE = 2 ) ;
