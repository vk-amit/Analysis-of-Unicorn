Use unicorncompanies;

select count(company) as Unicorns
from unicorn_companies;

select count(distinct country) as country
from unicorn_companies;

select Country,company
from unicorn_companies;

select company , round(((Valuation - funding)/Funding), 2) AS ROI
from unicorn_companies
order by ROI DESC LIMIT 10;

select Round(AVG(b.year - a.year_founded), 2) as AVG
from unicorn_companies as a
inner join unicorn_companies as b
on a.ID = b.ID;

select a.company, (b.year - a.year_founded) as Unicorn_Years 
from unicorn_companies as a
inner join unicorn_companies as b
on a.ID = b.ID
order by Unicorn_Years desc
limit 10;

select (b.year - a.year_founded) as Unicorn_Years , count(*) as frequency
from unicorn_companies as a
inner join unicorn_companies as b
on a.ID = b.ID
group by (b.year - a.year_founded)
order by frequency desc
limit 10;

select industry , count(company), count(Company)*100/(select count(*) from unicorn_companies) as percentage
from unicorn_companies
group by Industry
order by count(Company) desc;

select country, count(company) as number_of_companies, (count(company)*100/(select count(*) from unicorn_companies)) as percentage
from unicorn_companies
group by country
order by number_of_companies desc;

select investor, count(*) as unicornsinvested
from (
    select regexp_substr(select_investors, '[^,]+', 1, n) as investor
    from unicorn_companies
    join (
        select 1 as n union all select 2 union all select 3 union all select 4 union all select 5
        union all select 6 union all select 7 union all select 8 union all select 9 union all select 10
    ) as numbers
    on regexp_substr(select_investors, '[^,]+', 1, numbers.n) is not null
) as investors
group by investor
order by unicornsinvested desc
limit 10;