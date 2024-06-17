/*
Question: What are the most in-demand skills for data analysts?
-Identify top 5 in-demand skills for data analyst.
-focus on all job postings
-why? Retrieves the top 5 skills with the highest demand in the job market,
    providing insights into the most valuble skills for job seakers
*/

SELECT 
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM    
    job_postings_fact
INNER JOIN 
    skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
INNER JOIN 
    skills_dim on skills_dim.skill_id = skills_job_dim.skill_id
WHERE 
    job_postings_fact.job_title_short = 'Data Analyst'
GROUP BY
    skills
ORDER BY demand_count DESC
limit 5