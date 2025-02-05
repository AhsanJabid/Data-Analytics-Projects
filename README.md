# Churn Prediction Project

## Overview
This project predicts customer churn based on structured customer data.

## Files
- `setup_database.sql`: Creates the SQLite database.
- `churn_data.csv`: Sample dataset.
- `load_data.py`: Loads data into SQLite.
- `clean_data.sql`: Cleans and preprocesses data.
- `churn_analysis.ipynb`: Jupyter Notebook for analysis.
- `requirements.txt`: Lists dependencies.

## Usage
1. Run `setup_database.sql`.
2. Use `load_data.py` to insert data.
3. Execute `clean_data.sql` for preprocessing.
4. Open `churn_analysis.ipynb` for EDA and modeling.

## Dependencies
Install required libraries:
```
pip install -r requirements.txt
```