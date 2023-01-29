SELECT (SUM(paymenthistory.sumloan) + SUM(paymenthistory.sumpercent)) / SUM(paymentschedule.sumloan) AS profit
FROM issuedcredits INNER JOIN paymenthistory
    ON paymenthistory.credit = issuedcredits.id
INNER JOIN paymentschedule
    ON paymentschedule.credit = issuedcredits.id

WHERE issuedcredits.maturitydate > ($(1)) AND issuedcredits.maturitydate < ($(2))
