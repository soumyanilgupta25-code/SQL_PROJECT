/*
What are the most optimal skills to learn (i.e it’s in high demand and a high-paying skill)?
- Identify skills in high demand and associated with high average salaries for Data Analyst roles.
- Concentrates on roles in India with specified salaries
This targets skills that offer job security (high demand) and financial benefits (high salaries), 
    offering strategic insights for career development in data analysis in India.
*/
WITH skills_demand AS(
    SELECT
        skills_dim.skill_id,
        skills_dim.skills,
        COUNT(*) AS demand_count
    FROM
        job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE 
        job_title_short = 'Data Analyst' AND
        salary_year_avg IS NOT NULL AND
        job_location LIKE '%India'
    GROUP BY skills_dim.skill_id
), salary_skills AS (
    SELECT
        skills_dim.skill_id,
        skills_dim.skills,
        ROUND(AVG(salary_year_avg), 0) AS average_salary
    FROM
        job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE 
        job_title_short = 'Data Analyst' AND
        salary_year_avg IS NOT NULL AND
        job_location LIKE '%India'
    GROUP BY skills_dim.skill_id
)
SELECT 
    skills_demand.skill_id,
    skills_demand.skills,
    demand_count,
    average_salary
FROM 
    skills_demand
INNER JOIN salary_skills ON skills_demand.skill_id=salary_skills.skill_id
WHERE 
    demand_count>=5
ORDER BY
    average_salary DESC,
    demand_count DESC
LIMIT 25;

-- rewriting this same query more concisely
SELECT 
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count,
    ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS average_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_location LIKE '%India'
GROUP BY
    skills_dim.skill_id
HAVING
    COUNT(skills_job_dim.job_id) >=5
ORDER BY
    average_salary DESC,
    demand_count DESC
LIMIT 25;

/*
Optimal Skills for Data Analysts in India:
The analysis identifies SQL, Python, Power BI, Tableau, Azure, AWS, Spark, and Excel
as the most optimal skills for data analysts in India, based on both demand and average salary.

SQL and Excel show the highest demand, confirming that foundational analytics and reporting skills 
remain essential across industries. 

Python also demonstrates strong demand and salary potential, reflecting the increasing importance of 
automation, data processing, and analytical programming.

Among business intelligence tools, Power BI and Tableau offer an excellent balance of employability and compensation,
indicating strong market demand for dashboarding and visualization expertise.

Cloud and big data technologies such as Azure, AWS, Spark, and Hadoop are associated with higher salary ranges, 
suggesting that organizations increasingly value analysts who can work with scalable cloud-based and large-scale data systems.

Overall, the Indian analytics market is shifting toward hybrid analyst roles that combine:
- analytics,
- programming,
- business intelligence,
- and cloud/data engineering capabilities.
*/

