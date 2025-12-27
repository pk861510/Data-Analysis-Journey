# 📺 YouTube Content Strategy: End-to-End Data Engineering & Analysis

### 📌 Project Overview
This project is a key milestone in my Data Analysis journey, demonstrating a full **End-to-End ETL (Extract, Transform, Load)** workflow.

Unlike standard projects that start with a static CSV, I built a secure pipeline to extract raw data via the **YouTube Data API v3**, transformed it using Python, and warehoused it in **Google BigQuery**. The goal was to go beyond surface-level metrics and use **Advanced SQL** to uncover the deep factors driving viewer engagement, viral growth, and content retention.

### 🎯 Key Business Questions
1. **Engagement Drivers:** Does video duration significantly impact viewer retention and engagement rates?
2. **Viral Mechanics:** What distinguishes a "Viral" video (>2M views) from a standard performing video?
3. **Upload Strategy:** Is there a correlation between publication timing (Month/Year) and the "velocity" of views per day?
4. **Service Quality:** How do "Long-form" educational videos compare against "Short-form" trends in terms of long-term value?

### 🌟 Key Features
* **Secure API Integration:** Automated data fetching from the YouTube Data API v3, managing API quotas and pagination.
* **Environment Security:** Utilized `python-dotenv` to mask sensitive API keys, ensuring best practices for cloud security.
* **Data Engineering:** Implemented Regex parsing to convert ISO 8601 durations (e.g., `PT15M30S`) into analyzable time formats.
* **Cloud Warehousing:** Designed a structured schema in **Google BigQuery** to handle large-scale channel stats and metadata.
* **Advanced Analytics:** Applied SQL Window Functions (`DENSE_RANK`), CTEs, and custom Bucketing logic to derive actionable insights.

### 🛠️ Tech Stack
* **Languages:** Python (Data Extraction), SQL (Data Analysis), Regex (Data Parsing).
* **Libraries:** `googleapiclient`, `pandas`, `python-dotenv`.
* **Cloud Platform:** Google BigQuery (Data Warehousing & Analytics).
* **Tools:** VS Code, Git/GitHub.

### 📂 File Structure
* **`data/`**: Raw and cleaned CSV datasets (Staging area).
* **`python_scripts/`**: ETL pipelines for API extraction (`yt.py`) and playlist duration calculation (`playlist.py`).
* **`sql_queries/`**: Modular SQL scripts for data cleaning, deduplication, and engagement analysis.
* **`insights/`**: Exported query results and charts visualizing key trends.

### 📊 Top Insights (from BigQuery Analysis)
* **Duration "Sweet Spot":** Long-form content (5-15 mins) accounts for **50.9%** of the channel's output, driving higher sustained engagement than short content.
* **Viral Rarity:** Only **0.1%** of videos achieve "Viral" status (>2M views), highlighting the need for consistent, high-quality production over "lottery" attempts.
* **View Velocity:** Analysis of "Views Per Day" revealed that videos published during specific high-demand periods (e.g., March 2020) achieved the highest initial traction.

### 🚀 Future Scope
* **Data Visualization:** Build an interactive dashboard (Power BI/Tableau) connecting directly to BigQuery.
* **Sentiment Analysis:** Integrate NLP to analyze the sentiment of user comments (Positive/Negative correlation with views).

---
*Connect with me on [LinkedIn](https://www.linkedin.com/in/pk861510) to discuss these findings.*