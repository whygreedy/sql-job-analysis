/*
Find skills that are required for the top-paying data analyst jobs
- Use the top 10 highest-paying Data Analyst jobs from the first query
- Add the specific skills required for these roles
- Why? It provides a detailed look at which high-paying jobs demand certain skills,
    helping job seekers understand which skills to develop that align with top salaries
*/

WITH top_paying_jobs AS (
    SELECT
        job_id,
        job_title,
        company_dim.name AS company_name,
        salary_year_avg
    FROM 
        job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE 
        job_title_short = 'Data Analyst' AND
        salary_year_avg IS NOT NULL
    ORDER BY salary_year_avg DESC
    LIMIT 10
)

SELECT
    top_paying_jobs.*,
    skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY salary_year_avg DESC;

/*
Must-have skills: SQL, Python, Excel and R are the most common skills mentioned, indicating their significance in the field of data analysis.
Cloud Computing and Big Data: Knowledge of cloud-based data warehouse solutions like BigQuery and Snowflake, along with tools for data streaming and workflow management like Kafka, Spark, and Airflow, underscores the shift towards cloud-based analytics and real-time data processing in modern data analysis roles.
These insights suggest that a combination of languages (SQL, Python, R), data visualization tools (Tableau, Looker), big data tools (BigQuery, Kafka, Snowflake), and version control systems (Git, GitHub) are highly valued in data analyst roles.

[
  {
    "job_id": 209315,
    "job_title": "Data base administrator",
    "company_name": "ЛАНИТ",
    "salary_year_avg": "400000.0",
    "skills": "oracle"
  },
  {
    "job_id": 209315,
    "job_title": "Data base administrator",
    "company_name": "ЛАНИТ",
    "salary_year_avg": "400000.0",
    "skills": "kafka"
  },
  {
    "job_id": 209315,
    "job_title": "Data base administrator",
    "company_name": "ЛАНИТ",
    "salary_year_avg": "400000.0",
    "skills": "linux"
  },
  {
    "job_id": 209315,
    "job_title": "Data base administrator",
    "company_name": "ЛАНИТ",
    "salary_year_avg": "400000.0",
    "skills": "git"
  },
  {
    "job_id": 209315,
    "job_title": "Data base administrator",
    "company_name": "ЛАНИТ",
    "salary_year_avg": "400000.0",
    "skills": "svn"
  },
  {
    "job_id": 641501,
    "job_title": "Head of Infrastructure Management & Data Analytics - Financial...",
    "company_name": "Citigroup, Inc",
    "salary_year_avg": "375000.0",
    "skills": "excel"
  },
  {
    "job_id": 641501,
    "job_title": "Head of Infrastructure Management & Data Analytics - Financial...",
    "company_name": "Citigroup, Inc",
    "salary_year_avg": "375000.0",
    "skills": "word"
  },
  {
    "job_id": 1110602,
    "job_title": "HC Data Analyst , Senior",
    "company_name": "Illuminate Mission Solutions",
    "salary_year_avg": "375000.0",
    "skills": "python"
  },
  {
    "job_id": 1110602,
    "job_title": "HC Data Analyst , Senior",
    "company_name": "Illuminate Mission Solutions",
    "salary_year_avg": "375000.0",
    "skills": "r"
  },
  {
    "job_id": 1110602,
    "job_title": "HC Data Analyst , Senior",
    "company_name": "Illuminate Mission Solutions",
    "salary_year_avg": "375000.0",
    "skills": "vba"
  },
  {
    "job_id": 1110602,
    "job_title": "HC Data Analyst , Senior",
    "company_name": "Illuminate Mission Solutions",
    "salary_year_avg": "375000.0",
    "skills": "excel"
  },
  {
    "job_id": 1110602,
    "job_title": "HC Data Analyst , Senior",
    "company_name": "Illuminate Mission Solutions",
    "salary_year_avg": "375000.0",
    "skills": "tableau"
  },
  {
    "job_id": 229253,
    "job_title": "Director of Safety Data Analysis",
    "company_name": "Torc Robotics",
    "salary_year_avg": "375000.0",
    "skills": "sql"
  },
  {
    "job_id": 229253,
    "job_title": "Director of Safety Data Analysis",
    "company_name": "Torc Robotics",
    "salary_year_avg": "375000.0",
    "skills": "python"
  },
  {
    "job_id": 229253,
    "job_title": "Director of Safety Data Analysis",
    "company_name": "Torc Robotics",
    "salary_year_avg": "375000.0",
    "skills": "r"
  },
  {
    "job_id": 229253,
    "job_title": "Director of Safety Data Analysis",
    "company_name": "Torc Robotics",
    "salary_year_avg": "375000.0",
    "skills": "sas"
  },
  {
    "job_id": 229253,
    "job_title": "Director of Safety Data Analysis",
    "company_name": "Torc Robotics",
    "salary_year_avg": "375000.0",
    "skills": "matlab"
  },
  {
    "job_id": 229253,
    "job_title": "Director of Safety Data Analysis",
    "company_name": "Torc Robotics",
    "salary_year_avg": "375000.0",
    "skills": "spark"
  },
  {
    "job_id": 229253,
    "job_title": "Director of Safety Data Analysis",
    "company_name": "Torc Robotics",
    "salary_year_avg": "375000.0",
    "skills": "airflow"
  },
  {
    "job_id": 229253,
    "job_title": "Director of Safety Data Analysis",
    "company_name": "Torc Robotics",
    "salary_year_avg": "375000.0",
    "skills": "excel"
  },
  {
    "job_id": 229253,
    "job_title": "Director of Safety Data Analysis",
    "company_name": "Torc Robotics",
    "salary_year_avg": "375000.0",
    "skills": "tableau"
  },
  {
    "job_id": 229253,
    "job_title": "Director of Safety Data Analysis",
    "company_name": "Torc Robotics",
    "salary_year_avg": "375000.0",
    "skills": "power bi"
  },
  {
    "job_id": 229253,
    "job_title": "Director of Safety Data Analysis",
    "company_name": "Torc Robotics",
    "salary_year_avg": "375000.0",
    "skills": "sas"
  },
  {
    "job_id": 1059665,
    "job_title": "Data Analyst",
    "company_name": "Anthropic",
    "salary_year_avg": "350000.0",
    "skills": "sql"
  },
  {
    "job_id": 1059665,
    "job_title": "Data Analyst",
    "company_name": "Anthropic",
    "salary_year_avg": "350000.0",
    "skills": "python"
  },
  {
    "job_id": 101757,
    "job_title": "Head of Data Analytics",
    "company_name": "Care.com",
    "salary_year_avg": "350000.0",
    "skills": "sql"
  },
  {
    "job_id": 101757,
    "job_title": "Head of Data Analytics",
    "company_name": "Care.com",
    "salary_year_avg": "350000.0",
    "skills": "python"
  },
  {
    "job_id": 101757,
    "job_title": "Head of Data Analytics",
    "company_name": "Care.com",
    "salary_year_avg": "350000.0",
    "skills": "r"
  },
  {
    "job_id": 101757,
    "job_title": "Head of Data Analytics",
    "company_name": "Care.com",
    "salary_year_avg": "350000.0",
    "skills": "bigquery"
  },
  {
    "job_id": 101757,
    "job_title": "Head of Data Analytics",
    "company_name": "Care.com",
    "salary_year_avg": "350000.0",
    "skills": "snowflake"
  },
  {
    "job_id": 101757,
    "job_title": "Head of Data Analytics",
    "company_name": "Care.com",
    "salary_year_avg": "350000.0",
    "skills": "tableau"
  },
  {
    "job_id": 101757,
    "job_title": "Head of Data Analytics",
    "company_name": "Care.com",
    "salary_year_avg": "350000.0",
    "skills": "power bi"
  },
  {
    "job_id": 101757,
    "job_title": "Head of Data Analytics",
    "company_name": "Care.com",
    "salary_year_avg": "350000.0",
    "skills": "looker"
  },
  {
    "job_id": 894135,
    "job_title": "Research Scientist",
    "company_name": "OpenAI",
    "salary_year_avg": "285000.0",
    "skills": "github"
  }
]

*/
