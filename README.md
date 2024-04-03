# Introduction

Explore data from job market, and focusing on data analyst roles.\
As a job seeker 👩‍💻 in the realm of data analysis, you may be curious about the skills that are in high demand 📈 and come with attractive salaries 💰.\
Additionally, you might be interested in learning about the skills that can elevate your skillset and pave the way for pursuing higher-paying roles in the field of data analytics.

🔍 Check out SQL queries here : [sql_query folder](/sql_query/)

# Background

To refine my SQL skill and prepare for job hunting in data analyst roles, I've discovered a project within an [online course](https://youtu.be/7mz73uXD9DA?si=f16EWPUbsigblMZy) that aligns perfectly with my goals. Special thanks to Luke Barousse, I learned a lot from your course.

Data hails from Luke Barousse's [SQL Course](https://lukebarousse.com/sql). It's packed with insights on job titles, salaries, locations, and essential skills.

### The questions I wanted to answer through my SQL queries were:

1. What are the top-paying data analyst jobs?
2. What skills are required for these top-paying jobs?
3. What skills are most in demand for data analysts?
4. Which skills are associated with higher salaries?
5. What are the most optimal skills to learn?

# Tools I Used

To delve into the data analyst job market, I leveraged the power of several key tools:

- **SQL:** The backbone of my analysis, allowing me to query the database and unearth critical insights.
- **PostgreSQL:** The chosen database management system, ideal for handling the job posting data.
- **Visual Studio Code:** My go-to for database management and executing SQL queries.

# The Analysis

### 1. Top Paying Data Analyst Jobs

```sql
SELECT
    job_id,
    job_title,
    company_dim.name AS company_name,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date
FROM
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 10;
```

### 2. Skills Required For Top Paying Data Analyst Jobs

```sql
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
```

- **Must-have skills:** SQL, Python, Excel and R are the most common skills mentioned, indicating their significance in the field of data analysis.
- **Cloud Computing and Big Data:** Knowledge of cloud-based data warehouse solutions like BigQuery and Snowflake, along with tools for data streaming and workflow management like Kafka, Spark, and Airflow, underscores the shift towards cloud-based analytics and real-time data processing in modern data analysis roles.
- These insights suggest that a combination of languages (SQL, Python, R), data visualization tools (Tableau, Looker), big data tools (BigQuery, Kafka, Snowflake), and version control systems (Git, GitHub) are highly valued in data analyst roles.

### 3. Top Demanded Skills For Data Analyst Jobs

```sql
SELECT
    skills,
    COUNT(job_postings_fact.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
GROUP BY skills
ORDER BY demand_count DESC
LIMIT 5;
```

- The top 5 skills with the highest demand for data analysts encompass a mix of technical and analytical capabilities, including proficiency in querying languages (SQL), data manipulation tools (Excel), programming languages (Python), and data visualization platforms (Tableau, Power BI).

### 4. Top Paying Skills For Data Analyst Jobs

```sql
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
```

- **Specialized and Emerging Technologies:** High-paying skills like Solidity, DataRobot, mxnet, and GoLang indicate a demand for expertise in specialized and emerging technologies, reflecting industry adoption of new tools.
- **Convergence of Data Analysis and DevOps:** Skills in infrastructure management (Terraform, VMware), automation (Puppet, Ansible), and version control (GitLab, Bitbucket) suggest a merging of data analysis and DevOps practices, emphasizing the importance of efficient workflows.
- **Focus on Machine Learning, Big Data, and Collaboration:** The presence of ML frameworks (Keras, PyTorch, TensorFlow), big data platforms (Kafka, Cassandra), and collaboration tools (Notion, Atlassian) underscores the importance of skills in AI, big data processing, and collaboration platforms for modern data analysts.

### 5. Top 25 Optimal Skills For Data Analyst Jobs

```sql
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
```

**1. Emergence of Big Data Technologies:**

- High-demand skills such as Kafka, PyTorch, TensorFlow, and Apache Hadoop signify the increasing importance of big data technologies in data analysis roles.
- Companies are actively seeking professionals proficient in these tools to handle large volumes of data and derive valuable insights.

**2. Cloud Computing and Data Management:**

- Skills related to cloud platforms like GCP (Google Cloud Platform), Snowflake, and Databricks are in high demand, indicating the shift towards cloud-based data management and analytics solutions.
- Organizations are leveraging cloud services for scalable storage, processing, and analysis of data, leading to increased demand for professionals with expertise in cloud-based analytics tools.

**3. Automation and Workflow Management:**

- Tools such as Airflow, Git, and Atlassian are indicative of the growing need for automation and efficient workflow management in data analysis processes.
- Companies are seeking candidates who can streamline data pipelines, automate repetitive tasks, and collaborate effectively within teams using version control and project management tools.

Overall, the trends suggest a strong emphasis on advanced analytics, big data technologies, cloud computing, and automation in data analyst roles, reflecting the evolving needs of organizations to derive insights and make data-driven decisions efficiently.

# What I Learned

# Conclusions
