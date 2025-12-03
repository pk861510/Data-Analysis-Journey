# 🏛️ Lok Sabha Member Attendance Analysis (End-to-End Project)

## 📋 Project Overview
This is an end-to-end data analysis project focusing on the attendance records of Lok Sabha members (MPs). The goal was to transform unstructured web data into actionable insights regarding parliamentary participation.

The project follows a full data pipeline: **Web Scraping (Python) → Data Cleaning & Transformation → Database Storage (BigQuery) → Advanced SQL Analysis.**

## 🛠️ Tech Stack
* **Data Collection:** Python, Selenium/BeautifulSoup (Web Scraping)
* **Data Processing:** Pandas, NumPy (CSV/JSON generation)
* **Database:** Google BigQuery (Data Warehousing)
* **Analysis:** SQL (CTEs, Window Functions, Complex Aggregations)
* **Version Control:** Git & GitHub

---

## 🧠 Analyst Requirement Document (ARD)
Before writing any code, I defined the business problems I wanted to solve. This **ARD** guided the SQL logic:
1.  **Session-wise Analysis:** Track attendance trends across different parliamentary sessions.
2.  **Performance Ranking:** Identify the **Top 5** and **Bottom 5** MPs from each political party based on attendance percentage.
3.  **Profession Correlation:** Analyze which professions (e.g., Agriculturist, Lawyer, Social Worker) tend to have the highest attendance.
4.  **Critical Alerts:** Identify members with attendance **below 75%**.
5.  **Data Cleaning Logic:** Handle special flags like "Not Required" (NR) and "Signed Member" (S) to ensure accurate calculations.

---

## 🔍 Key SQL Implementations
I utilized **Advanced SQL** concepts in Google BigQuery to derive insights:

### 1. Data Cleaning & Standardization (CTEs)
Used **Common Table Expressions (CTEs)** and `CASE WHEN` statements to standardize attendance codes:
* Converted flags like `S` (Signed), `NR` (Not Required), and `NS` (Not Signed) into quantifiable binary data (1/0) or NULLs for accurate percentage calculation.

### 2. Advanced Ranking (Window Functions)
To find the top performers per party without limiting the dataset incorrectly, I used `DENSE_RANK()`:
```sql
DENSE_RANK() OVER(
    PARTITION BY lok_sabha, partyFname 
    ORDER BY PerAttendance DESC
) as PartyRank