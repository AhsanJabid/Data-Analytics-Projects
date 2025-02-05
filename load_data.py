import pandas as pd
import sqlite3

df = pd.read_csv('churn_data.csv', parse_dates=['SignUpDate', 'LastPaymentDate'])

conn = sqlite3.connect('churn_prediction.db')

df.to_sql('customers', conn, if_exists='replace', index=False)

print("Data inserted successfully!")

conn.close()