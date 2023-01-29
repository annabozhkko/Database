WITH arrears(credit, date, sum) AS(
    SELECT i.id, p.date,
           (SELECT SUM(paymentschedule.sumloan) + SUM(paymentschedule.sumpercent)
            FROM paymentschedule INNER JOIN issuedcredits
                ON paymentschedule.credit = issuedcredits.id
            WHERE paymentschedule.date <= p.date
            AND issuedcredits.id = i.id) -

           (SELECT SUM(paymenthistory.sumloan) + SUM(paymenthistory.sumpercent)
            FROM paymenthistory INNER JOIN issuedcredits
                ON paymenthistory.credit = issuedcredits.id
            WHERE paymenthistory.date <= p.date
            AND issuedcredits.id = i.id)

    FROM issuedcredits i INNER JOIN paymentschedule p
        ON p.credit = i.id
)
-- для каждого кредита в каждый период какая просрочка

SELECT (SUM(paymenthistory.sumloan) + SUM(paymenthistory.sumpercent)) / SUM(paymentschedule.sumloan) AS profit,
        (CASE
        WHEN (SELECT MAX(sum) FROM arrears) > 0 THEN (SELECT MAX(sum) FROM arrears)
        ELSE 0
        END) as maxarrear

FROM issuedcredits INNER JOIN paymenthistory
    ON paymenthistory.credit = issuedcredits.id
INNER JOIN paymentschedule
    ON paymentschedule.credit = issuedcredits.id

WHERE issuedcredits.date > ($(1)) AND issuedcredits.date < ($(2))
AND paymenthistory.date < issuedcredits.maturitydate + interval '2 months'
