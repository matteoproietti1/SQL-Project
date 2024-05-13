-- Data Analysis 

SELECT *
FROM layoffs;

-- Top 10 with the highest total laid off
SELECT company, MAX(total_laid_off) AS total, MAX(percentage_laid_off) as percentage
FROM layoffs
GROUP BY company
ORDER BY total DESC
LIMIT 10;


SELECT *
FROM layoffs
WHERE percentage_laid_off = 1
ORDER BY total_laid_off DESC;

-- Who had the biggest sum of laid off?
SELECT company, SUM(total_laid_off)
FROM layoffs
GROUP BY company
ORDER BY 2 DESC;

-- Datespan may suggest us that we are referring to a post-covid layoffs trend 
SELECT MIN(`date`), MAX(`date`)
FROM layoffs;

-- What industry was hit the most post-covid? Consumer and Retail have a significant span from the other industries, 
-- which brings us back again to the possibility of a post covid trend. Manufacturing is surprisingly low.
SELECT industry, SUM(total_laid_off)
FROM layoffs
GROUP BY industry
ORDER BY 2 DESC;

-- Which country had most people losing their job?
SELECT country, SUM(total_laid_off)
FROM layoffs
GROUP BY country
ORDER BY 2 DESC;

-- Focusing on the total layoffs for each year, we can see a big shock in 2020, that had a brake during 2021 
-- but immediately started rising again almost twice the size of the first shock
SELECT YEAR(`date`) AS `year` , SUM(total_laid_off)
FROM layoffs
GROUP BY `year`
ORDER BY 1 DESC;


-- Focus on stage
SELECT stage, SUM(total_laid_off)
FROM layoffs
GROUP BY stage
ORDER BY 2 DESC;


-- Getting the rolling total of the month. First, we find the total laid off for each month.
SELECT SUBSTRING(`date`,1,7) AS `month`, SUM(total_laid_off) AS total
FROM layoffs
WHERE SUBSTRING(`date`,1,7) IS NOT NULL
GROUP BY `month`
ORDER BY 1 ASC;

-- Then we put it in a CTE 
WITH rolling_total AS 
(SELECT SUBSTRING(`date`,1,7) AS `month`, SUM(total_laid_off) AS total
FROM layoffs
WHERE SUBSTRING(`date`,1,7) IS NOT NULL
GROUP BY `month`
ORDER BY 1 ASC
)
SELECT `month`, total,
SUM(total) OVER(ORDER BY `month`) AS rolling_total
FROM rolling_total


-- Company that did multiple layoffs throughout the years
SELECT company, YEAR(`date`), SUM(total_laid_off)
FROM layoffs
GROUP BY company, YEAR(`date`)
ORDER BY 1 ASC

SELECT company, YEAR(`date`), SUM(total_laid_off)
FROM layoffs
WHERE company IN (
    SELECT company
    FROM layoffs
    GROUP BY company
    HAVING COUNT(*) > 1
)
GROUP BY company, YEAR(`date`)
ORDER BY company ASC, YEAR(`date`) ASC;

-- What are the top 5 company, each year, that laid off the most employee?

WITH company_year (company, years, total_laid_off) AS
(
SELECT company, YEAR(`date`), SUM(total_laid_off)
FROM layoffs
GROUP BY company, YEAR(`date`)
), company_year_rank AS (
SELECT *, DENSE_RANK() OVER (PARTITION BY years ORDER BY total_laid_off DESC) AS ranking
FROM company_year
WHERE years IS NOT NULL
)
SELECT * 
FROM company_year_rank
WHERE ranking <= 5;
