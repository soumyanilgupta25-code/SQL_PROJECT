/*
What skills are required for the top-paying data analyst jobs in India?
- Use the top 10 highest-paying Data Analyst jobs from first query
- Add the specific skills required for these roles
This provides a detailed look at which high-paying jobs demand certain skills, 
helping job seekers understand which skills to develop that align with top salaries
*/
WITH top_paying_jobs AS (
    SELECT
        job_id,
        job_title,
        job_location,
        salary_year_avg,
        company_dim.name AS company_name
    FROM
        job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE 
        job_title_short = 'Data Analyst' AND
        job_location LIKE '%India' AND
        salary_year_avg IS NOT NULL
    ORDER BY salary_year_avg DESC
    LIMIT 10
)

SELECT 
    top_paying_jobs.*,
    skills_dim.skills
FROM
    top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC;
/*
Using Chatgpt for getting insights intio the skills required for top-paying data analyst jobs:
SQL is the most demanded skill and Appeared 6 times
This confirms SQL is still the core requirement for analytics jobs.
Power BI is extremely valuable and appeared 5 times
Cloud + Big Data tools are rising
Skills like:
    Azure
    AWS
    Spark
    Databricks
    Hadoop 
are showing up repeatedly.
Companies want analysts who can handle larger datasets and cloud workflows.
Python is important but not always mandatory
Appeared 3 times
SQL + BI tools seem more universally required than advanced Python.
Excel still matters
Appeared 4 times
Even high-paying roles still expect Excel proficiency.
Database technologies are highly valued
MongoDB, Oracle, PostgreSQL, MySQL, NoSQL all appeared.
Suggests companies value strong data storage understanding.
*/