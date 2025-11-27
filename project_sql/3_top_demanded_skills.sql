/*
Question: What are the most in-demand skills for data analyst?
- join job postings to INNER JOIN table similar to query 2
- Identify the top 5 in-demand skills for a data Analyst
- Focus on all job postings.
Why? Retrieve the top 5 skills with the highest demand in the job market, 
    providing insight into the most valuable skills for job seekers
*/

SELECT
        skills,
        COUNT (skills_job_dim.job_id) AS skill_demand_count
FROM    job_postings_fact
INNER JOIN  skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN  skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
            job_title_short = 'Data Analyst' AND
            job_location = 'Anywhere'
GROUP BY
            skills
ORDER BY    skill_demand_count DESC
LIMIT 5


[
  {
    "skills": "sql",
    "skill_demand_count": "7291"
  },
  {
    "skills": "excel",
    "skill_demand_count": "4611"
  },
  {
    "skills": "python",
    "skill_demand_count": "4330"
  },
  {
    "skills": "tableau",
    "skill_demand_count": "3745"
  },
  {
    "skills": "power bi",
    "skill_demand_count": "2609"
  }
]