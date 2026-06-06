/* ⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️
Database Load Issues (followed after receiving permission denied when running SQL code below)

I used ChatGpT to get the steps to load the data into the tables. I had to run the same code in pgAdmin to get the data loaded. The code below is useless.

1. Opened pgAdmin
2. In Object Explorer (left-hand pane), navigate to `sql_course_2` database
3. Right-click `sql_course_2` and select `PSQL Tool`
    - This opens a terminal window to write the following code
4. Get the absolute file path of your csv files
    1. Find path by right-clicking a CSV file in VS Code and selecting “Copy Path”
5. Paste the following into `PSQL Tool`, (with the CORRECT file path)

\copy company_dim FROM '/Users/soumyanilgupta/Downloads/SQL_PROJECT/csv_files/company_dim.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

\copy skills_dim FROM '/Users/soumyanilgupta/Downloads/SQL_ROJECT/csv_files/skills_dim.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

\copy job_postings_fact FROM '/Users/soumyanilgupta/Downloads/SQL_PROJECT/csv_files/job_postings_fact.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

\copy skills_job_dim FROM '/Users/soumyanilgupta/Downloads/SQL_PROJECT/csv_files/skills_job_dim.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

*/

-- NOTE: This is the SQL code to load the tables with data from the CSV files. It is useless. Had to run the same code in pgAdmin to get the data loaded. 
COPY company_dim
FROM '/Users/soumyanilgupta/Downloads/SQL_PROJECT/csv_files/company_dim.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY skills_dim
FROM '/Users/soumyanilgupta/Downloads/SQL_ROJECT/csv_files/skills_dim.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY job_postings_fact
FROM '/Users/soumyanilgupta/Downloads/SQL_PROJECT/csv_files/job_postings_fact.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY skills_job_dim
FROM '/Users/soumyanilgupta/Downloads/SQL_PROJECT/csv_files/skills_job_dim.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

