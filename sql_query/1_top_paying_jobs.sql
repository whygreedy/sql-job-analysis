/*
Find the top-paying data analyst jobs
- Identify the top 10 highest-paying Data Analyst roles. 
- Focuses on job postings with specified salaries (remove nulls).
- Why? Highlight the top-paying opportunities for Data Analyst, offering insights into employment opportunities.
*/

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

/*

[
  {
    "job_id": 226942,
    "job_title": "Data Analyst",
    "company_name": "Mantys",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "650000.0",
    "job_posted_date": "2023-02-20 15:13:33"
  },
  {
    "job_id": 209315,
    "job_title": "Data base administrator",
    "company_name": "ЛАНИТ",
    "job_location": "Belarus",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "400000.0",
    "job_posted_date": "2023-10-03 11:22:20"
  },
  {
    "job_id": 229253,
    "job_title": "Director of Safety Data Analysis",
    "company_name": "Torc Robotics",
    "job_location": "Austin, TX",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "375000.0",
    "job_posted_date": "2023-04-21 08:01:55"
  },
  {
    "job_id": 1147675,
    "job_title": "Sr Data Analyst",
    "company_name": "Illuminate Mission Solutions",
    "job_location": "Bethesda, MD",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "375000.0",
    "job_posted_date": "2023-04-05 12:00:12"
  },
  {
    "job_id": 1110602,
    "job_title": "HC Data Analyst , Senior",
    "company_name": "Illuminate Mission Solutions",
    "job_location": "Bethesda, MD",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "375000.0",
    "job_posted_date": "2023-08-18 07:00:22"
  },
  {
    "job_id": 641501,
    "job_title": "Head of Infrastructure Management & Data Analytics - Financial...",
    "company_name": "Citigroup, Inc",
    "job_location": "Jacksonville, FL",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "375000.0",
    "job_posted_date": "2023-07-03 11:30:01"
  },
  {
    "job_id": 1059665,
    "job_title": "Data Analyst",
    "company_name": "Anthropic",
    "job_location": "San Francisco, CA",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "350000.0",
    "job_posted_date": "2023-06-22 07:00:59"
  },
  {
    "job_id": 101757,
    "job_title": "Head of Data Analytics",
    "company_name": "Care.com",
    "job_location": "Austin, TX",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "350000.0",
    "job_posted_date": "2023-10-23 05:01:05"
  },
  {
    "job_id": 547382,
    "job_title": "Director of Analytics",
    "company_name": "Meta",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "336500.0",
    "job_posted_date": "2023-08-23 12:04:42"
  },
  {
    "job_id": 894135,
    "job_title": "Research Scientist",
    "company_name": "OpenAI",
    "job_location": "San Francisco, CA",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "285000.0",
    "job_posted_date": "2023-04-19 18:04:21"
  }
]

*/
