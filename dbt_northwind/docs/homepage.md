{% docs __overview__ %}

# dbt - Northwind Project

Welcome to dbt Northwind project's docs!

## Overview

This project is a part of [Luciano Vasconcelo's course on Data Engineering](https://suajornadadedados.com.br). It's based on the Northwind sample database structure and data provided by Microsoft. The main goal is to apply dbt's features to implement data transformations in a close to real scenario. 

Here's what the Northwind database looks like in it's raw form:
![image](https://raw.githubusercontent.com/amenoarnt/new-project-dbt-northwind/main/dbt_northwind/pics/northwind.png)


## Data Transformation using dbt

This project is set up on a PostgresSQL database mounted on an AWS RDS instance. All transformation steps are executed with dbt-core. Finally, the dashboards will be provided throw Streamlit.

There are 3 layers of data: (i) the staging, which is close to it's raw form; (ii) the intermediate, which is segregated by business area; and (iii) the marts that are ready for the consumers. 

![image](https://raw.githubusercontent.com/amenoarnt/new-project-dbt-northwind/main/dbt_northwind/pics/excalidraw.png)

## Further information

Link to [Github](<https://github.com/amenoarnt/new-project-dbt-northwind/tree/main>)

{% enddocs %}