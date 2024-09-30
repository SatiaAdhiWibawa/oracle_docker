-- batter than if else or case
select 
  sum(case when gender = 'M' then 1 end) as male_count,
  sum(case when gender = 'F' then 1 end) as female_count 
from patients;

SELECT 
  SUM(Gender = 'M') as male_count, 
  SUM(Gender = 'F') AS female_count
FROM patients


================================================================================================
select
	distinct(p.patient_id),
    concat(p.patient_id, len(last_name),year(birth_date)) as temp_password -- using concat batter than ||
    -- p.patient_id || floor(len(last_name)) || floor(year(birth_date)) as temp_password
from patients p
join admissions a on a.patient_id = p.patient_id;



================================================================================================
-- Each admission costs $50 for patients without insurance, and $10 for patients with insurance. 
-- All patients with an even patient_id have insurance.
-- Give each patient a 'Yes' if they have insurance, and a 'No' if they don't have insurance. 
-- Add up the admission_total cost for each has_insurance group.

select
	case
    when patient_id % 2 = 0 then 'Yes'
	when patient_id % 2 = 1 then 'No'
    end as has_insurance,
    case
    when patient_id % 2 = 0 then count(patient_id % 2 = 0) * 10
	when patient_id % 2 = 1 then count(patient_id % 2 = 1) * 50
    end as cost_after_insurance
from admissions
group by has_insurance;

-- 
select has_insurance,sum(admission_cost) as admission_total
from
(
   select patient_id,
   case when patient_id % 2 = 0 then 'Yes' else 'No' end as has_insurance,
   case when patient_id % 2 = 0 then 10 else 50 end as admission_cost
   from admissions
)
group by has_insurance

-- using union


================================================================================================
-- Show the provinces that has more patients identified as 'M' than 'F'. 
-- Must only show full province_name

select 
    province_name
from patients p
join province_names pn ON pn.province_id = p.province_id
group by province_name
having 
	sum(gender = 'M') > sum(gender = 'F');
	--count(case when p.gender = 'M' then 1 end) >
	--count(case when p.gender = 'F' then 1 end);


================================================================================================
-- Show the percent of patients that have 'M' as their gender. 
-- Round the answer to the nearest hundreth number and in percent form.


SELECT
  round(100 * avg(gender = 'M'), 2) || '%' AS percent_of_male_patients
FROM
  patients;


select
concat(
ROUND(
        (COUNT(CASE WHEN gender = 'M' THEN 1 END) * 100.0) / COUNT(*), 
        2
 ), '%') AS male_percentage
from patients;


================================================================================================
-- For each day display the total amount of admissions on that day. 
-- Display the amount changed from the previous date.


-- LAG() adalah fungsi analitik yang digunakan untuk melihat nilai dari baris sebelumnya tanpa perlu menulis subquery.

select
	admission_date,
    count(admission_date) admission_day,
   	count(admission_date) - LAG(count(admission_date)) OVER(order by admission_date) admission_count_change
from admissions
group by admission_date;


-- using CTE 
-- apa itu CTE
-- Common Table Expression (CTE) adalah subquery yang didefinisikan di awal query dan dapat digunakan di dalam query utama.
WITH admission_counts_table AS (
  SELECT admission_date, COUNT(patient_id) AS admission_count
  FROM admissions
  GROUP BY admission_date
  ORDER BY admission_date DESC
)
select
  admission_date, 
  admission_count, 
  admission_count - LAG(admission_count) OVER(ORDER BY admission_date) AS admission_count_change 
from admission_counts_table

================================================================================================

-- Sort the province names in ascending order in such a way that the province 'Ontario' is always on top.
select province_name
from province_names
order by
  province_name = 'Ontario' desc,
  province_name

-- using case
SELECT province_name
FROM province_names
ORDER BY
  CASE
    WHEN province_name = 'Ontario' THEN 1
    ELSE province_name
  END

================================================================================================