# Global Workforce reduction Analysis Project
### From Raw Data to clean Visualization

#### Project Overview
This project conducts an in-depth analysis of global company layoffs data spanning from 2020 to the first quarter of 2023. With >2000 rows of raw data initially, the dataset went under rigorous cleaning and manipulation using MySQL to ensure data accuracy, standardization and consistency. The analysis focused on identifying trends over the years, including frequency and distribution of layoffs across industries, countries, and companies. To provide comprehensive insights, a visualization was created using R/Posit Cloud, offering an interactive exploration of the analyzed data. The cleaned dataset and SQL scripts for data processing and analysis are available in this repository for further exploration and utilization.

### Data Sources
Layoffs data: the primary dataset used for the analysis is the "layoffs.csv" file, containing raw information about layoffs throughout the years.

### Tools
- MySQL Workbench - Data Cleaning
- MySQL Workbench - Data Analysis
- R/Posit Cloud - Data Visualization

### Data Cleaning/Preparation
In the initial data preparation phase, following tasks were performed:
1. Creation of a Staging table to preserve the original data
2. Identification and removal of duplicates and outliers
3. Standardization of Data (formatting)
4. Handling missing and null values

### Exploratory Data Analysis (EDA)
EDA involved exploring the data to answer the following key questions:
- Which country had most people losing their job?
- What's the trend during the years? 
- Which industries are the most affected?
- Investigation whether there was a discernible trend in the aftermath of COVID-19 Pandemic

### Results/Findings
The Analysis results are summarized as follows:
1. The United States had the highest number of job losses by a significant margin.
2. Focusing on the total layoffs, there was a substantial increase in 2021???, followed by a decrease in 2022???. However, the layoffs quickly started rising again, reaching nearly double the magnitude of the initial shock.
(add image)
3. Given the nature of their operations, the common industry type among the top 5 companies is technology and telecommunications.
4. Considering Consumer and Retail as the most affected industries, we can possibly identify a trend related to the post-pandemic aftermath.

### Visualization


### Limitations
There were zero and null values that have not been included because they may have negatively affected the analysis. However, the biggest limitation is that it only considers the available data up to the first quarter of 2023


### SQL Queries/Interest findings outside the analysis
What are the top 5 company, each year, that laid off the most employee?
```sql
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
```
Company that did more than 1 layoff throughoutthe years
```sql
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
```
Rolling total by month through the years
```sql
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
```
