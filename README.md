# Global Workforce reduction Analysis Project
### From Raw Data to clean Visualization

#### Project Overview
This project conducts an in-depth analysis of global company layoffs data spanning from 2020 to the first quarter of 2023. With >2000 rows of raw data initially, the dataset went under rigorous cleaning and manipulation using MySQL to ensure data accuracy, standardization and consistency. The analysis focused on identifying trends over the years, including frequency and distribution of layoffs across industries, countries, and companies. To provide comprehensive insights, a visualization was created using Tableau, offering an interactive exploration of the analyzed data. The cleaned dataset and SQL scripts for data processing and analysis are available in this repository for further exploration and utilization.

### Data Sources
Layoffs data: the primary dataset used for the analysis is the "layoffs.csv" file, containing raw information about layoffs throughout the years.

### Tools
- MySQL Workbench - Data Cleaning
- MySQL Workbench - Data Analysis
- Tableau Desktop - Data Visualization

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
2. Focusing on the total layoffs, there was a substantial increase in 2020, followed by a decrease in 2021. However, the layoffs quickly started rising again, reaching nearly double the magnitude of the initial shock.
3. Given the nature of their operations, the common industry type among the top 5 companies is technology and telecommunications.
4. Considering Consumer and Retail as the most affected industries, we can possibly identify a trend related to the post-pandemic aftermath.

### Limitations
There were zero and null values that have not been included because they may have negatively affected the analysis. However, the biggest limitation is that it only considers the available data up to the first quarter of 2023
