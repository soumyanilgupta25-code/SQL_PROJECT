/*
What are the most in-demand skills for data analysts in India?
- Join job postings to inner join table similar to what we did in query 2
- Identify the top 5 in-demand skills for a data analyst.
- Focus on all job postings.
This retrieves the top 5 skills with the highest demand in the job market in India, 
    providing insights into the most valuable skills for job seekers.
*/
SELECT
    skills_dim.skills,
    COUNT(*) AS demand_count
FROM
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
    job_title_short = 'Data Analyst' AND
    job_location LIKE '%India'
GROUP BY skills
ORDER BY demand_count DESC
LIMIT 5;


/*
Here's the breakdown of the most demanded skills for data analysts:
SQL and Excel remain fundamental, emphasizing the need for strong foundational skills in data processing and spreadsheet manipulation.
Programming and Visualization Tools like Python, Tableau, and Power BI are essential, pointing towards the increasing importance of technical skills in data storytelling and decision support.
*/

