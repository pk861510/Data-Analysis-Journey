# 📊 Zomato Restaurant Marketing Analytics Dashboard (Tableau + Python)

### 🔴 Live Interactive Dashboard (Tableau Public)  
👉 **[Click Here to View the Dashboard](https://public.tableau.com/app/profile/prince.kumar6824/viz/Zomato_Marketing_Analytics_Dashboard/Dashboard1)**

### 📸 Dashboard Preview

![Zomato Marketing Dashboard](/outputPlots/Zomato_Dashboard.PNG)  
*Interactive dashboard identifying high-performing cities, cuisines, and star restaurants for marketing promotion.*

---

## 📌 Project Overview

This project analyzes Zomato restaurant data to help a restaurant aggregator **identify high-performing cities, popular cuisines, and star restaurants for targeted marketing promotion**.

The full workflow follows an **end-to-end analytics pipeline**:

> **Raw Data → Python Cleaning & EDA → Dimensional Modeling → Tableau Interactive Dashboard**

The dashboard enables business teams to:
- Identify cities with strong customer satisfaction
- Understand which cuisines attract the most customer engagement
- Evaluate whether higher prices lead to better ratings
- Recommend top “Star Restaurants” for promotional campaigns

---

## 🎯 Business Questions Solved

1. Which cities have the highest restaurant concentration and strongest customer ratings?  
2. What cuisines receive the highest customer votes across cities?  
3. Do higher-priced restaurants deliver better customer ratings?  
4. Which restaurant franchises have the widest national presence?  
5. Which restaurants qualify as **Star Restaurants** based on ratings and popularity?  
6. Which restaurants should be prioritized for marketing campaigns?

---

## 🧰 Tech Stack

### 🔹 Python (Data Cleaning & EDA)
- pandas
- numpy
- matplotlib
- seaborn

### 🔹 Tableau (Dashboard & Business Analytics)
- Calculated Fields
- Parameters
- Filter Actions
- Geographic Mapping
- Ranking Functions
- Interactive Dashboards

---

## ⚙️ Data Processing Workflow (Python)

All data preparation and EDA were performed using Jupyter notebooks.

### 📁 python_scripts/

| Notebook | Purpose |
|--------|--------|
| `01_Data_Cleaning.ipynb` | Handling missing values, duplicates, datatype fixes |
| `02_Exploratory_Data_Analysis.ipynb` | Distribution analysis, outlier detection (IQR), city & cuisine trends |
| `03_dimTables.ipynb` | Creation of dimensional tables such as **CuisinesDim.csv** for Tableau modeling |

### 🧠 Key Data Engineering Tasks

- ✔ Removed duplicate restaurant records  
- ✔ Outlier detection using **IQR method**  
- ✔ Feature engineering for franchise analysis  
- ✔ Generated **Cuisines Dimension Table** for better Tableau joins  
- ✔ Exported clean datasets for dashboard consumption  

---

## 📊 Exploratory Data Analysis Outputs

Saved in: `outputPlots/`

Key EDA Visuals include:

- Country-wise restaurant distribution  
- Top & bottom cities by restaurant count  
- Franchise national presence comparison  
- Cost distribution analysis  
- Cuisine popularity across cities  
- Online delivery & table booking percentages  

These plots guided the final dashboard design and KPI selection.

---

## 📈 Tableau Dashboard Design

### 🧠 Data Modeling

- Implemented **fact + dimension structure**
- Joined:
  - Cleaned restaurant dataset
  - Cuisines dimension table
- Ensured correct aggregation behavior for:
  - Votes
  - Ratings
  - Outlet counts

---

## 🎛️ Advanced Tableau Features Used

### ✅ Parameters
- **Min Outlet Threshold** – filter cities based on minimum restaurant count
- **Top N Cities** – dynamic ranking control
- **Star Rating Threshold** – define star restaurant qualification
- **Top N Star Restaurants** – limit recommendations list

### ✅ Calculated Fields
- Star Restaurant Flag
- Star Strength (Popularity Level)
- Cost Buckets
- Rating Categories

### ✅ Dashboard Interactivity
- **Filter Actions:** Selecting cities on the map filters:
  - Star restaurant recommendations
  - Cuisine popularity charts

- **Dynamic Ranking:** City and restaurant rankings update automatically using parameters.

### ✅ UX & Storytelling
- KPI cards for executive overview
- Color-coded performance bands
- Clear business-driven section titles
- Structured layout for logical insight flow

---

## 📊 Key Business Insights

- **High-Performing Cities:** Cities like Lucknow, Guwahati, and Ahmedabad show strong average customer ratings.
- **Cuisine Preferences:** North Indian, Chinese, and Italian dominate customer votes across most cities.
- **Cost vs Rating Trend:** Higher prices correlate with better ratings, but mid-range restaurants still achieve strong satisfaction.
- **Franchise Leaders:** Certain brands show strong national expansion potential.
- **Promotion Strategy:** Star restaurants are identified using:
  - High ratings
  - Strong customer votes
  - Popularity classification

These restaurants are recommended for **marketing campaigns and platform promotions**.

---
## 🎯 Why This Project Matters

This project demonstrates the ability to:

- Perform real-world data cleaning  
- Conduct business-driven exploratory analysis  
- Build dimensional models for BI tools  
- Translate data into business recommendations  
- Design executive-ready dashboards  

It reflects the complete **Data Analyst workflow**, not just visualization.

---

## 📬 Connect With Me

🔗 **LinkedIn:** https://www.linkedin.com/in/pk861510  
📊 **Tableau Public:** https://public.tableau.com/app/profile/prince.kumar6824/vizzes

---

⭐ If you found this project useful, feel free to star the repository!
