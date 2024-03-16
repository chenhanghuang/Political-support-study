# Political support study

## Overview

This repo provides how to reproduce my work on the "Analyzing Demographic and Socioeconomic Characteristics of Biden Voters in the 2020 US Presidential Election"



This repo provides you with a foundation to reproduce the results.

## File Structure

The repo is structured as:

data/raw_data contains the data sources used in analysis including the raw data ces2020.csv. We can access the CES using get_dataframe_by_name() after installing and loading dataverse.

data/analysis_data contains the cleaned dataset that was constructed, that is used to build the model and plots. 

other/llm contains the llm usage details
other/sketches contains the sketches of the structure of the dataset by hand that will be used in analysis,  refelcting the raw data.


The paper folder includes the essential files utilized in its creation, comprising the Quarto document and the reference bibliography file, along with the PDF output of the paper.


The scripts folder contains the R scripts used to simulation, download, clean data,  test and replication code. 

political_preferences.rds  is the regression results. 


## Statement on LLM usage

Aspects of the code were written with the help of the autocomplete tool, OPENAI chatGPT 3.5. I asked for some Demographic and Socioeconomic Characteristics in United States. For example, the proportion of White people in United States. Why Biden is supported by women and high education voters, etc. I also asked ChatGPT to give me a good title for this paper. The entire chat history is available in inputs/llms/usage.txt.
