/* What are the skills required for these top_paying roles?
    - Use the top-10 highest paying Data Analyst jobs from the first query
    - Add the specific skills required for these roles
    - Why? This provides a detailed look at which high-paying  jobs demands certain
      skills, helping job seekers understand which skills to develop that will 
      align with top salaries
*/

-- Because this is a little complex, so we're going to be using a CTE

WITH top_paying_jobs AS (
        SELECT
                job_id,
                job_title_short,
                salary_year_avg,
                name AS top_company_name
        FROM
                job_postings_fact

        LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
        WHERE   
                job_title_short = 'Data Analyst' AND
                job_location = 'Anywhere' AND
                salary_year_avg IS NOT NULL
        ORDER BY
                salary_year_avg DESC
        LIMIT   10
)

SELECT 
        top_paying_jobs.*,
        skills_dim.skills
FROM    
        top_paying_jobs
INNER JOIN
        skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN
        skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
        salary_year_avg DESC

/*
| Category                | Key Skills                    | Focus Level                                |
| ----------------------- | ----------------------------- | ------------------------------------------ |
| 🧮 **Core Analytics**   | SQL, Excel, R                 | 🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩 **(Very High Focus)** |
| 💻 **Programming**      | Python                        | 🟩🟩🟩🟩🟩🟩🟩🟩🟩 **(High Focus)**        |
| 📊 **Visualization**    | Power BI, Tableau, PowerPoint | 🟨🟨🟨🟨🟨🟨🟨 **(Moderate–High Focus)**   |
| ☁️ **Cloud / Big Data** | Azure, Databricks, Snowflake  | 🟧🟧🟧🟧🟧 **(Emerging Focus)**            |

SUMMARY INSIGHT

SQL is foundational — required by every top-paying role.
Python remains the second-most valuable technical skill.
Analysts who master visual storytelling (Power BI, Tableau) bridge the gap between data and decision.
Exposure to cloud ecosystems (Azure, Databricks, Snowflake) now differentiates top earners.

The most successful analysts are data storytellers, not just number crunchers.

/*
        [
        {
        "job_id": 552322,
        "job_title_short": "Data Analyst",
        "salary_year_avg": "255829.5",
        "top_company_name": "AT&T",
        "skills": "sql"
        },
        {
        "job_id": 552322,
        "job_title_short": "Data Analyst",
        "salary_year_avg": "255829.5",
        "top_company_name": "AT&T",
        "skills": "python"
        },
        {
        "job_id": 552322,
        "job_title_short": "Data Analyst",
        "salary_year_avg": "255829.5",
        "top_company_name": "AT&T",
        "skills": "r"
        },
        {
        "job_id": 552322,
        "job_title_short": "Data Analyst",
        "salary_year_avg": "255829.5",
        "top_company_name": "AT&T",
        "skills": "azure"
        },
        {
        "job_id": 552322,
        "job_title_short": "Data Analyst",
        "salary_year_avg": "255829.5",
        "top_company_name": "AT&T",
        "skills": "databricks"
        },
        {
        "job_id": 552322,
        "job_title_short": "Data Analyst",
        "salary_year_avg": "255829.5",
        "top_company_name": "AT&T",
        "skills": "aws"
        },
        {
        "job_id": 552322,
        "job_title_short": "Data Analyst",
        "salary_year_avg": "255829.5",
        "top_company_name": "AT&T",
        "skills": "pandas"
        },
        {
        "job_id": 552322,
        "job_title_short": "Data Analyst",
        "salary_year_avg": "255829.5",
        "top_company_name": "AT&T",
        "skills": "pyspark"
        },
        {
        "job_id": 552322,
        "job_title_short": "Data Analyst",
        "salary_year_avg": "255829.5",
        "top_company_name": "AT&T",
        "skills": "jupyter"
        },
        {
        "job_id": 552322,
        "job_title_short": "Data Analyst",
        "salary_year_avg": "255829.5",
        "top_company_name": "AT&T",
        "skills": "excel"
        },
        {
        "job_id": 552322,
        "job_title_short": "Data Analyst",
        "salary_year_avg": "255829.5",
        "top_company_name": "AT&T",
        "skills": "tableau"
        },
        {
        "job_id": 552322,
        "job_title_short": "Data Analyst",
        "salary_year_avg": "255829.5",
        "top_company_name": "AT&T",
        "skills": "power bi"
        },
        {
        "job_id": 552322,
        "job_title_short": "Data Analyst",
        "salary_year_avg": "255829.5",
        "top_company_name": "AT&T",
        "skills": "powerpoint"
        },
        {
        "job_id": 99305,
        "job_title_short": "Data Analyst",
        "salary_year_avg": "232423.0",
        "top_company_name": "Pinterest Job Advertisements",
        "skills": "sql"
        },
        {
        "job_id": 99305,
        "job_title_short": "Data Analyst",
        "salary_year_avg": "232423.0",
        "top_company_name": "Pinterest Job Advertisements",
        "skills": "python"
        },
        {
        "job_id": 99305,
        "job_title_short": "Data Analyst",
        "salary_year_avg": "232423.0",
        "top_company_name": "Pinterest Job Advertisements",
        "skills": "r"
        },
        {
        "job_id": 99305,
        "job_title_short": "Data Analyst",
        "salary_year_avg": "232423.0",
        "top_company_name": "Pinterest Job Advertisements",
        "skills": "hadoop"
        },
        {
        "job_id": 99305,
        "job_title_short": "Data Analyst",
        "salary_year_avg": "232423.0",
        "top_company_name": "Pinterest Job Advertisements",
        "skills": "tableau"
        },
        {
        "job_id": 1021647,
        "job_title_short": "Data Analyst",
        "salary_year_avg": "217000.0",
        "top_company_name": "Uclahealthcareers",
        "skills": "sql"
        },
        {
        "job_id": 1021647,
        "job_title_short": "Data Analyst",
        "salary_year_avg": "217000.0",
        "top_company_name": "Uclahealthcareers",
        "skills": "crystal"
        },
        {
        "job_id": 1021647,
        "job_title_short": "Data Analyst",
        "salary_year_avg": "217000.0",
        "top_company_name": "Uclahealthcareers",
        "skills": "oracle"
        },
        {
        "job_id": 1021647,
        "job_title_short": "Data Analyst",
        "salary_year_avg": "217000.0",
        "top_company_name": "Uclahealthcareers",
        "skills": "tableau"
        },
        {
        "job_id": 1021647,
        "job_title_short": "Data Analyst",
        "salary_year_avg": "217000.0",
        "top_company_name": "Uclahealthcareers",
        "skills": "flow"
        },
        {
        "job_id": 168310,
        "job_title_short": "Data Analyst",
        "salary_year_avg": "205000.0",
        "top_company_name": "SmartAsset",
        "skills": "sql"
        },
        {
        "job_id": 168310,
        "job_title_short": "Data Analyst",
        "salary_year_avg": "205000.0",
        "top_company_name": "SmartAsset",
        "skills": "python"
        },
        {
        "job_id": 168310,
        "job_title_short": "Data Analyst",
        "salary_year_avg": "205000.0",
        "top_company_name": "SmartAsset",
        "skills": "go"
        },
        {
        "job_id": 168310,
        "job_title_short": "Data Analyst",
        "salary_year_avg": "205000.0",
        "top_company_name": "SmartAsset",
        "skills": "snowflake"
        },
        {
        "job_id": 168310,
        "job_title_short": "Data Analyst",
        "salary_year_avg": "205000.0",
        "top_company_name": "SmartAsset",
        "skills": "pandas"
        },
        {
        "job_id": 168310,
        "job_title_short": "Data Analyst",
        "salary_year_avg": "205000.0",
        "top_company_name": "SmartAsset",
        "skills": "numpy"
        },
        {
        "job_id": 168310,
        "job_title_short": "Data Analyst",
        "salary_year_avg": "205000.0",
        "top_company_name": "SmartAsset",
        "skills": "excel"
        },
        {
        "job_id": 168310,
        "job_title_short": "Data Analyst",
        "salary_year_avg": "205000.0",
        "top_company_name": "SmartAsset",
        "skills": "tableau"
        },
        {
        "job_id": 168310,
        "job_title_short": "Data Analyst",
        "salary_year_avg": "205000.0",
        "top_company_name": "SmartAsset",
        "skills": "gitlab"
        },
        {
        "job_id": 731368,
        "job_title_short": "Data Analyst",
        "salary_year_avg": "189309.0",
        "top_company_name": "Inclusively",
        "skills": "sql"
        },
        {
        "job_id": 731368,
        "job_title_short": "Data Analyst",
        "salary_year_avg": "189309.0",
        "top_company_name": "Inclusively",
        "skills": "python"
        },
        {
        "job_id": 731368,
        "job_title_short": "Data Analyst",
        "salary_year_avg": "189309.0",
        "top_company_name": "Inclusively",
        "skills": "azure"
        },
        {
        "job_id": 731368,
        "job_title_short": "Data Analyst",
        "salary_year_avg": "189309.0",
        "top_company_name": "Inclusively",
        "skills": "aws"
        },
        {
        "job_id": 731368,
        "job_title_short": "Data Analyst",
        "salary_year_avg": "189309.0",
        "top_company_name": "Inclusively",
        "skills": "oracle"
        },
        {
        "job_id": 731368,
        "job_title_short": "Data Analyst",
        "salary_year_avg": "189309.0",
        "top_company_name": "Inclusively",
        "skills": "snowflake"
        },
        {
        "job_id": 731368,
        "job_title_short": "Data Analyst",
        "salary_year_avg": "189309.0",
        "top_company_name": "Inclusively",
        "skills": "tableau"
        },
        {
        "job_id": 731368,
        "job_title_short": "Data Analyst",
        "salary_year_avg": "189309.0",
        "top_company_name": "Inclusively",
        "skills": "power bi"
        },
        {
        "job_id": 731368,
        "job_title_short": "Data Analyst",
        "salary_year_avg": "189309.0",
        "top_company_name": "Inclusively",
        "skills": "sap"
        },
        {
        "job_id": 731368,
        "job_title_short": "Data Analyst",
        "salary_year_avg": "189309.0",
        "top_company_name": "Inclusively",
        "skills": "jenkins"
        },
        {
        "job_id": 731368,
        "job_title_short": "Data Analyst",
        "salary_year_avg": "189309.0",
        "top_company_name": "Inclusively",
        "skills": "bitbucket"
        },
        {
        "job_id": 731368,
        "job_title_short": "Data Analyst",
        "salary_year_avg": "189309.0",
        "top_company_name": "Inclusively",
        "skills": "atlassian"
        },
        {
        "job_id": 731368,
        "job_title_short": "Data Analyst",
        "salary_year_avg": "189309.0",
        "top_company_name": "Inclusively",
        "skills": "jira"
        },
        {
        "job_id": 731368,
        "job_title_short": "Data Analyst",
        "salary_year_avg": "189309.0",
        "top_company_name": "Inclusively",
        "skills": "confluence"
        },
        {
        "job_id": 310660,
        "job_title_short": "Data Analyst",
        "salary_year_avg": "189000.0",
        "top_company_name": "Motional",
        "skills": "sql"
        },
        {
        "job_id": 310660,
        "job_title_short": "Data Analyst",
        "salary_year_avg": "189000.0",
        "top_company_name": "Motional",
        "skills": "python"
        },
        {
        "job_id": 310660,
        "job_title_short": "Data Analyst",
        "salary_year_avg": "189000.0",
        "top_company_name": "Motional",
        "skills": "r"
        },
        {
        "job_id": 310660,
        "job_title_short": "Data Analyst",
        "salary_year_avg": "189000.0",
        "top_company_name": "Motional",
        "skills": "git"
        },
        {
        "job_id": 310660,
        "job_title_short": "Data Analyst",
        "salary_year_avg": "189000.0",
        "top_company_name": "Motional",
        "skills": "bitbucket"
        },
        {
        "job_id": 310660,
        "job_title_short": "Data Analyst",
        "salary_year_avg": "189000.0",
        "top_company_name": "Motional",
        "skills": "atlassian"
        },
        {
        "job_id": 310660,
        "job_title_short": "Data Analyst",
        "salary_year_avg": "189000.0",
        "top_company_name": "Motional",
        "skills": "jira"
        },
        {
        "job_id": 310660,
        "job_title_short": "Data Analyst",
        "salary_year_avg": "189000.0",
        "top_company_name": "Motional",
        "skills": "confluence"
        },
        {
        "job_id": 1749593,
        "job_title_short": "Data Analyst",
        "salary_year_avg": "186000.0",
        "top_company_name": "SmartAsset",
        "skills": "sql"
        },
        {
        "job_id": 1749593,
        "job_title_short": "Data Analyst",
        "salary_year_avg": "186000.0",
        "top_company_name": "SmartAsset",
        "skills": "python"
        },
        {
        "job_id": 1749593,
        "job_title_short": "Data Analyst",
        "salary_year_avg": "186000.0",
        "top_company_name": "SmartAsset",
        "skills": "go"
        },
        {
        "job_id": 1749593,
        "job_title_short": "Data Analyst",
        "salary_year_avg": "186000.0",
        "top_company_name": "SmartAsset",
        "skills": "snowflake"
        },
        {
        "job_id": 1749593,
        "job_title_short": "Data Analyst",
        "salary_year_avg": "186000.0",
        "top_company_name": "SmartAsset",
        "skills": "pandas"
        },
        {
        "job_id": 1749593,
        "job_title_short": "Data Analyst",
        "salary_year_avg": "186000.0",
        "top_company_name": "SmartAsset",
        "skills": "numpy"
        },
        {
        "job_id": 1749593,
        "job_title_short": "Data Analyst",
        "salary_year_avg": "186000.0",
        "top_company_name": "SmartAsset",
        "skills": "excel"
        },
        {
        "job_id": 1749593,
        "job_title_short": "Data Analyst",
        "salary_year_avg": "186000.0",
        "top_company_name": "SmartAsset",
        "skills": "tableau"
        },
        {
        "job_id": 1749593,
        "job_title_short": "Data Analyst",
        "salary_year_avg": "186000.0",
        "top_company_name": "SmartAsset",
        "skills": "gitlab"
        },
        {
        "job_id": 387860,
        "job_title_short": "Data Analyst",
        "salary_year_avg": "184000.0",
        "top_company_name": "Get It Recruit - Information Technology",
        "skills": "sql"
        },
        {
        "job_id": 387860,
        "job_title_short": "Data Analyst",
        "salary_year_avg": "184000.0",
        "top_company_name": "Get It Recruit - Information Technology",
        "skills": "python"
        },
        {
        "job_id": 387860,
        "job_title_short": "Data Analyst",
        "salary_year_avg": "184000.0",
        "top_company_name": "Get It Recruit - Information Technology",
        "skills": "r"
        }
]
*/

