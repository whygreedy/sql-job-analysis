/*
What skills are either top demanded or top paying that required for Data Analyst Jobs
- Why? Get a bigger picture of skillset to hone for Data Analyst Jobs,
and focus on analyzing top demanded (10%) and top paying (10%) skills to pave the career path in data analysis field.
And also, looking into salary statistics with max, min, mean and median value for those skills.
*/

WITH top_skills_table AS(
    SELECT
        sub_query.*,
        ROW_NUMBER() OVER(ORDER BY demand_count DESC) AS index_dcount,
        NTILE(100) OVER(ORDER BY demand_count DESC) AS percentile_by_demand_count,
        ROW_NUMBER() OVER(ORDER BY avg_salary DESC) AS index_asalary,
        NTILE(100) OVER(ORDER BY avg_salary DESC) AS percentile_by_avg_salary
    FROM (
        SELECT
            skills_dim.skills AS skill,
            COUNT(job_postings_fact.job_id) AS demand_count,
            ROUND(AVG(salary_year_avg), 0) AS avg_salary,
            ROUND(MIN(salary_year_avg), 0) AS min_salary,
            ROUND(MAX(salary_year_avg), 0) AS max_salary,
            PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY salary_year_avg) AS median_salary
        FROM job_postings_fact
        INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
        INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
        WHERE 
            salary_year_avg IS NOT NULL AND
            job_title_short = 'Data Analyst'
        GROUP BY 
            skill
        HAVING
            COUNT(job_postings_fact.job_id) > 10
    ) AS sub_query
)

SELECT *
FROM top_skills_table
WHERE percentile_by_demand_count <=10 OR percentile_by_avg_salary <=10
ORDER BY demand_count DESC;

