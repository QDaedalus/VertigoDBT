
### Using the starter project

Try running the following commands:
- dbt run raw_merged+





## Tools I have used
- DBT
- Google BigQuery
- Github
- Looker Studio


## My Approach
- Initially uploaded csv files to Bigquery
- Created a merged table model in DBT for future analysis 
- The Daily_metrics model was created in DBT, and the related table was created in BigQuery
- Since Looker Studio can connect directly to BigQuery for visualization, it is used.
- Simple dashboard created and the link for it: https://lookerstudio.google.com/reporting/cddf2af1-beff-434d-8dbb-e5670270018a


## Additional Notes

- For orchestration, other tools can be used Airflow, etc.
- If in the future, much bigger data needs to be processed, we can consider using big data tools Spark, Databricks.
