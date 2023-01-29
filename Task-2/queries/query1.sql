SELECT categoriesdishes.name, recipes.name, AVG(SUM(products.unitprice * recipesproducts.numberproducts))
     OVER (PARTITION BY categoriesdishes.name)

    FROM categoriesdishes INNER JOIN recipes
        ON categoriesdishes.id = recipes.idcategory
    INNER JOIN recipesproducts
        ON recipes.id = recipesproducts.idrecipe
    INNER JOIN products
        ON recipesproducts.idproduct = products.id

    GROUP BY categoriesdishes.name, recipes.name

