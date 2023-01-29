SELECT recipes.name, SUM(products.unitprice * recipesproducts.numberproducts / recipes.numberpersons * $(1)) AS sum
FROM recipes INNER JOIN recipesproducts
    ON recipes.id = recipesproducts.idrecipe
INNER JOIN products
    ON recipesproducts.idproduct = products.id

GROUP BY recipes.id, recipes.name
