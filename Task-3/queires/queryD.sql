WITH payments(credit, date, schedulesum, sum) AS (
    SELECT i.id, p.date, p.sumloan + p.sumpercent,
           (SELECT SUM(paymenthistory.sumpercent) + SUM(paymenthistory.sumloan)
            FROM paymenthistory INNER JOIN issuedcredits
                ON paymenthistory.credit = issuedcredits.id
            WHERE paymenthistory.date <= p.date AND paymenthistory.date > p.date - interval '1 month'
            AND issuedcredits.id = i.id)

    FROM issuedcredits i INNER JOIN paymentschedule p ON i.id = p.credit
)

SELECT COUNT(DISTINCT arrears.credit) * 100 / (SELECT COUNT(*) FROM issuedcredits) AS percentcount,
      SUM(arrears.periodsum) * 100 / SUM(arrears.schedulesum) AS percentsum
FROM (
    SELECT payments.credit, payments.date, SUM(payments.schedulesum) OVER (PARTITION BY payments.credit ORDER BY payments.date) -
    SUM(CASE WHEN payments.sum IS NULL THEN 0 ELSE payments.sum END) OVER (PARTITION BY payments.credit ORDER BY payments.date) AS allsum,
    payments.schedulesum - payments.sum AS periodsum,
    payments.schedulesum as schedulesum
    FROM payments) AS arrears INNER JOIN issuedcredits
        ON arrears.credit = issuedcredits.id
WHERE issuedcredits.maturitydate > ($(1)) AND issuedcredits.maturitydate < ($(2))
AND arrears.allsum > 0;
