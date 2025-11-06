**Project 6: Student Pass/Fail Predictor**

This project builds a complete system to predict whether a student will pass or fail.

It starts by creating a database for student information (like grades and attendance). Then, it uses Python to take that data, analyze it, and build a machine learning model. The final model can look at a student's attendance and marks to guess their final outcome.

 **🚀 Project Goal**

The main goal was to practice combining database skills (SQL) with data science (Python and Machine Learning).

**This involved:**
 Designing a clean database for student info.
 Using SQL to analyze the student data.
 Building a predictive model to guess if a student will pass or fail.

 **🛠️ Technology Used**

 Database: MySQL
 Database Tool: MySQL Workbench
 Data Analysis & ML: Python (using Pandas and Scikit-learn)
 Plotting: Matplotlib & Seaborn
 Notebook: Jupyter Notebook

 **📁 What's in this Folder?**

This folder contains the three final files for the project:

1.  `student_project.sql`: This is the master SQL file. It contains all the code to create the database, the tables (`Students`, `Grades`, `Attendance`), add all the sample data, and run the analysis queries.
2.  `ml_analysis.ipynb`: This is the Jupyter Notebook. It connects to the database, pulls the data, cleans it up, and then builds, trains, and tests the machine learning model. It also has the code to create the final plots.
3.  `Report.pdf`: This is a simple report that summarizes the entire project. It includes the database diagram, key findings, and final charts.

 **📈 Key Findings**

The project was a success! Here are the main takeaways:

 Attendance Matters: The SQL analysis found a very strong link between a student's attendance percentage and their final mark.
 The Model Works: The machine learning model was able to predict "Pass" or "Fail" with high accuracy.
 You Can See the Pattern: The final scatter plot shows a clear difference:
     Failing students were in a group with low attendance and low marks.
     Passing students were in a group with high attendance and high marks.
