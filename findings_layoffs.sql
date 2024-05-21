### SQL Queries/Interest findings outside the analysis
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

-- Company that did more than 1 layoff throughout the years
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

-- Rolling total by month through the years
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

