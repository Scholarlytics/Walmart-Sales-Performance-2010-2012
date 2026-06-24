use Mike
go
--Displaying the first 5 Records from the sheet to verify imported data
select top 5* from [Walmart Sheet1]
-- Question1 : Average weekly sales by store during holiday and regular weeks
select Store,
case
when Holiday_Flag = 1then 'Holiday Week'
else 'Regular Week'
end as Week_Type,
avg (Weekly_Sales) as Avg_Weekly_Sales
from [Walmart Sheet1]
Group by Store, Holiday_Flag
-- Question 2: Comparing holiday vs non holiday sales
select case
when Holiday_Flag = 1then 'Holiday Week'
else 'Regular Week'
end as Week_Type,
avg (Weekly_Sales) as Avg_Weekly_Sales
from [Walmart Sheet1]
Group by Holiday_Flag
-- Question 3:Top 5 and bottom 5 performing stores by rank
--a. Top 5 stores
select top 5 store,
sum (Weekly_Sales) as Total_Sales
from [Walmart Sheet1]
group by store
order by Total_Sales Desc
-- b.Bottom 5 stores
select top 5 store,
sum (Weekly_Sales) as Total_Sales
from [Walmart Sheet1]
group by store
order by Total_Sales asc
-- Q4:Total sales by store
Select Store,
sum (Weekly_Sales) as Total_Sales
from [Walmart Sheet1]
group by store
order by Total_Sales
--Q5: Monthly sales trend
select year (date) as  Sales_Year,
month (date) as Sales_Month,
sum (Weekly_Sales) as Monthly_Sales
from [Walmart Sheet1]
group by year (date), month (date)
order by Sales_Year, Sales_Month
--Q6: Yearly sales trend
select year (date) as  Sales_Year,
sum (Weekly_Sales) as Total_Sales
from [Walmart Sheet1]
group by year (date)
order by Sales_Year
--Q7: Highest sales week
select top 1 date,
sum (Weekly_Sales) as Total_Weekly_Sales
from [Walmart Sheet1]
group by date
order by Total_Weekly_Sales Desc
--Q8: Total sales during holidays
select
sum (Weekly_Sales) as Holiday_Sales
from [Walmart Sheet1]
where Holiday_Flag=1
-- Q9: Overall store with highest sales
select top 1 Store,
sum (Weekly_Sales) as Total_Sales
from [Walmart Sheet1]
group by Store
order by Total_Sales Desc
--Q10: Overall store with lowest sales
select top 1 Store,
sum (Weekly_Sales) as Total_Sales
from [Walmart Sheet1]
group by Store
order by Total_Sales asc
--Q11: Month with highest sales
select top 1 Month (Date) as Sales_Month,
sum (Weekly_Sales) as Total_Sales
from [Walmart Sheet1]
group by Month (Date)
order by Total_Sales Desc
--Q12: Month with lowest sales
select top 1 Month (Date) as Sales_Month,
sum (Weekly_Sales) as Total_Sales
from [Walmart Sheet1]
group by Month (Date)
order by Total_Sales asc
--q13: Year with highest total sales
select top 1 Year (Date) as Sales_Year,
sum (Weekly_Sales) as Total_Sales
from [Walmart Sheet1]
group by year (Date)
order by Total_Sales desc
--b. year with lowest total sales
select top 1 Year (Date) as Sales_Year,
sum (Weekly_Sales) as Total_Sales
from [Walmart Sheet1]
group by year (Date)
order by Total_Sales asc
--q14: Store with highest single week sales
select top 1 store,
date,Weekly_Sales 
from [Walmart Sheet1]
order by Weekly_Sales desc
--q15: Average CpI by Year
select
year (date) as Sales_Year,
avg (CPI) as Avg_CPI
from [Walmart Sheet1]
group by year (date)
order by Sales_Year
--q16: weeks with highest cpi values
select top 10
date, CPI
from [Walmart Sheet1]
order by CPI desc
--q17: Compare sales during high cpi vs low cpi
with CPI_Group as (
select *, case 
when CPI> (select avg (CPI)
from [Walmart Sheet1])
then 'High CPI'
else 'Low CPI'
end as CPI_Category
from [Walmart Sheet1])
select CPI_Category,
avg (Weekly_Sales) as Avg_Sales
from CPI_Group
group by CPI_Category
--q18: average unemployment rate per year
select year (Date) as Sales_Year,
avg (Unemployment) as Avg_Unemployment
from [Walmart Sheet1]
group by year (date)
order by Sales_Year
--q19: weeks with highest unemployment rates
select top 10 date,
unemployment
from [Walmart Sheet1]
order by Unemployment desc
---q20: compare average sales during high unemployment vs low unemployment
with Unemployment_Group as (
Select *,
case when Unemployment > (select
avg (unemployment) from [Walmart Sheet1])
then 'High Unemployment'
else 'Low Unemployment'
end as Employment_Status
from [Walmart Sheet1])
select Employment_Status,
avg (Weekly_Sales) as Avg_Sales
from Unemployment_Group
group by Employment_Status



