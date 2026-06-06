/*
What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Analyst positions
- Focuses on roles with specified salaries, based in India.
It reveals how different skills impact salary levels for Data Analysts and 
    helps identify the most financially rewarding skills to acquire or improve
*/
SELECT
    skills_dim.skills,
    ROUND(AVG(salary_year_avg), 0) AS average_salary
FROM
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
    job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL
  AND job_location LIKE '%India'
GROUP BY skills
ORDER BY average_salary DESC
LIMIT 25;

/*
Summary of Key Insights using ChatGpt
The analysis shows that the highest-paying data analyst roles in India are increasingly technical and engineering-oriented rather than focused only on reporting or dashboards.
Skills related to:
* big data processing (`PySpark`, `Spark`, `Kafka`, `Hadoop`)
* cloud analytics (`Databricks`, `Snowflake`)
* workflow automation (`Airflow`)
* and infrastructure management (`Linux`, `Shell`, `Bash`)

are associated with the highest salaries.

The results also highlight that strong database expertise remains essential, with technologies like `PostgreSQL`, `MySQL`, `MongoDB`, and `Neo4j` appearing frequently among top-paying skills.

Another important trend is the growing demand for hybrid analytics roles that combine:
* data analysis,
* engineering capabilities,
* automation,
* and cloud-based data operations.
Overall, the Indian analytics market appears to be shifting from traditional reporting-focused analyst roles toward more scalable, infrastructure-aware, and technically advanced analytics positions.
*/