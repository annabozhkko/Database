SELECT date_part('year', paymenthistory.date) AS year, date_part('month', paymenthistory.date) AS month,
       date_part('day', paymenthistory.date) AS day, COUNT(*), SUM(paymenthistory.sumloan) + SUM(paymenthistory.sumpercent) AS sum
FROM issuedcredits INNER JOIN paymenthistory
    ON paymenthistory.credit = issuedcredits.id

GROUP BY
ROLLUP(date_part('year', paymenthistory.date), date_part('month', paymenthistory.date),
         date_part('day', paymenthistory.date))
ORDER BY date_part('year', paymenthistory.date), date_part('month', paymenthistory.date),
         date_part('day', paymenthistory.date)