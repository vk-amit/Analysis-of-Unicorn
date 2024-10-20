create database unicorncompanies;
use unicorncompanies;

select *
from unicorn_companies;

SELECT Company, COUNT(Company)
FROM unicorn_companies
GROUP BY Company
HAVING COUNT(Company) > 1;

 SELECT Company, ROW_NUMBER() OVER (PARTITION BY Company) AS rn
    FROM unicorn_companies;
    
WITH CTE AS (
    SELECT Company, ROW_NUMBER() OVER (PARTITION BY Company) AS rn
    FROM unicorn_companies
)
DELETE FROM unicorn_companies
WHERE Company IN (
    SELECT Company
    FROM CTE
    WHERE rn > 1
);

alter table unicorn_companies rename column `date joined` to date_joined ;
alter table unicorn_companies rename column `Select Investors` to Select_Investors ;
alter table unicorn_companies rename column `Year Founded` to Year_founded ;

alter table unicorn_companies add column datejoined1 date;

UPDATE unicorn_companies
SET datejoined1 = date_joined;

alter table unicorn_companies add column year int;

update unicorn_companies
set year = year(datejoined1);

alter table unicorn_companies add column month INT;
update unicorn_companies
set month = month(datejoined1);

alter table unicorn_companies add column day int;
update unicorn_companies 
set day = day(datejoined1);

select day
from unicorn_companies;

delete from unicorn_companies
where funding = '$0' or funding= 'unknown';

SELECT DISTINCT Funding
FROM unicorn_companies;

update unicorn_companies
set VALUATION = substring(valuation , 2);

select company,  valuation
from unicorn_companies
order by valuation desc;

update unicorn_companies
set valuation = replace( valuation , 'B', '000000000') ;

update unicorn_companies
set valuation = replace( valuation , 'M', '000000') ;

update unicorn_companies
set funding = substring(funding, 2);

update unicorn_companies
set funding = replace(funding, 'B', '000000000');
update unicorn_companies
set funding = replace(funding, 'M', '000000');

ALTER TABLE unicorn_companies DROP COLUMN Date_Joined;

ALTER TABLE unicorn_companies RENAME COLUMN DateJoined1 TO Date_Joined;

