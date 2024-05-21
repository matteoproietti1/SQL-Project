# Global Workforce reduction Analysis Project
### From Raw Data to clean Visualization

#### Project Overview
This project conducts an in-depth analysis of global company layoffs data, spanning from 2020 to the first quarter of 2023. With >2000 rows of raw data initially, the dataset went under rigorous cleaning and manipulation using MySQL to ensure data accuracy, standardization and consistency. The analysis focused on identifying trends over the years, including frequency and distribution of layoffs across industries, countries, and companies. To provide comprehensive insights, a visualization was created using R/Posit Cloud, offering a visual-guided exploration of the analyzed data. 

### Data Sources
Layoffs data: the primary dataset used for the analysis is the "layoffs.csv" file, containing raw information about layoffs throughout the years.The cleaned dataset, SQL scripts and .rmd for data processing and analysis are available in this repository for further exploration and utilization. Values where 'total_laid_off' and 'percentage_laid_off' were NULL or missing have been removed due to missing data.

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
<details> 
<summary>Click to see</summary>

| Country        | Total laid off      |
|----------------|---------------------|
| United States  | 256420              |
| India          | 35793               |
| Netherlands    | 17220               |
| Sweden         | 11264               |
| Brazil         | 10391               |
| Germany        | 8701                |



</details>

- Which company had the highest amount of total laid off?
<details>
<summary>Click to see</summary>
    
| Company     | Layoffs   | Percentage   |
|-------------|-----------|--------------|
| Google      | 12000     | 0.06%        |
| Meta        | 11000     | 0.13%        |
| Microsoft   | 10000     | 0.05%        |
| Amazon      | 10000     | 0.03%        |
| Ericsson    | 8500      | 0.08%        |
| Salesforce  | 8000      | 0.10%        |

    
</details>

- Which industries are the most affected?

| Industry type   | Total laid off      |
|-----------------|---------------------|
| Consumer        | 45182               |
| Retail          | 43613               |
| Other           | 36209               |
| Transportation  | 33548               |
| Finance         | 28344               |
| Healthcare      | 25894               |

  
- What's the trend during the years? Analyze whether there was a discernible up and down in the aftermath of COVID-19 Pandemic
<details>
<summary>Click to expand</summary>
    
Focusing on the total layoffs by year, the amount was significant during 2020 (right during COVID-19), followed by a noticeable decrease in 2021. However, the layoffs quickly started rising again in 2022 reaching its peak. Then, in 2023, in only 3 months has reached almost the magnitude of the initial shock (which suggest that, by the end of the year, that would be at least twice the amount of 2022 laidoff total). 
    
<img src="https://github.com/matteoproietti1/Workforce_Reduction_Analysis/assets/169601063/b273d94f-531b-4d57-92ea-0bc5b7ad87a9" alt="TrendsColumn" align="center">
    
</details>

### Results/Findings

The Analysis results are summarized as follows:
1. The United States had the highest number of job losses by a significant margin.
2. Given the nature of their operations, the common industry type among the top 5 companies is technology and telecommunications.
3. Considering Consumer and Retail as the most affected industries, we can possibly identify a trend related to the post-pandemic aftermath.


### Details and consideration about Visualization process
For quick charts that required finding the Trend, it was used R.

### Limitations
There were zero and null values that have not been included because they may have negatively affected the analysis. 


### SQL Queries/Interest findings outside the analysis
For more interesting findings not directly related to this analysis, please refer to "findings_layoffs.sql".

Thank you for your time! :)
