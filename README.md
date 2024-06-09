# COVID-19 Data Analysis

This repository contains SQL scripts for analyzing COVID-19 data, focusing on various metrics such as infection rates, death rates, and vaccination progress across different countries and regions.

## Overview

The analyses in this repository utilize data from the `Portfolio_project` database, specifically from the `CovidDeaths` and `CovidVaccination` tables. The scripts include:

1. **Data Selection**:
    - Basic selection of COVID-19 vaccination and death data.

2. **Data Formatting and Sorting**:
    - Formatting dates and sorting data for better readability and analysis.

3. **Infection and Death Rate Analysis**:
    - Calculating total deaths vs total cases to derive death percentages.
    - Comparing total cases vs population to understand the spread.

4. **Country and Regional Analysis**:
    - Identifying countries with the highest infection rates compared to their population.
    - Highlighting regions with the highest death counts.

5. **Global Analysis**:
    - Aggregating global numbers for total cases, total deaths, and death percentages.

6. **Vaccination Analysis**:
    - Analyzing vaccination progress by comparing the number of vaccinations to the total population.

7. **Advanced Techniques**:
    - Using Common Table Expressions (CTEs) and temporary tables for complex calculations.
    - Creating views for storing data for later visualizations.

## Key Insights

- **Death vs Total Cases**: Provides insights into the mortality rate of the disease in different countries, with a specific focus on India.
- **Cases vs Population**: Examines the extent of infection spread within the population.
- **Infection Rate**: Highlights countries with the highest rates of new cases.
- **Death Count Analysis**: Compares death counts across countries and continents to identify regions most affected by the pandemic.
- **Global Metrics**: Summarizes global COVID-19 impact through total cases and deaths.
- **Vaccination Progress**: Tracks the progress of vaccination campaigns by country and region, offering insights into the percentage of the population vaccinated.

## Usage

To use these SQL scripts, you need access to the `Portfolio_project` database containing the `CovidDeaths` and `CovidVaccination` tables. Execute the scripts in a SQL environment connected to this database.

## Contributing

Contributions are welcome! If you have any suggestions or improvements, please open an issue or create a pull request.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

# Performance Analysis Report

This section of the repository contains a performance analysis based on sales and profitability data. The analysis focuses on year-to-date (YTD) vs. previous year-to-date (PYTD) metrics, gross profit percentages, and other key performance indicators (KPIs).

## Overview

The performance report includes data visualizations and analyses for various metrics, such as sales quantity, gross profit, and country-specific performance. Key aspects of this analysis include:

1. **Sales Performance**:
    - Analysis of sales quantity YTD vs. PYTD across different months and countries.

2. **Gross Profit Analysis**:
    - Examination of gross profit percentages and how they compare YTD vs. PYTD.

3. **Country-Specific Analysis**:
    - Identifying countries with significant increases or decreases in sales quantity YTD vs. PYTD.
    - Detailed analysis of sales performance by product type (e.g., Indoor, Landscape, Outdoor).

4. **Account Profitability Segmentation**:
    - Segmenting account profitability based on GP% and quantity.

## Key Insights

- **Sales Trends**: Understanding monthly sales trends and identifying peak performance periods.
- **Gross Profit Performance**: Analyzing gross profit to evaluate financial health and profitability.
- **Country Performance**: Identifying top-performing and underperforming countries to inform strategic decisions.
- **Product Type Analysis**: Assessing the performance of different product types to optimize product strategies.

## Usage

To utilize the insights from this performance analysis, ensure that the data is updated regularly and use tools such as Power BI for visualizations. The insights can help in making informed business decisions and strategic planning.

## Contributing

Contributions are welcome! If you have any suggestions or improvements, please open an issue or create a pull request.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
