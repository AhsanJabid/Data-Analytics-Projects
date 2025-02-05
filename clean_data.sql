UPDATE customers SET TotalCharges = 0 WHERE TotalCharges IS NULL;
UPDATE customers SET Dependents = 'No' WHERE Dependents IS NULL;
DELETE FROM customers WHERE customerID IS NULL;

UPDATE customers SET gender = LOWER(gender);
UPDATE customers SET Partner = 'No' WHERE Partner IS NULL OR Partner NOT IN ('Yes', 'No');

ALTER TABLE customers ADD COLUMN TotalCharges_numeric REAL;
UPDATE customers SET TotalCharges_numeric = CAST(TotalCharges AS REAL);
ALTER TABLE customers DROP COLUMN TotalCharges;
ALTER TABLE customers RENAME COLUMN TotalCharges_numeric TO TotalCharges;

ALTER TABLE customers ADD COLUMN tenure_years REAL;
UPDATE customers SET tenure_years = tenure / 12.0;
ALTER TABLE customers ADD COLUMN long_term_customer INTEGER;
UPDATE customers SET long_term_customer = CASE WHEN tenure >= 12 THEN 1 ELSE 0 END;

DELETE FROM customers WHERE rowid NOT IN (
    SELECT MIN(rowid) FROM customers GROUP BY customerID
);