/*
What are the most optimal skills to learn (aka it's high demand and a high-paying skill)?
- Identify skills in high demand and associated with high average salaries for Data Analyst roles
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
    job_title_short = 'Data Analyst'
GROUP BY 
    skills_dim.skill_id
HAVING COUNT(job_postings_fact.job_id) > 10
ORDER BY
    avg_salary DESC,
    demand_count DESC
LIMIT 25;

/*

1. Emergence of Big Data Technologies:
- High-demand skills such as Kafka, PyTorch, TensorFlow, and Apache Hadoop signify the increasing importance of big data technologies in data analysis roles.
- Companies are actively seeking professionals proficient in these tools to handle large volumes of data and derive valuable insights.

2. Cloud Computing and Data Management:
- Skills related to cloud platforms like GCP (Google Cloud Platform), Snowflake, and Databricks are in high demand, indicating the shift towards cloud-based data management and analytics solutions.
- Organizations are leveraging cloud services for scalable storage, processing, and analysis of data, leading to increased demand for professionals with expertise in cloud-based analytics tools.

3. Automation and Workflow Management:
- Tools such as Airflow, Git, and Atlassian are indicative of the growing need for automation and efficient workflow management in data analysis processes.
- Companies are seeking candidates who can streamline data pipelines, automate repetitive tasks, and collaborate effectively within teams using version control and project management tools.

Overall, the trends suggest a strong emphasis on advanced analytics, big data technologies, cloud computing, and automation in data analyst roles, reflecting the evolving needs of organizations to derive insights and make data-driven decisions efficiently.


[
  {
    "skill_id": 98,
    "skill": "kafka",
    "demand_count": "40",
    "avg_salary": "129999"
  },
  {
    "skill_id": 101,
    "skill": "pytorch",
    "demand_count": "20",
    "avg_salary": "125226"
  },
  {
    "skill_id": 31,
    "skill": "perl",
    "demand_count": "20",
    "avg_salary": "124686"
  },
  {
    "skill_id": 99,
    "skill": "tensorflow",
    "demand_count": "24",
    "avg_salary": "120647"
  },
  {
    "skill_id": 63,
    "skill": "cassandra",
    "demand_count": "11",
    "avg_salary": "118407"
  },
  {
    "skill_id": 219,
    "skill": "atlassian",
    "demand_count": "15",
    "avg_salary": "117966"
  },
  {
    "skill_id": 96,
    "skill": "airflow",
    "demand_count": "71",
    "avg_salary": "116387"
  },
  {
    "skill_id": 3,
    "skill": "scala",
    "demand_count": "59",
    "avg_salary": "115480"
  },
  {
    "skill_id": 169,
    "skill": "linux",
    "demand_count": "58",
    "avg_salary": "114883"
  },
  {
    "skill_id": 234,
    "skill": "confluence",
    "demand_count": "62",
    "avg_salary": "114153"
  },
  {
    "skill_id": 95,
    "skill": "pyspark",
    "demand_count": "49",
    "avg_salary": "114058"
  },
  {
    "skill_id": 18,
    "skill": "mongodb",
    "demand_count": "26",
    "avg_salary": "113608"
  },
  {
    "skill_id": 62,
    "skill": "mongodb",
    "demand_count": "26",
    "avg_salary": "113608"
  },
  {
    "skill_id": 81,
    "skill": "gcp",
    "demand_count": "78",
    "avg_salary": "113065"
  },
  {
    "skill_id": 92,
    "skill": "spark",
    "demand_count": "187",
    "avg_salary": "113002"
  },
  {
    "skill_id": 193,
    "skill": "splunk",
    "demand_count": "15",
    "avg_salary": "112928"
  },
  {
    "skill_id": 75,
    "skill": "databricks",
    "demand_count": "102",
    "avg_salary": "112881"
  },
  {
    "skill_id": 210,
    "skill": "git",
    "demand_count": "74",
    "avg_salary": "112250"
  },
  {
    "skill_id": 80,
    "skill": "snowflake",
    "demand_count": "241",
    "avg_salary": "111578"
  },
  {
    "skill_id": 6,
    "skill": "shell",
    "demand_count": "44",
    "avg_salary": "111496"
  },
  {
    "skill_id": 168,
    "skill": "unix",
    "demand_count": "37",
    "avg_salary": "111123"
  },
  {
    "skill_id": 97,
    "skill": "hadoop",
    "demand_count": "140",
    "avg_salary": "110888"
  },
  {
    "skill_id": 93,
    "skill": "pandas",
    "demand_count": "90",
    "avg_salary": "110767"
  },
  {
    "skill_id": 137,
    "skill": "phoenix",
    "demand_count": "23",
    "avg_salary": "109259"
  },
  {
    "skill_id": 25,
    "skill": "php",
    "demand_count": "29",
    "avg_salary": "109052"
  }
]

*/
