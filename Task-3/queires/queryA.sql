WITH maxclients(credit, client) AS(
    SELECT DISTINCT typescredits.id, FIRST_VALUE(clients.fullname) OVER(PARTITION BY typescredits.id
        ORDER BY tariffs.sum DESC)
    FROM typescredits INNER JOIN tariffs
        ON typescredits.id = tariffs.type
    INNER JOIN issuedcredits
        ON tariffs.id = issuedcredits.tariff
    INNER JOIN clients
        ON issuedcredits.client = clients.id
)
SELECT typescredits.name, COUNT(issuedcredits.id), SUM(tariffs.sum), AVG(tariffs.sum), maxclients.client

FROM typescredits INNER JOIN tariffs
    ON typescredits.id = tariffs.type
INNER JOIN issuedcredits
    ON tariffs.id = issuedcredits.tariff
INNER JOIN maxclients
    ON maxclients.credit = typescredits.id

WHERE issuedcredits.date > ($(1)) AND issuedcredits.date < ($(2))
GROUP BY typescredits.id, maxclients.client
