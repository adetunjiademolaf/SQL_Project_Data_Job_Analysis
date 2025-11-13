/* Question 1: What are the top-paying data analyst jobs?
    - Identify the top 10 highest paying Data Analyst roles that are available remotely
    - Focus on Job postings with specified salaries (remove NULL values)
    - Why? Highlight the top-paying opportunities for Data Analysts, offering insight into employment opportunity 
*/

SELECT
        job_id,
        job_title,
        job_title_short,
        job_schedule_type,
        Salary_year_avg,
        job_posted_date,
        name AS top_company_name
FROM
        job_postings_fact

-- To be able to include company name column of the top paying jobs 
-- (This is important because it's not on the main table)

LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE   
        job_title_short = 'Data Analyst' AND
        job_location = 'Anywhere' AND
        salary_year_avg IS NOT NULL
ORDER BY
        salary_year_avg DESC
LIMIT   10

-- To check the header in the company_dim table (RUN SEPERATELY)
SELECT *
FROM    company_dim
LIMIT 2