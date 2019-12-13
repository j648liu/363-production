# 363-production
The final project for psych363 (computing and psychological research) taught by Prof. Britt Anderson.
Project created by Junwen (Ciel) Liu, Xinhe (Leah) Liu, and Shaveta Gupta.
experiment.py is the experiment program. Requires psychopy to run. Generates result files in the format of "results_id.csv"
compile.r takes all result files and put together, adding two additional columns to each observation: gender and id. Creates the file "all_data.csv" Requires tidyverse.
analysis.R contains R codes used for data analysis. t-tests etc.
