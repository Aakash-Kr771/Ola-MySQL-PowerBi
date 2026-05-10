# Ola-MySQL-PowerBi
# Ola Rides: End-to-End SQL Data Analysis 🚖

## 📖 Project Overview
This project provides a deep-dive analysis of ride-booking operations for Ola using MySQL. The objective was to transform raw booking data into actionable business intelligence, focusing on revenue optimization, cancellation trends, and customer satisfaction metrics.

## 🎯 Project Objectives
- **Operational Efficiency:** Identify reasons for incomplete and canceled rides to minimize service disruptions.
- **Customer Segmentation:** Highlight high-value customers and preferred vehicle categories.
- **Financial Reporting:** Calculate the total successful booking value and average ride distances.
- **Service Benchmarking:** Evaluate driver performance through rating analysis across different vehicle segments.

## 🛠 Technical Stack
- **Database Engine:** MySQL 8.0
- **Language:** SQL (Advanced Joins, Aggregations, and View Materialization)
- **Concepts Applied:** Schema Design, Data Ingestion (LOAD DATA INFILE), and Virtual Tables (Views)

## 🏗 Database Architecture
The analysis is built around a centralized `booking` table with 19 columns capturing temporal, categorical, and numerical data points:
- **Temporal:** Date & Time tracking.
- **Status Metrics:** Success, Canceled by Customer/Driver, Incomplete.
- **Financials:** Booking Value & Payment Methods (UPI, etc.).
- **Ratings:** Dual-sided feedback for Drivers and Customers.

## 🚀 Key Insights & SQL Solutions
The project includes 10 modular SQL Views for automated reporting:

1.  **Success Tracking:** Isolated all completed bookings to measure baseline performance.
2.  **Vehicle Utilization:** Calculated average ride distance per vehicle type (e.g., Prime Sedan, Mini).
3.  **Cancellation Analysis:** Quantified customer-side cancellations and driver-side issues (Personal/Car-related).
4.  **Loyalty Metrics:** Identified the Top 5 customers based on booking volume.
5.  **Quality Assurance:** Monitored min/max ratings specifically for premium segments.
6.  **Payment Diversity:** Analyzed the penetration of UPI payments in the total ride mix.

## **Dashboard / Output**
> **[INSERT LINK OR IMAGE OF YOUR POWER BI/TABLEAU DASHBOARD HERE]**
*The SQL Views generated in this project serve as the live data source for the interactive dashboard, visualizing real-time trends in ride distance, ratings, and revenue.*

## 📂 Project Structure
```text
├── Ola.sql                 # Full SQL script with schema and view creation
├── Bookings_cleaned.csv    # Cleaned dataset used for analysis
└── README.md               # Project documentation
