--FIND the count of remote job postings per skill and top 5 FOR DATA ANALYST
WITH remote_job_skills AS(
SELECT 
    skill_id,
    COUNT(*) as number_jobs_remote
FROM 
    skills_job_dim
INNER JOIN job_postings_fact ON job_postings_fact.job_id=skills_job_dim.job_id
WHERE 
    job_work_from_home=TRUE AND
    job_title_short='Data Analyst'
GROUP BY 
    skill_id
)

SELECT 
    skills_dim.skills,
    remote_job_skills.number_jobs_remote
FROM remote_job_skills
INNER JOIN skills_dim ON skills_dim.skill_id=remote_job_skills.skill_id
ORDER BY number_jobs_remote DESC
LIMIT 5