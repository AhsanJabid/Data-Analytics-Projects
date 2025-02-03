SELECT 
    STR_TO_DATE(CONCAT(DATE_FORMAT(purchase_date, '%Y-%m'),
                    '-01'),
            '%Y-%m-%d') month,
    COUNT(DISTINCT transaction_details_id) '# of Free subscription'
FROM
    (SELECT 
       purchase_id, purchase_date, transaction_details_id
    FROM
        package_transaction_details
    WHERE

             payment_type = 'free'
            AND trx_id NOT LIKE '%test%'
             AND DAY(purchase_date) <= DAY(CURRENT_DATE())
            AND DATE(purchase_date) >= CURRENT_DATE() - INTERVAL 70 DAY
           
            ) a
GROUP BY 1