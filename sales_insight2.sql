Select * from Portfolioproject_new..salesdata

--Taking a look at the product which were sold most
Select [Product line],sum(Quantity) as num_of_units_sold
from Portfolioproject_new..salesdata
group by [Product line]
order by num_of_units_sold desc

--most revenue out of which product line
Select [Product line],round(sum(Total),2) as Total
from Portfolioproject_new..salesdata
group by [Product line]
order by Total desc

--Adding new column for finding the profit
alter table portfolioproject_new..salesdata
add profit numeric

--average gross income(month wise)
Select month,round(avg([gross income]),2)as avg_income
from Portfolioproject_new..salesdata
group by month
order by avg_income desc

--product line wise average gross income
Select [Product line],round(sum([gross income]),2)as income
from Portfolioproject_new..salesdata
group by [Product line]
order by income desc

--Popular payment modes according to city
Select city,Payment, count(Payment) as count_of_payments
from Portfolioproject_new..salesdata
group by city,Payment
order by City desc


--Most and least profitable city
Select city, round(sum([gross income]),5) as income
from Portfolioproject_new..salesdata
group by city
order by income desc

--which type of custome provided the most and least revenue
Select [Customer type],sum([gross income]) as income
from Portfolioproject_new..salesdata
group by [Customer type]

--which is branch is most or least profitable
Select Branch, sum([gross income])as income
from Portfolioproject_new..salesdata
group by Branch

--which city has sold how much types of product line
select city,[Product line], count([Product line]) as product_line
from portfolioproject_new..salesdata
group by city,[Product line]
order by City

--which produt have highest and which have lowest ratings
select [Product line], round(Avg(Rating),2) as  ratings
from Portfolioproject_new..salesdata
group by [Product line]

--which gender is the highest revenue source
Select Gender, round(avg([gross income]),3) as avg_income
from Portfolioproject_new..salesdata
group by Gender

--highest and lowest gender of purchaser in cities

Select City,Gender, count(Gender) as count_gender
from Portfolioproject_new..salesdata
group by City,Gender
