/*
What are the most optimal skills to learn (AKA it is high-demand and a high-paying skill)?
- Identify skills in high demand and associated with high average salaries for Data Analyst roles
- Concentrate on remote positions with specified salaries
- Why? Target skills that offer job seciruty (high-demand)
- And with Fiancial benefits (high avg salaries) offering startegic insights for career 
development in data Analytics

WE'D BE COMBINING THE TWO CTE'S EARLIER BUILT 
1. For Top demanded skills i.e., (skills_demand) and the count (skill_demand_count)
2. For Top Paying Skills i.e., (average_salary) and the AVG (avg_salary)
*/

-- CTE 1

WITH skills_demand AS (
    SELECT
        skills_dim.skill_id,
        skills_dim.skills,
        COUNT(skills_job_dim.job_id) AS skill_demand_count
    FROM 
        job_postings_fact
    INNER JOIN  
        skills_job_dim 
        ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN  
        skills_dim 
        ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst'
        AND salary_year_avg IS NOT NULL
        AND job_location = 'Anywhere'
    GROUP BY
        skills_dim.skill_id, 
        skills_dim.skills

-- CTE 2
),
average_salary AS (
    SELECT
        skills_job_dim.skill_id,
        ROUND(AVG(salary_year_avg), 0) AS avg_salary
    FROM
        job_postings_fact
    INNER JOIN  
        skills_job_dim 
        ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN 
        skills_dim 
        ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst'
        AND salary_year_avg IS NOT NULL
        AND job_work_from_home = TRUE
    GROUP BY
        skills_job_dim.skill_id
)
-- MAIN LINE OF CODE
SELECT  
    skills_demand.skill_id,
    skills_demand.skills,
    skills_demand.skill_demand_count,
    average_salary.avg_salary
FROM
    skills_demand
INNER JOIN 
    average_salary 
    ON skills_demand.skill_id = average_salary.skill_id
WHERE
    skills_demand.skill_demand_count >10
ORDER BY 
   -- average_salary.avg_salary DESC;
    skills_demand.skill_demand_count DESC


-- USING A PLAIN LINES OF CODE WITHOUT CTEs

SELECT
        skills_dim.skill_id,
        skills_dim.skills,
        COUNT(skills_job_dim.job_id) AS skill_demand_count,
        ROUND(AVG(job_postings_fact.salary_year_avg),0) AS avg_salary
FROM    job_postings_fact
INNER JOIN
        skills_job_dim ON
        job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN
        skills_dim ON
        skills_job_dim.skill_id = skills_dim.skill_id
WHERE
        job_title_short = 'Data Analyst'
        AND salary_year_avg IS NOT NULL
        AND job_work_from_home = TRUE
GROUP BY
        skills_dim.skill_id, skills_dim.skills
HAVING
        COUNT (skills_job_dim.job_id)>10
ORDER BY
        avg_salary DESC
LIMIT 25



SUMMARY OF INSIGHTS FROM THE MOST OPTIMAL SKILL FOR DATA ANALYST ROLES
BASED ON AVERAGE SALARY OF THE TOP-PAYING SKILL AND TOP DEMANDED SKILL

1. SQL, Excel, and Python are the top 3 most in-demand skills for Data Analysts, 
   showing the strongest presence in job postings.

2. Python, R, and Tableau lead in terms of higher average salaries, with 
   Python reaching over $101K on average.

3. Emerging tech skills like Snowflake, Azure, and Go offer premium pay 
   ($110K–$115K) despite lower demand, highlighting niche expertise value.

| Skill           | Demand 📊                                          | Avg Salary 💰 | Salary Level |
| :-------------- | :------------------------------------------------- | :------------ | :----------- |
| **SQL**         | ██████████████████████████████████████████████ 398 | **$97K**      | 🟩 High      |
| **Excel**       | ███████████████████████████████ 256                | **$87K**      | 🟨 Mid       |
| **Python**      | ██████████████████████████ 236                     | **$101K**     | 🟩 High      |
| **Tableau**     | ████████████████████████ 230                       | **$99K**      | 🟩 High      |
| **R**           | ████████████████ 148                               | **$100K**     | 🟩 High      |
| **Power BI**    | ███████████ 110                                    | **$97K**      | 🟩 High      |
| **SAS**         | ████████ 63                                        | **$99K**      | 🟩 High      |
| **Looker**      | ████ 49                                            | **$104K**     | 🟩💎 Premium |
| **Snowflake**   | ███ 37                                             | **$113K**     | 🟦 Elite     |
| **Go (Golang)** | ███ 27                                             | **$115K**     | 🟦 Elite     |
| **Hadoop**      | ██▌ 22                                             | **$113K**     | 🟦 Elite     |
| **Confluence**  | █▌ 11                                              | **$114K**     | 🟦 Elite     |
