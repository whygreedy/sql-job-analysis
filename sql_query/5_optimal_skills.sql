/*
What are the most optimal skills to learn (aka it's high demand and a high-paying skill)?
- Identify skills in high demand and associated with high average salaries for Data Analyst roles
- Concentrate on remote positions with specified salaries
- Why? Targets skills that offer job security (high demand) and financial benefits (high salaries),
    offering strategic insights for career development in data analysis
*/

SELECT
    skills_dim.skill_id AS skill_id,
    skills_dim.skills AS skill,
    COUNT(job_postings_fact.job_id) AS demand_count,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
    salary_year_avg IS NOT NULL AND
    job_title_short = 'Data Analyst' AND
    job_work_from_home = TRUE
GROUP BY 
    skills_dim.skill_id
HAVING COUNT(job_postings_fact.job_id) > 10
ORDER BY
    avg_salary DESC,
    demand_count DESC
LIMIT 25;

/*


Insights into trends in high-demand and high-paying data analyst remote jobs:

1. Cloud Platforms Dominance:
Skills related to cloud platforms like AWS, Azure, and Google Cloud (GCP) are consistently in demand. They offer scalable solutions for data storage, processing, and analysis.
High demand for Snowflake and BigQuery indicates a shift towards cloud-based data warehousing and analytics solutions, reflecting a trend of companies migrating their data infrastructure to the cloud for flexibility and cost-effectiveness.

2. Data Visualization Tools and BI Platforms:
Tableau, Looker, and Qlik are prominent in the list, highlighting the importance of data visualization and business intelligence (BI) tools in data analysis roles.
Organizations are increasingly relying on these platforms to transform raw data into actionable insights, driving demand for professionals proficient in using these tools to communicate complex data effectively.

3. Programming Languages:
Python and R continue to be essential skills for data analysts, with Python leading in demand. Their versatility in data manipulation, statistical analysis, and machine learning contribute to their enduring relevance.
Java, although less in demand compared to Python and R, still holds significance, especially in environments where integration with Java-based systems is necessary, suggesting diverse application areas for data analysis roles.

These insights suggest that data analysts with expertise in cloud platforms, data visualization tools, and programming languages like Python and R are well-positioned in the job market, particularly in remote roles where proficiency in utilizing remote collaboration tools like Confluence and Jira might also be beneficial.

[
  {
    "skill_id": 8,
    "skill": "go",
    "demand_count": "27",
    "avg_salary": "115320"
  },
  {
    "skill_id": 234,
    "skill": "confluence",
    "demand_count": "11",
    "avg_salary": "114210"
  },
  {
    "skill_id": 97,
    "skill": "hadoop",
    "demand_count": "22",
    "avg_salary": "113193"
  },
  {
    "skill_id": 80,
    "skill": "snowflake",
    "demand_count": "37",
    "avg_salary": "112948"
  },
  {
    "skill_id": 74,
    "skill": "azure",
    "demand_count": "34",
    "avg_salary": "111225"
  },
  {
    "skill_id": 77,
    "skill": "bigquery",
    "demand_count": "13",
    "avg_salary": "109654"
  },
  {
    "skill_id": 76,
    "skill": "aws",
    "demand_count": "32",
    "avg_salary": "108317"
  },
  {
    "skill_id": 4,
    "skill": "java",
    "demand_count": "17",
    "avg_salary": "106906"
  },
  {
    "skill_id": 194,
    "skill": "ssis",
    "demand_count": "12",
    "avg_salary": "106683"
  },
  {
    "skill_id": 233,
    "skill": "jira",
    "demand_count": "20",
    "avg_salary": "104918"
  },
  {
    "skill_id": 79,
    "skill": "oracle",
    "demand_count": "37",
    "avg_salary": "104534"
  },
  {
    "skill_id": 185,
    "skill": "looker",
    "demand_count": "49",
    "avg_salary": "103795"
  },
  {
    "skill_id": 2,
    "skill": "nosql",
    "demand_count": "13",
    "avg_salary": "101414"
  },
  {
    "skill_id": 1,
    "skill": "python",
    "demand_count": "236",
    "avg_salary": "101397"
  },
  {
    "skill_id": 5,
    "skill": "r",
    "demand_count": "148",
    "avg_salary": "100499"
  },
  {
    "skill_id": 78,
    "skill": "redshift",
    "demand_count": "16",
    "avg_salary": "99936"
  },
  {
    "skill_id": 187,
    "skill": "qlik",
    "demand_count": "13",
    "avg_salary": "99631"
  },
  {
    "skill_id": 182,
    "skill": "tableau",
    "demand_count": "230",
    "avg_salary": "99288"
  },
  {
    "skill_id": 197,
    "skill": "ssrs",
    "demand_count": "14",
    "avg_salary": "99171"
  },
  {
    "skill_id": 92,
    "skill": "spark",
    "demand_count": "13",
    "avg_salary": "99077"
  },
  {
    "skill_id": 13,
    "skill": "c++",
    "demand_count": "11",
    "avg_salary": "98958"
  },
  {
    "skill_id": 186,
    "skill": "sas",
    "demand_count": "63",
    "avg_salary": "98902"
  },
  {
    "skill_id": 7,
    "skill": "sas",
    "demand_count": "63",
    "avg_salary": "98902"
  },
  {
    "skill_id": 61,
    "skill": "sql server",
    "demand_count": "35",
    "avg_salary": "97786"
  },
  {
    "skill_id": 9,
    "skill": "javascript",
    "demand_count": "20",
    "avg_salary": "97587"
  }
]

*/
