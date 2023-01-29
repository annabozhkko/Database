SELECT recipes.name
FROM recipes INNER JOIN recipesproducts
    ON recipes.id = recipesproducts.idrecipe

GROUP BY recipes.name
HAVING COUNT(*) >= 3