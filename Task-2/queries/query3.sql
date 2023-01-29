SELECT DISTINCT categoriesdishes.name AS categoryname, FIRST_VALUE(products.name)
    OVER (PARTITION BY categoriesdishes.name ORDER BY COUNT(products.id) DESC) AS product,
    COUNT(products.name) OVER (PARTITION BY categoriesdishes.name) AS count

    FROM categoriesdishes INNER JOIN recipes
        ON categoriesdishes.id = recipes.idcategory
    INNER JOIN recipesproducts
        ON recipes.id = recipesproducts.idrecipe
    INNER JOIN products
        ON recipesproducts.idproduct = products.id

    GROUP BY categoriesdishes.id, products.id
