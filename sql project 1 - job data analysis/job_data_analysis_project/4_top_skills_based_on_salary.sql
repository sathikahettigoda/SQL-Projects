/*
Question: What are the top skills based om salary?
- Look at the average salary associated with each skill for Data Analyst positions
- Focuses on roles with specified salaries, regardless of location
Why? It reveals how different skills impact salary levels for Data Analysts and 
    helps identify the most financially rewarding skills to accuire or improve.
*/

SELECT 
    skills,
    ROUND(AVG(salary_year_avg),0) AS avg_salary
FROM    
    job_postings_fact
INNER JOIN 
    skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
INNER JOIN 
    skills_dim on skills_dim.skill_id = skills_job_dim.skill_id
WHERE 
    job_postings_fact.job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL AND
    job_work_from_home = True
GROUP BY
    skills
ORDER BY
    avg_salary  DESC
limit 25


/*
Emerging Technologies and Programming Languages:
    High salaries for skills in PySpark ($208,172), Bitbucket ($189,155), Couchbase, Watson (both $160,515), 
    Swift, Go, and Scala indicate a strong demand for expertise in advanced data processing, cloud platforms, 
    and high-performance programming languages. 

Data Management, Machine Learning, and Analysis Tools:
    Significant value is placed on skills like Pandas ($151,821), NumPy ($143,513), DataRobot ($155,486), and 
    Scikit-learn ($125,781), highlighting the importance of data manipulation, numerical analysis, and machine 
    learning capabilities in high-paying roles. 

Collaboration, DevOps, and Business Intelligence Tools:
    Tools such as GitLab ($154,500), Jupyter ($152,777), Databricks ($141,907), MicroStrategy ($121,619), and 
    Jenkins ($125,436) show the integration of version control, interactive analysis, cloud computing, 
    business intelligence, and continuous integration/deployment practices in top-paying data analyst positions.
*/