/*
(This is for getting raw data to plot datagraph for query 6)
What skills are either top demanded or top paying that required for Data Analyst Jobs
- Why? Get a bigger picture of skillset to hone for Data Analyst Jobs,
and focus on analyzing top demanded (10%) and top paying (10%) skills to pave the career path in data analysis field.
And also, looking into salary statistics with max, min, mean and median value for those skills.
*/

WITH all_table AS (
  SELECT
    skills_dim.skills AS skill,
    ROUND(salary_year_avg, 0) AS salary
  FROM 
    job_postings_fact
  INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
  INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
  WHERE 
    salary_year_avg IS NOT NULL AND
    job_title_short = 'Data Analyst'
),

filter_table AS (
  SELECT
    skill,
    AVG(salary) AS avg_salary,
    COUNT(*) AS demand_count
  FROM all_table
  GROUP BY skill
  HAVING COUNT(*) > 10
)

SELECT
  all_table.skill AS skill,
  all_table.salary AS salary
FROM
  all_table
LEFT JOIN filter_table ON all_table.skill = filter_table.skill
WHERE filter_table.skill IS NOT NULL;
