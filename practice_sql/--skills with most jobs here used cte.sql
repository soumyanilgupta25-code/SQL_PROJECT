--skills with most jobs here used cte 
WITH csk AS(
    SELECT 
        skill_id,
        COUNT(*) AS number_jobs
    FROM 
        skills_job_dim
    GROUP BY 
        skill_id
)
SELECT
    skills,
    csk.number_jobs
FROM  
    skills_dim
LEFT JOIN csk ON skills_dim.skill_id=csk.skill_id
ORDER BY number_jobs DESC;