/*

[
  {
    "skill": "sql",
    "demand_count": "3083",
    "avg_salary": "96435",
    "min_salary": "30000",
    "max_salary": "375000",
    "median_salary": 92500,
    "index_dcount": "1",
    "percentile_by_demand_count": 1,
    "index_asalary": "69",
    "percentile_by_avg_salary": 67
  },
  {
    "skill": "excel",
    "demand_count": "2143",
    "avg_salary": "86419",
    "min_salary": "30000",
    "max_salary": "375000",
    "median_salary": 84500,
    "index_dcount": "2",
    "percentile_by_demand_count": 1,
    "index_asalary": "87",
    "percentile_by_avg_salary": 85
  },
  {
    "skill": "python",
    "demand_count": "1840",
    "avg_salary": "101512",
    "min_salary": "35000",
    "max_salary": "375000",
    "median_salary": 98500,
    "index_dcount": "3",
    "percentile_by_demand_count": 2,
    "index_asalary": "48",
    "percentile_by_avg_salary": 46
  },
  {
    "skill": "tableau",
    "demand_count": "1659",
    "avg_salary": "97978",
    "min_salary": "30000",
    "max_salary": "375000",
    "median_salary": 95000,
    "index_dcount": "4",
    "percentile_by_demand_count": 2,
    "index_asalary": "64",
    "percentile_by_avg_salary": 62
  },
  {
    "skill": "r",
    "demand_count": "1073",
    "avg_salary": "98708",
    "min_salary": "35000",
    "max_salary": "375000",
    "median_salary": 92527.5,
    "index_dcount": "5",
    "percentile_by_demand_count": 3,
    "index_asalary": "62",
    "percentile_by_avg_salary": 60
  },
  {
    "skill": "power bi",
    "demand_count": "1044",
    "avg_salary": "92324",
    "min_salary": "30000",
    "max_salary": "375000",
    "median_salary": 90000,
    "index_dcount": "6",
    "percentile_by_demand_count": 4,
    "index_asalary": "76",
    "percentile_by_avg_salary": 74
  },
  {
    "skill": "sas",
    "demand_count": "1000",
    "avg_salary": "93707",
    "min_salary": "41447",
    "max_salary": "375000",
    "median_salary": 90000,
    "index_dcount": "7",
    "percentile_by_demand_count": 5,
    "index_asalary": "74",
    "percentile_by_avg_salary": 72
  },
  {
    "skill": "word",
    "demand_count": "527",
    "avg_salary": "82941",
    "min_salary": "30000",
    "max_salary": "375000",
    "median_salary": 80850,
    "index_dcount": "8",
    "percentile_by_demand_count": 6,
    "index_asalary": "97",
    "percentile_by_avg_salary": 95
  },
  {
    "skill": "powerpoint",
    "demand_count": "524",
    "avg_salary": "88316",
    "min_salary": "30000",
    "max_salary": "255830",
    "median_salary": 85000,
    "index_dcount": "9",
    "percentile_by_demand_count": 7,
    "index_asalary": "83",
    "percentile_by_avg_salary": 81
  },
  {
    "skill": "sql server",
    "demand_count": "336",
    "avg_salary": "96191",
    "min_salary": "44100",
    "max_salary": "185000",
    "median_salary": 92500,
    "index_dcount": "10",
    "percentile_by_demand_count": 8,
    "index_asalary": "70",
    "percentile_by_avg_salary": 68
  },
  {
    "skill": "oracle",
    "demand_count": "332",
    "avg_salary": "100964",
    "min_salary": "40000",
    "max_salary": "400000",
    "median_salary": 95588.25,
    "index_dcount": "11",
    "percentile_by_demand_count": 9,
    "index_asalary": "53",
    "percentile_by_avg_salary": 51
  },
  {
    "skill": "azure",
    "demand_count": "319",
    "avg_salary": "105400",
    "min_salary": "32400",
    "max_salary": "255830",
    "median_salary": 100000,
    "index_dcount": "12",
    "percentile_by_demand_count": 10,
    "index_asalary": "38",
    "percentile_by_avg_salary": 36
  },
  {
    "skill": "airflow",
    "demand_count": "71",
    "avg_salary": "116387",
    "min_salary": "51014",
    "max_salary": "375000",
    "median_salary": 111175,
    "index_dcount": "49",
    "percentile_by_demand_count": 47,
    "index_asalary": "7",
    "percentile_by_avg_salary": 5
  },
  {
    "skill": "confluence",
    "demand_count": "62",
    "avg_salary": "114153",
    "min_salary": "57500",
    "max_salary": "189309",
    "median_salary": 111175,
    "index_dcount": "54",
    "percentile_by_demand_count": 52,
    "index_asalary": "10",
    "percentile_by_avg_salary": 8
  },
  {
    "skill": "scala",
    "demand_count": "59",
    "avg_salary": "115480",
    "min_salary": "50000",
    "max_salary": "234000",
    "median_salary": 111175,
    "index_dcount": "56",
    "percentile_by_demand_count": 54,
    "index_asalary": "8",
    "percentile_by_avg_salary": 6
  },
  {
    "skill": "linux",
    "demand_count": "58",
    "avg_salary": "114883",
    "min_salary": "50000",
    "max_salary": "400000",
    "median_salary": 112150,
    "index_dcount": "58",
    "percentile_by_demand_count": 56,
    "index_asalary": "9",
    "percentile_by_avg_salary": 7
  },
  {
    "skill": "mongodb",
    "demand_count": "52",
    "avg_salary": "113608",
    "min_salary": "48000",
    "max_salary": "204585",
    "median_salary": 111837.5,
    "index_dcount": "61",
    "percentile_by_demand_count": 59,
    "index_asalary": "12",
    "percentile_by_avg_salary": 10
  },
  {
    "skill": "pyspark",
    "demand_count": "49",
    "avg_salary": "114058",
    "min_salary": "53014",
    "max_salary": "255830",
    "median_salary": 111175,
    "index_dcount": "62",
    "percentile_by_demand_count": 60,
    "index_asalary": "11",
    "percentile_by_avg_salary": 9
  },
  {
    "skill": "kafka",
    "demand_count": "40",
    "avg_salary": "129999",
    "min_salary": "51014",
    "max_salary": "400000",
    "median_salary": 115095,
    "index_dcount": "66",
    "percentile_by_demand_count": 64,
    "index_asalary": "1",
    "percentile_by_avg_salary": 1
  },
  {
    "skill": "tensorflow",
    "demand_count": "24",
    "avg_salary": "120647",
    "min_salary": "77500",
    "max_salary": "198000",
    "median_salary": 105000,
    "index_dcount": "82",
    "percentile_by_demand_count": 80,
    "index_asalary": "4",
    "percentile_by_avg_salary": 2
  },
  {
    "skill": "pytorch",
    "demand_count": "20",
    "avg_salary": "125226",
    "min_salary": "70000",
    "max_salary": "220000",
    "median_salary": 107000,
    "index_dcount": "86",
    "percentile_by_demand_count": 84,
    "index_asalary": "2",
    "percentile_by_avg_salary": 1
  },
  {
    "skill": "perl",
    "demand_count": "20",
    "avg_salary": "124686",
    "min_salary": "56700",
    "max_salary": "186500",
    "median_salary": 119550,
    "index_dcount": "87",
    "percentile_by_demand_count": 85,
    "index_asalary": "3",
    "percentile_by_avg_salary": 2
  },
  {
    "skill": "atlassian",
    "demand_count": "15",
    "avg_salary": "117966",
    "min_salary": "65000",
    "max_salary": "190000",
    "median_salary": 102500,
    "index_dcount": "94",
    "percentile_by_demand_count": 92,
    "index_asalary": "6",
    "percentile_by_avg_salary": 4
  },
  {
    "skill": "cassandra",
    "demand_count": "11",
    "avg_salary": "118407",
    "min_salary": "53014",
    "max_salary": "204585",
    "median_salary": 111175,
    "index_dcount": "102",
    "percentile_by_demand_count": 100,
    "index_asalary": "5",
    "percentile_by_avg_salary": 3
  }
]

*/