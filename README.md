# SQL Data Warehouse Project | Medallion Architecture

## 📌 Project Overview
This is an end-to-end Data Warehouse project built using **SQL Server**.  
It follows the **Medallion Architecture** (Bronze → Silver → Gold layers) and includes ETL processes, data modeling (Star Schema), and analytical queries.

I built this project by closely following the excellent tutorial by **Data With Baraa**

I followed the project structure, file naming, and most of the SQL scripts as taught in the course.  
This repository is created for **learning and portfolio purposes**

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

## 🏗️ Data Architecture

<img width="4000" height="2800" alt="data_architecture" src="https://github.com/user-attachments/assets/950058bc-d632-4ce7-bb11-76f69e95e9b2" />

- **Bronze Layer**: Raw data loaded from CSV files
- **Silver Layer**: Cleaned, standardized, and transformed data
- **Gold Layer**: Business-ready Star Schema (Fact + Dimension tables)

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

## 📖 Project Overview

This project demonstrates how to build a modern Data Warehouse using the **Medallion Architecture** (Bronze → Silver → Gold).

It covers the complete flow:

1. **Data Architecture** – Designing Bronze, Silver, and Gold layers
2. **ETL Pipelines** – Extracting, cleaning, and loading data
3. **Data Modeling** – Creating Fact and Dimension tables (Star Schema)
4. **Analytics** – Performing Basic & Advanced EDA and building reports

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

## 🛠️ Tech Stack
- SQL Server
- SQL Server Management Studio (SSMS)
- Git & GitHub
- Draw.io (for architecture diagrams)

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

## 🚀 Project Requirements

### Objective
Build a modern Data Warehouse in SQL Server that consolidates sales data from CRM and ERP systems for analytical reporting.

### Key Specifications
- Import data from CRM and ERP source systems (CSV files)
- Clean and resolve data quality issues
- Integrate both sources into a single analytical model
- Focus on the latest data (no historical tracking required)
- Document the data model clearly

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

## 📂 Repository Structure

```text
data-warehouse-project/
│
├── datasets/                   # Raw datasets (ERP and CRM data)
│
├── docs/                       # Project documentation and architecture
│   ├── data_architecture.jpg             
│   ├── data_catalog.md
│   ├── data_flow.png
│   ├── data_integration.png
│   ├── data_models.drawio      # Star schema
│   └── naming-conventions.md
│
├── scripts/                    # SQL scripts
│   ├── bronze/                 # Raw data loading
│   ├── silver/                 # Cleaning & transformation
│   └── gold/                   # Analytical models (Star Schema)
│
├── tests/                      # Data quality checks
│
└── README.md
