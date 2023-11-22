create database project; 
use project;
show tables;
select count(*) from finance_1;
select count(*) from finance_2;

# KPI 1:-Year wise loan amount Stats
select year(issue_d) as issue_years, concat('$',format (sum(loan_amnt),2))  as total_amount
from finance_1
group by issue_d
order by issue_d;

## KPI-2:Grade and sub grade wise revol_bal
Select f1.grade, f1.sub_grade, sum(f2.revol_bal) as revolving_bal 
from finance_1 as f1 inner join finance_2 as f2 
on f1.id = f2.id group by f1.grade, f1.sub_grade order by grade;

## KPI-3: Total Payment for Verified Status Vs Total Payment for Non Verified Status
select f1.verification_status,sum(f2.total_pymnt) as total_payment
from finance_1 as f1 inner join finance_2 as f2
on f1.id = f2.id
group by f1.verification_status;

## KPI-4-State wise and last_credit_pull_d wise loan status

select count(*) from finance_1;

 select addr_state, loan_status, count(loan_status)
from finance_1
group by addr_state,loan_status;
 
 ## KPI-5-Home ownership Vs last payment date stats
 
 select year(f2.last_pymnt_d) payment_year, monthname(f2.last_pymnt_d) payment_month, f1.home_ownership, count(f1.home_ownership) home_ownership
from finance_1 as f1 inner join finance_2 as f2
on f1.id = f2.id
group by year(f2.last_pymnt_d), monthname(f2.last_pymnt_d), f1.home_ownership
order by payment_year;

 