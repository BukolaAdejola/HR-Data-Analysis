SELECT * FROM classdb.`hr data`;
Rename table `hr data` to hr_data;
SELECT * FROM hr_data;
Alter table hr_data
rename column `ï»¿id` to HR_Id;

Alter table hr_data
rename  column `birthdate`to birth_date;

set SQL_SAFE_UPDATES = 0;
update hr_data
set birth_date = replace(birth_date, "/", "-");

update hr_data
set birth_date = replace(birth_date, "-", "/");

update hr_data
set birth_date = str_to_date(birth_date,"%YYYY/%d/%m");

select * from hr_data
where birth_date = "1975/04/02";
update hr_data
set birth_date = replace(birth_date,"1975/04/02", "02/04/1975");

update hr_data
set birth_date = str_to_date(birth_date,"%m/%d/%Y");

update hr_data
set birth_date = date_sub(birth_date, interval 100 year)
where year (birth_date) > 2002;
select * from hr_data;

update hr_data
set hire_date = replace(hire_date, "-", "/");

update hr_data
set hire_date = str_to_date(hire_date,"%m/%d/%Y");

-- 1. What is the gender breakdown in the Company? 
select gender, count(gender) as count_gender from hr_data
group by gender;

-- 2. How many employees work remotely for each department? 
select department,count(department) as count_employee, location  from hr_data
where location = "Remote"
group by department;

-- 3. What is the distribution of employees who work remotely and HQ 
select location, count(location) as distribution from hr_data
group by location;

-- 4. What is the race distribution in the Company?
select race, count(race) as distribution from hr_data
group by race;

-- 5. What is the distribution of employee across different states? 
select location_state, count(department) as distribution_of_employee from hr_data
group by location_state;

-- 6. What is the number of employees whose employment has been terminated 
select * from hr_data where date(termdate)<= current_date();
select count(date(termdate)) as terminated_employees from hr_data
where date(termdate)<= current_date();

-- 7. Who is/are the longest serving employee in the organization. 
select concat_ws(" ", first_name, last_name) as full_name, current_date(), hire_date, ceil(datediff(current_date,hire_date)/365) as longest_employee from hr_data
order by longest_employee desc;

select concat_ws("-", first_name, Last_name) as full_name, hire_date from hr_data
order by hire_date asc;

-- 8. Return the terminated employees by their race 
select race, count(termdate) as count from hr_data
where date(termdate) <= current_date()
group by race
order by count desc;

-- 9. What is the age distribution in the Company?
 
 Alter table hr_data
 add column Age int;
 
 update hr_data
 set Age = ceil(datediff(current_date(),birth_date)/365);
 
 select min(Age) as Min, Max(Age) as Max from Hr_data;
 select case
			when
			age< 30 then "20-29"
            when
            age < 40 then "30-39"
            when
			age < 50 then "40-49"
            else "50-59" end  as age_group, count(*) as Age_distribution from hr_data
group by Age_group
order by Age_distribution desc;
            
 
-- 10. How have employee hire counts varied over time?         
select min(year(hire_date)) as min, max(year(hire_date)) as max from hr_data;
select case
			when year(hire_date) <= 2005 then "2000-2005"
            when year(hire_date) <= 2010 then "2006-2010"
            when year(hire_date) <= 2015 then "2011-2015"
            when year(hire_date) <= 2020 then "2016-2020"
		end as Hire_Year_Group, count(*) as count_over_time from hr_data
        group by Hire_Year_Group
        order by Count_over_time desc;
        
-- 11. What is the tenure distribution for each department? 
select department, round(avg(datediff(current_date(),hire_date)/365),1) as date_of_employment from hr_data
group by 1
order by 2;

-- 12. What is the average length of employment in the company? 
select  round(Avg(datediff(current_date(), hire_date)/365),2) as avg_length from hr_data;
