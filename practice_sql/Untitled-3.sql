/*Find companies with most job openings.
Get total job postings per company id and then return total jobs with company name.*/
WITH company_job_count AS(
SELECT
    company_id,
    COUNT(*) AS number_jobs
FROM 
    job_postings_fact
GROUP BY 
    company_id
)
SELECT
    name,
    number_jobs
FROM
    company_dim
LEFT JOIN company_job_count ON company_dim.company_id=company_job_count.company_id
ORDER BY number_jobs DESC
