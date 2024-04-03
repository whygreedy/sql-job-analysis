/*
What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Analyst positions
- Focuses on roles with specified salaries, regardless of location
- Why? It reveals how different skills impact salary levels for Data Analyst and 
    helps identify the most financially rewarding skills to acquire or improve
*/

SELECT
    skills AS skill,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary,
    COUNT(job_postings_fact.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
    salary_year_avg IS NOT NULL AND
    job_title_short = 'Data Analyst'
GROUP BY skill
ORDER BY avg_salary DESC
LIMIT 25;

/*

Specialized and Emerging Technologies: High-paying skills like Solidity, DataRobot, mxnet, and GoLang indicate a demand for expertise in specialized and emerging technologies, reflecting industry adoption of new tools.

Convergence of Data Analysis and DevOps: Skills in infrastructure management (Terraform, VMware), automation (Puppet, Ansible), and version control (GitLab, Bitbucket) suggest a merging of data analysis and DevOps practices, emphasizing the importance of efficient workflows.

Focus on Machine Learning, Big Data, and Collaboration: The presence of ML frameworks (Keras, PyTorch, TensorFlow), big data platforms (Kafka, Cassandra), and collaboration tools (Notion, Atlassian) underscores the importance of skills in AI, big data processing, and collaboration platforms for modern data analysts.

[
  {
    "skill": "svn",
    "avg_salary": "400000",
    "demand_count": "1"
  },
  {
    "skill": "solidity",
    "avg_salary": "179000",
    "demand_count": "1"
  },
  {
    "skill": "couchbase",
    "avg_salary": "160515",
    "demand_count": "1"
  },
  {
    "skill": "datarobot",
    "avg_salary": "155486",
    "demand_count": "1"
  },
  {
    "skill": "golang",
    "avg_salary": "155000",
    "demand_count": "2"
  },
  {
    "skill": "mxnet",
    "avg_salary": "149000",
    "demand_count": "2"
  },
  {
    "skill": "dplyr",
    "avg_salary": "147633",
    "demand_count": "3"
  },
  {
    "skill": "vmware",
    "avg_salary": "147500",
    "demand_count": "1"
  },
  {
    "skill": "terraform",
    "avg_salary": "146734",
    "demand_count": "3"
  },
  {
    "skill": "twilio",
    "avg_salary": "138500",
    "demand_count": "2"
  },
  {
    "skill": "gitlab",
    "avg_salary": "134126",
    "demand_count": "7"
  },
  {
    "skill": "kafka",
    "avg_salary": "129999",
    "demand_count": "40"
  },
  {
    "skill": "puppet",
    "avg_salary": "129820",
    "demand_count": "2"
  },
  {
    "skill": "keras",
    "avg_salary": "127013",
    "demand_count": "3"
  },
  {
    "skill": "pytorch",
    "avg_salary": "125226",
    "demand_count": "20"
  },
  {
    "skill": "perl",
    "avg_salary": "124686",
    "demand_count": "20"
  },
  {
    "skill": "ansible",
    "avg_salary": "124370",
    "demand_count": "2"
  },
  {
    "skill": "hugging face",
    "avg_salary": "123950",
    "demand_count": "2"
  },
  {
    "skill": "tensorflow",
    "avg_salary": "120647",
    "demand_count": "24"
  },
  {
    "skill": "cassandra",
    "avg_salary": "118407",
    "demand_count": "11"
  },
  {
    "skill": "notion",
    "avg_salary": "118092",
    "demand_count": "6"
  },
  {
    "skill": "atlassian",
    "avg_salary": "117966",
    "demand_count": "15"
  },
  {
    "skill": "bitbucket",
    "avg_salary": "116712",
    "demand_count": "6"
  },
  {
    "skill": "airflow",
    "avg_salary": "116387",
    "demand_count": "71"
  },
  {
    "skill": "scala",
    "avg_salary": "115480",
    "demand_count": "59"
  }
]

*/
