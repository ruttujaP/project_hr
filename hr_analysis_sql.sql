
use projects_r;

create table hr_emp (
Age	int not null,
Attrition varchar(20) not null,
BusinessTravel	varchar(20) not null,
Department	varchar(30) not null,
DistanceFromHome	varchar(20) not null,
EducationField	varchar(40) not null,
EmployeeNumber	int not null,
EnvironmentSatisfaction	varchar(10) not null,
Gender	varchar(10) not null,
HourlyRate	int not null,
JobRole	varchar(30) not null,
JobSatisfaction	varchar(10) not null,
MaritalStatus	varchar(20) not null,
MonthlyIncome	int not null,
MonthlyRate	 int not null,
NumCompaniesWorked	int not null,
Over18	varchar(10) not null,
OverTime	 varchar(10) not null,
PercentSalaryHike	varchar(10) not null,
PerformanceRating	varchar(10) not null,
StandardHours	int not null,
TotalWorkingYears	int not null,
YearsAtCompany	int not null,
YearsInCurrentRole	int not null,
YearsSinceLastPromotion int not null,
YearsWithCurrManager int not null
);

drop table hr_emp;

select * from hr_emp limit 10;


------------------------------------------------------------------------------------------------------------------
#  1] total no of employees 
select count(EmployeeNumber ) as total_no_of_employees
from hr_emp;

------------------------------------------------------------------------------------------------------

# 2] no of employees dept. wise

select Department   ,count(EmployeeNumber ) as total_no_of_employees 
from hr_emp
group by Department
order by total_no_of_employees desc;

------------------------------------------------------------------------------------------
# 3] how many employees left the company 

select count(EmployeeNumber ) as total_no_of_employees 
from hr_emp
where Attrition='Yes';
---------------------------------------------------------------------------------------------------------

# 4] what is the attrition rate 
with attrition as (select count(EmployeeNumber ) as total, (select count(EmployeeNumber) from hr_emp   where Attrition='Yes') as attrition_count from hr_emp)
select round((attrition_count /total)*100,2)  as attrition_rate from attrition ;

----------------------------------------------------------------------------------------------------------
# 5] dept wise avg hourly rate 

select Department , round(avg(HourlyRate),2) as avg_hourly_rate
from hr_emp
group by Department
order by avg_hourly_rate desc;


------------------------------------------------------------------------------------------------------
# 6] no of employees with given percent salary hike 

select * from hr_emp limit 10;

select PercentSalaryHike, count(EmployeeNumber) as total_emp
from hr_emp;
------------------------------------------------------------------------------------------

# 7] 






