# University Academic Data Analysis & Optimization Project

## Overview
This project represents a comprehensive case study in **Data Engineering** and **Academic Analytics**. The primary objective was to re-engineer a university's academic data system, transforming it from an unnormalized, unstructured flat-file format into a robust, efficient **Relational Database Management System (RDBMS)**.

The workflow encompasses end-to-end data processing: data cleaning, rigorous normalization (up to 5NF), database schema design (ERD), and the extraction of strategic insights using **Advanced SQL**. The final output serves as a foundation for data-driven decision-making within university management.

## Dataset Description
The source dataset consisted of raw, redundant academic records. Through the transformation process, data was structured into the following distinct entities:

* **Faculty (`fakultas`):** The highest academic unit (e.g., Engineering, Science, Economics).
* **Study Program (`program_studi`):** Specific departments under each faculty.
* **Student (`mahasiswa`):** Demographic and academic profiles of students.
* **Lecturer (`dosen`):** Academic staff information and contact details.
* **Course (`mata_kuliah`):** Catalog of courses offered by the university.
* **Schedule (`jadwal`):** Logistics entity linking Lecturers, Courses, Rooms, and Time (Semester/Year).
* **Grades (`nilai`):** Transactional table recording student performance per course (Many-to-Many relationship).

## Data Normalization Methodology
A strict normalization process was applied to eliminate insertion, deletion, and update anomalies, ensuring data integrity:

### 1. First Normal Form (1NF)
* **Issue:** The raw data contained multi-valued attributes and inconsistent ordering.
* **Action:** Enforced atomicity for all columns and standardized data types. Composite attributes were decomposed into singular fields.

### 2. Second Normal Form (2NF)
* **Issue:** Presence of **Partial Dependencies**, where non-key attributes relied on only part of a composite Primary Key.
* **Action:** Decoupled Student, Lecturer, and Course data into separate master tables, ensuring all non-key attributes are fully functionally dependent on their respective Primary Keys.

### 3. Third Normal Form (3NF) & BCNF
* **Issue:** Identified **Transitive Dependencies** (e.g., Faculty Name depending on Program ID rather than the primary entity).
* **Action:** Created dedicated reference tables for Faculties and Study Programs to eliminate hierarchical redundancy.

### 4. Advanced Normalization (4NF & 5NF)
* **Action:** Verified the absence of **Multivalued Dependencies** and ensured the schema allows for **Lossless Decomposition** (tables can be rejoined without data loss or spurious tuples).

## Database Schema Implementation
The system was implemented using **PostgreSQL** with a focus on referential integrity:
* **Primary Keys:** Guarantees unique identification for every record.
* **Foreign Keys:** Enforces relationships between tables (e.g., Student to Study Program).
* **Constraints:** Applied `ON DELETE SET NULL` to handle master data deletion safely without corrupting historical grade records.

## Analytical Insights & Findings
Deep analysis was performed using complex SQL queries involving Window Functions, CTEs, and Conditional Aggregation. Key findings include:

### 1. Program Effectiveness Analysis (Pass Rates)
Evaluated curriculum effectiveness by calculating student pass rates (Grade $\ge$ 60).
* **Insight:** Exact science programs (e.g., Informatics, Systems Information) show significant variance in pass rates compared to social science programs.
* **Strategic Implication:** Curriculum review is recommended for programs falling below the university's average pass rate.

### 2. Grade Distribution Profiling
Utilized data pivoting to map the distribution of grades (A, B, C, D, E).
* **Insight:** While most courses show a left-skewed distribution (indicating good performance), specific "bottleneck" courses exhibit abnormally high failure rates (D and E grades).
* **Strategic Implication:** High-failure courses require an audit of teaching methods or assessment difficulty.

### 3. Collaborative Teaching Detection
Identified courses taught by multiple lecturers simultaneously.
* **Insight:** Team teaching is prevalent in fundamental courses and core program subjects.
* **Strategic Implication:** While effective for standardization, this model requires tighter scheduling coordination to prevent resource clashes.

### 4. Consistent Top Performer Identification
Deployed **Window Functions** to pinpoint students who rank top in average GPA across *every* consecutive semester.
* **Insight:** Less than 5% of the student body maintains "Top Performer" status consistently.
* **Strategic Implication:** These students are prime candidates for academic scholarships, research assistant positions, or fast-track programs.

## Recommendations
Based on the data analysis, the following strategies are proposed:

1.  **Data-Driven Curriculum Reform:** Revise syllabi for courses with anomalous grade distributions (outliers).
2.  **Early Warning System:** Leverage historical grade data to predict students at risk of dropout, specifically in programs with low retention rates.
3.  **Resource Optimization:** Balance lecturer workloads by analyzing the distribution of Team Teaching assignments.
4.  **Retention & Reward System:** Implement a recognition program for consistent top performers to improve retention of high-potential students.

## Conclusion
The transformation from a flat-file system to a fully normalized 5NF database has significantly improved data integrity and storage efficiency. Through advanced SQL analytics, the university now possesses clear visibility into academic patterns, enabling a shift from intuitive management to **Data-Driven Decision Making**.

---
**Tools Used:** PostgreSQL, Advanced SQL (DML, DDL, DQL), Data Modeling.
