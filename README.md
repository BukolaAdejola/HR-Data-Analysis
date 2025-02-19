# HR Data Analysis


![Hr pix](https://github.com/user-attachments/assets/37f9bba2-2f4a-4fd3-98dd-8458eed53138)
## Table of Content
- [Introduction](#Introduction)
- [Data Highlights](#Data-Highlights)
- [Project Goal](#Project-Goal)
- [Data Scrubbing](#Data-Scrubbing)
- [Data Analysis](#Data-Analysis)
- [Recommendation](#Recommendation)
- [Conclusion](#Conclusion)

## Introduction
This comprehensive dataset offers a unique opportunity to explore organizational dynamics, information on employees,
and workforce trends, encompassing various aspects of their personal details and employment. By analyzing this data,
we can uncover insights into employee retention, career progression, and organizational performance.

## Data Highlights
The table used contains15 columns and 22214 rows
- HR ID: Unique identifier for each employee.
- First Name: Employee’s first name
- Last Name: Employee's last name.
- Birthdate: Employee's date of birth.
- Gender: Employee’s gender
- Race:  Employee’s demographic information.
- Department: Employee’s department
- Job Title: Employee's work assignment.
- Location: Workplace location.
- Hire Date: Employment start date
- Termination Date: Employment end date.
- Location City: City of workplace 
- Location State: State information of the workplace.
- Tenure: Duration of the employee's service.
- Age: Current age of the employee.

## Project Goal
1. What is the gender breakdown in the Company?
2. How many employees work remotely for each department? 
3. What is the distribution of employees who work remotely and HQ 
4. What is the race distribution in the Company? 
5. What is the distribution of employee across different states?
6. What is the number of employees whose employment has been terminated
7. Who is/are the longest serving employee in the organization.
8. Return the terminated employees by their race 
9. What is the age distribution in the Company?
10. How have employee hire counts varied over time? 
11. What is the tenure distribution for each department? 
12. What is the average length of employment in the company?

## Data Scrubbing
- Change table name
  ```
  Sql
 Select * from classdb.`hr data`;
Rename table `hr data` to hr_data;
```
- Rename column name
```
Sql
Alter table hr_data
rename column `birthdate` to birth_date;

set SQL_SAFE_UPDATES = 0;
update hr_data
set birth_date = replace(birth_date, "/", "-");

update hr_data
set birth_date = str_to_date(birth_date,"%YYYY/%d/%m");

update hr_data
set birth_date = str_to_date(birth_date,"%m/%d/%Y");

update hr_data
set birth_date = date_sub(birth_date, interval 100 year)
where year (birth_date) > 2002;
```
- Add New column Age
```
Sql
Alter table hr_data
 add column Age int;
 
 update hr_data
 set Age = ceil(datediff(current_date(),birth_date)/365);
 ```
## Data Analysis
1.	What is the gender breakdown in the Company?
Insights: The company has 11288 males, 10321 females and 605 non-conforming.
2.	How many employees work remotely for each department?
Department			Work remotely
Insights: Product management		157 
	  Legal					63
	  Accounting				859
	  Business Development		410
	  Human Resources			467
	  Engineering				1616
3.	What is the distribution of employees who work remotely and HQ
Insights: 16715 employees work in the headquarter while 5499 work remotely.
4.	What is the race distribution in the Company?
Insights:	Race			     Distribution
		Hispanic or Latino		2501
		White				6328
		Black or African American	3619
		Two or more races		3648
		Asian				3562
		American Indian or Alaska	1327

5.	What is the distribution of employee across different states? 
Insights:	State				Distribution
		Ohio				    18025
		Michigan			     673
		Pennsylvania			     1115
		Wisconsin			      382
		Illinois				       868
		Indiana				       700
6.	What is the number of employees whose employment has been terminated.
Insights: 2662 employees has been terminated.
7.	Who is/are the longest serving employee in the organization.
Insights: 
8.	Return the terminated employees by their race.
Insights:	Race			     Terminated
		Hispanic or Latino		278
		White				759
		Black or African American	437
		Two or more races		437
		Asian				432
		Native Hawaiian 		164

9.	What is the age distribution in the Company? 
Insights:	Age Group		Age Distribution
		20-29				3996
		30-39				6111
		40-49				5923
		50-59				6184
10.	How have employee hire counts varied over time? 
Insights: Hire-Year-Group 		Count
		2000-2005			5783
		2006-2010			5555
		2011-2015			5421
		2016-2020			5455
11.	What is the tenure distribution for each department? 
Insights:	Department		Distribution
		Marketing		    13.8
		Legal			     14.0
		Sales			     14.2
		Services		      14.2
		Support		       14.2
		Business Dev		        14.3

12.	What is the average length of employment in the company?
Insights: the average length of employment is 14.31.

## Recommendation
Recommendations
1. Diversity and Inclusion: Develop strategies to improve diversity and inclusion, particularly for underrepresented racial groups.
2. Remote Work Policy: Review and refine the remote work policy to ensure it's fair, effective, and aligns with business goals.
3. Employee Retention: Implement programs to improve employee retention, especially for employees with 10+ years of service.
4. Succession Planning: Develop a succession planning strategy to ensure continuity and minimize the impact of employee turnover.
5. Employee Engagement: Foster employee engagement through regular feedback, recognition, and opportunities for growth and development.

## Conclusion
The company has a diverse workforce, but there's room for improvement in representation and inclusion. Remote Work: Remote work is a significant aspect
 of the company's work arrangement, with nearly 25% of employees working remotely.Employee Tenure: Employees tend to stay with the company for an extended
period, with an average tenure of 14.31 years. Hiring Trends: Hiring trends indicate a consistent flow of new employees, with a slight decrease in recent years.
 Termination rates are relatively low, but it's essential to monitor and address any underlying issues.








