SELECT products.name, COUNT(recipes.id)
FROM recipes INNER JOIN recipesproducts
    ON recipes.id = recipesproducts.idrecipe
RIGHT OUTER JOIN products
    ON recipesproducts.idproduct = products.id

GROUP BY products.id