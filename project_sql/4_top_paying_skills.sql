/*
Question 4: What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Analyst positions
- Focus on roles with specific salaries, regardless of job_location
- Why? It reveals how different skills impact salary levels for Data Analysts and
  help identify the most financially rewarding skills to acquire or improve
*/

SELECT
            skills,
            ROUND(AVG(salary_year_avg),0) AS average_salary
            
FROM
            job_postings_fact
INNER JOIN  skills_job_dim 
            ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
            job_title_short = 'Data Analyst'
            AND salary_year_avg IS NOT NULL
            AND job_work_from_home = TRUE
GROUP BY
            skills
ORDER BY
            average_salary DESC
LIMIT 5

[
  {
    "skills": "pyspark",
    "average_salary": "208172"
  },
  {
    "skills": "bitbucket",
    "average_salary": "189155"
  },
  {
    "skills": "couchbase",
    "average_salary": "160515"
  },
  {
    "skills": "watson",
    "average_salary": "160515"
  },
  {
    "skills": "datarobot",
    "average_salary": "155486"
  },
  {
    "skills": "gitlab",
    "average_salary": "154500"
  },
  {
    "skills": "swift",
    "average_salary": "153750"
  },
  {
    "skills": "jupyter",
    "average_salary": "152777"
  },
  {
    "skills": "pandas",
    "average_salary": "151821"
  },
  {
    "skills": "elasticsearch",
    "average_salary": "145000"
  },
  {
    "skills": "golang",
    "average_salary": "145000"
  },
  {
    "skills": "numpy",
    "average_salary": "143513"
  },
  {
    "skills": "databricks",
    "average_salary": "141907"
  },
  {
    "skills": "linux",
    "average_salary": "136508"
  },
  {
    "skills": "kubernetes",
    "average_salary": "132500"
  },
  {
    "skills": "atlassian",
    "average_salary": "131162"
  },
  {
    "skills": "twilio",
    "average_salary": "127000"
  },
  {
    "skills": "airflow",
    "average_salary": "126103"
  },
  {
    "skills": "scikit-learn",
    "average_salary": "125781"
  },
  {
    "skills": "jenkins",
    "average_salary": "125436"
  },
  {
    "skills": "notion",
    "average_salary": "125000"
  },
  {
    "skills": "scala",
    "average_salary": "124903"
  },
  {
    "skills": "postgresql",
    "average_salary": "123879"
  },
  {
    "skills": "gcp",
    "average_salary": "122500"
  },
  {
    "skills": "microstrategy",
    "average_salary": "121619"
  }
]

💼✨ Top Paying Skills for Remote Data Analysts (2024)

| 💻 Skill                              | 💵 Avg. Salary |
| ------------------------------------- | -------------- |
| **PySpark**                           | $208K          |
| **Bitbucket**                         | $189K          |
| **Couchbase / Watson / DataRobot**    | $155–160K      |
| **GitLab / Swift / Jupyter / Pandas** | $150K+         |
| **Databricks / Kubernetes / Airflow** | $126–142K      |

💼✨ Top Paying Skills for Remote Data Analysts (2024)

1️⃣ Data Engineering is the New Analytics
High-paying roles now demand tools like PySpark, Databricks, Airflow, and GCP — analysts 
who can build and automate data pipelines earn the most.

2️⃣ AI & Automation Lead the Pack
Skills such as Watson, DataRobot, and Scikit-learn show that the highest earners combine 
analytics with machine learning and automation.

3️⃣ The Hybrid Analyst Emerges
Today’s top analysts master Python, GitLab, and Cloud tools, blending coding, visualization, 
and data strategy — becoming Data Engineer + Analyst hybrids.
