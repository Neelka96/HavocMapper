# HavocMapper: FEMA Responses to Extreme Weather  

## Introduction  

HavocMapper is a data analysis project exploring FEMA's Disaster Declarations Summary dataset and using  
Geoapify's geocoding API to uncover insights into disaster responses across the United States. This  
project applies foundational Python, Pandas, Matplotlib, and API skills to clean, analyze, and visualize  
data trends. Learn more about FEMA's work on their [website](https://www.fema.gov/) and Geoapify's API [here](https://www.geoapify.com/).  


## Table of Contents  

- [Introduction](#introduction)  
- [Setup](#setup)  
  - [Quick-Run Instructions](#quick-run-instructions)  
  - [Notebook Execution Order](#notebook-execution-order)  
  - [Reading Notebooks Effectively](#reading-notebooks-effectively)  
- [General Overview](#general-overview)  
  - [Major Technologies Used](#major-technologies-used)  
  - [System Requirements](#system-requirements)  
    - [Hardware](#hardware)
    - [Software](#software)
    - [Manual Dependencies](#manual-dependencies)
- [Detailed Description](#detailed-description)  
  - [Workflow](#workflow)  
  - [Purpose and Goals](#purpose-and-goals)  
  - [Techniques Applied](#techniques-applied)  
  - [Preferred Viewing Method](#preferred-viewing-method)  
- [Key Challenges](#key-challenges)  
- [Directory Structures](#directory-structures)  
  - [Original Cloned Repo](#original-cloned-repo)  
  - [New Expected Structure](#new-expected-structure)  
- [Deliverables](#deliverables)  
  - [Visualizations](#visualizations)  
  - [Analyses](#analyses)  
  - [Saved Figures and Models](#saved-figures-and-models)  
  - [Google Slides Presentation](#google-slides-presentation)  
- [Contributors](#contributors)  
- [Data Sources and Citations](#data-sources-and-citations)  
- [Long Form Directory Structure](#long-form-directory-structure)


## Setup  

### Quick-Run Instructions  

1. Clone the repository in the local directory of your choosing with `cd your/path/here`  
    - Using the HTTPS web URL:  
        ```bash  
        git clone https://github.com/neelka96/HavocMapper.git  
        cd HavocMapper  
        ```  
    - Using a password protected SSH Key (if you have it enabled other wise use method above):  
        ```bash  
        git clone git@github.com:Neelka96/HavocMapper.git  
        cd HavocMapper  
        ```  
2. Create a virtual environment (optional but recommended)  
    - With Conda:  
        ```bash  
        conda create --name venv python=3.12.2  
        conda activate venv  
        ```  
    - With Built-in Python venv Library:  
        ```bash  
        python -m venv venv  
        source venv/bin/activate  # On Windows: venv\Scripts\activate  
        ```  
3. Install dependencies:  
    ```bash  
    pip install -r requirements.txt  
    ```  
4. Feel free to deactivate your virtual environment (conda or otherwise) after installing dependencies!  
    - With Conda:  
        ```bash  
        conda deactivate  
        ```  
    - With venv:  
        ```bash  
        deactivate  
        ```  
5. Add API keys in a file named `api_keys.py`:  
    ```python  
    key1 = "your_api_key_here"  
    key2 = "your_optional_second_key_here"
    key3 = "your_optional_third_key_here"
    ...
    # Add additional keys as needed  
    # Native setup utilizes up to 9 keys  
    # Must have 1 key with no upwards limit  
    ```  
6. When running notebooks, be sure to select the kernel/environment the dependencies were installed in.  
> [!NOTE]  
> While the native system all code was built on runs through the conda python interpreter   
> (Anaconda Distribution), all dependencies were loaded through pip to ensure cross-compatibility  
> with other Python interpreters. Anaconda's official statement is that they can not ensure the  
> resolution of dependency conflicts from packages installed through Pypi, BUT conda does naturally  
> house pip installed dependencies separately from each other when installed in different conda  
> environments. When creating a new environment from scratch, this process will almost always  
> function as intended!


### Notebook Execution Order  

1. Run `havoc_ETL.ipynb` to set up directory, prepare data and geocode locations.  
2. Follow with `havoc_analysis.ipynb` for visualizations and analyses, and export images.  

### Reading Notebooks Effectively  

- Use Jupyter Notebook's Outline feature (e.g., in the VS Code extension) to collapse and expand sections for better navigation.  
- Outputs and markdown are organized with headings and foldable cells for clarity.  
> [!TIP]
> If running cell by cell, collapse all grouped cells first and then expand and collapse as needed!  
> Markdown has been thoroughly labeled and grouped for enhanced traversal.  


## General Overview  

This project follows a structured workflow to explore and analyze FEMA's disaster declarations. Data is extracted,  
cleaned, geocoded, and visualized to identify trends in extreme weather responses, leveraging modern Python  
libraries and API integrations.  


### Major Technologies Used  

- Python 3.12.2  
- Jupyter Notebook  
- pandas  
- matplotlib  
- requests  


### System Requirements  

#### Hardware  

- A modern computer with at least 8GB RAM and 2GHz multi-core CPU.  
- Internet access for API calls.  

#### Software  

- Python 3.12 or higher  
- Recommended: Conda for environment management.  

#### Manual Dependencies 
If not using `requirements.txt` please pip install the following if you don't already have these libraries:  
- pandas  
- pathlib  
- matplotlib  
- holoviews  
- geoviews  
- hvplot  
- seaborn  
- dataframe\_image  


## Detailed Description  

### Workflow  
1. **Data Extraction**:  
  - Download and clean FEMA dataset.  
  - Apply minor and major cleaning steps, including regex operations and vector mappings.  
  - Sets up HavocMapper/assets directory  
2. **API Integration**:  
  - Geocode locations using Geoapify API.  
  - Utilize `ThreadPoolExecutor` for multi-threaded API calls.  
3. **Data Aggregation**:  
  - Summarize FEMA merged geocoded data via groupby to reduce data points.  
  - Export multiple intermediate and final CSV files.  
4. **Analysis and Visualization**:  
  - Load cleaned data for analysis.  
  - Analyze via different lenses of time, states, types of disasters, and response times.
  - Generate visualizations such as maps, line plots, and bar charts, and scatter plots.  

### Purpose and Goals  

- Provide insights into FEMA disaster responses over time.  
- Highlight the efficiency and accuracy of FEMA's dataset.  
- Identify trends and anomalies in disaster declarations.  

### Techniques Applied  

- Regex for text data cleaning.  
- Multi-threading for API efficiency.  
- Vectorized operations for improved performance.  
- Exploratory data analysis (EDA) with Pandas and Matplotlib.  

### Preferred Viewing Method  

- View notebooks in VS Code or Jupyter Notebook.  
- Check saved figures in the `assets/fig/` directory.  
- Review intermediate CSVs in `assets/csv/`.  


## Key Challenges  

1. Deciding on project goals and API usage.
2. Understanding and parsing FEMA's dataset.  
3. Handling API rate limits and multi-threading with a large dataset.  
4. Adapting workflow to handle large datasets efficiently.  
5. Creating efficient workflow that allowed everyone to contribute at the same time


## Directory Structures  

### Original Cloned Repo  

```  
HavocMapper/
|-- docs/
|-- havoc_ETL.ipynb
|-- havoc_analysis.ipynb
|-- requirements.txt
```  

### New Expected Structure  

```  
HavocMapper/
|-- assets/
|   |-- csv/
|   |   |-- raw/
|   |   |-- clean/
|   |-- fig/
```  


## Deliverables  

### Visualizations  

- Line plots, scatter plots, and bar charts.  
- Choropleth maps with Holoviews and Bokeh.  

### Analyses  

- FEMA disaster trends by state and time.  
- Severe weather/storm trends by years.  
- Cycle times and distributions of responses.  
- Geographic distribution of disaster events by type and disaster itself.

### Saved Figures and Models  

- Figures saved in the `assets/fig/` directory, organized by contributor.  

### Google Slides Presentation  

- Overview of findings, shared in PDF format in `docs/PDFs/`.  


## Contributors  

- **Alex**: Disaster frequencies and trends.  
- **Avenika**: Storm trends and summaries.  
- **Claudia**: Disaster cycles and state responses.  
- **Neel**: GitHub management, API integration, README creation.  


## Data Sources and Citations  

- [FEMA Disaster Declarations Summary Dataset](https://www.fema.gov/openfema-data-page/disaster-declarations-summaries-v2)  
- [Geoapify API](https://www.geoapify.com/)  


## Long Form Directory Structure

Structure of GitHub Repo:
```
HavocMapper/
|
|-- docs/
|   |-- Expected Assets/
|   |   |-- csv/
|   |   |   |-- clean/
|   |   |   |   |-- distilled_summary.csv
|   |   |   |   |-- femaDisasters_geocode.csv
|   |   |   |-- raw/
|   |   |   |   |-- DisastersDeclarationsSummaries.csv
|   |   |   |   |-- femaDisasters_rough.csv
|   |   |   |   |-- location_geocode.csv
|   |   |-- fig/
|   |   |   |-- alex/
|   |   |   |   |-- MostCommonDisasters_byTopStates.png
|   |   |   |   |-- Top10_MostFrequent_Disasters.png
|   |   |   |   |-- Top10_States_MostDisasters.png
|   |   |   |-- avenika/
|   |   |   |   |-- FloodTrend_byYear.png
|   |   |   |   |-- HurricaneTrend_byYear.png
|   |   |   |   |-- SevereStormTrend_byYear.png
|   |   |   |-- claudia/
|   |   |   |   |-- AvgCycleTime_byType.png
|   |   |   |   |-- CycleTimeDistr_byType.png
|   |   |   |   |-- DisasterCount_byState.png
|   |   |   |   |-- DisasterNumber_overTime.png
|   |   |   |   |-- DisasterNumbers_byYear.png
|   |   |   |   |-- TimeForDeclaration_byState.png
|   |   |   |   |-- Year_over_year_disasters.png
|   |   |   |-- neel/
|   |   |   |   |-- cleaned_df.png
|   |   |   |   |-- original_df.png
|   |   |   |   |-- summary_df.png
|   |-- Original Notebooks/
|   |   |-- Alex_Notebook.ipynb
|   |   |-- Avenika_Notebook.ipynb
|   |   |-- Claudia_Notebook.ipynb
|   |   |-- Neel_Notebook.ipynb
|   |-- PDFs/
|   |   |-- disaster_declaration_process.pdf
|   |   |-- FEMA Weather Impact Analysis.pdf
|   |   |-- InternationalCountryCodes.pdf
|   |-- fact_sheet.md
|- .gitignore
|- DisastersDeclarationsSummaries.csv
|- havoc_ETL.ipynb
|- havoc_analysis.ipynb
|- README.md
|- requirements.txt
```

Structure of Intended Output Directory with new assets directory - should mimic the Expected Assets directory:
```
HavocMapper/
|
|-- assets/
|   |-- csv/
|   |   |-- clean/
|   |   |   |-- distilled_summary.csv
|   |   |   |-- femaDisasters_geocode.csv
|   |   |-- raw/
|   |   |   |-- DisastersDeclarationsSummaries.csv
|   |   |   |-- femaDisasters_rough.csv
|   |   |   |-- location_geocode.csv
|   |-- fig/
|   |   |-- alex/
|   |   |   |-- MostCommonDisasters_byTopStates.png
|   |   |   |-- Top10_MostFrequent_Disasters.png
|   |   |   |-- Top10_States_MostDisasters.png
|   |   |-- avenika/
|   |   |   |-- FloodTrend_byYear.png
|   |   |   |-- HurricaneTrend_byYear.png
|   |   |   |-- SevereStormTrend_byYear.png
|   |   |-- claudia/
|   |   |   |-- AvgCycleTime_byType.png
|   |   |   |-- CycleTimeDistr_byType.png
|   |   |   |-- DisasterCount_byState.png
|   |   |   |-- DisasterNumber_overTime.png
|   |   |   |-- DisasterNumbers_byYear.png
|   |   |   |-- TimeForDeclaration_byState.png
|   |   |   |-- Year_over_year_disasters.png
|   |   |-- neel/
|   |   |   |-- cleaned_df.png
|   |   |   |-- original_df.png
|   |   |   |-- summary_df.png
|-- docs/
|   |-- Expected Assets/
|   |   |-- csv/
|   |   |   |-- clean/
|   |   |   |   |-- distilled_summary.csv
|   |   |   |   |-- femaDisasters_geocode.csv
|   |   |   |-- raw/
|   |   |   |   |-- DisastersDeclarationsSummaries.csv
|   |   |   |   |-- femaDisasters_rough.csv
|   |   |   |   |-- location_geocode.csv
|   |   |-- fig/
|   |   |   |-- alex/
|   |   |   |   |-- MostCommonDisasters_byTopStates.png
|   |   |   |   |-- Top10_MostFrequent_Disasters.png
|   |   |   |   |-- Top10_States_MostDisasters.png
|   |   |   |-- avenika/
|   |   |   |   |-- FloodTrend_byYear.png
|   |   |   |   |-- HurricaneTrend_byYear.png
|   |   |   |   |-- SevereStormTrend_byYear.png
|   |   |   |-- claudia/
|   |   |   |   |-- AvgCycleTime_byType.png
|   |   |   |   |-- CycleTimeDistr_byType.png
|   |   |   |   |-- DisasterCount_byState.png
|   |   |   |   |-- DisasterNumber_overTime.png
|   |   |   |   |-- DisasterNumbers_byYear.png
|   |   |   |   |-- TimeForDeclaration_byState.png
|   |   |   |   |-- Year_over_year_disasters.png
|   |   |   |-- neel/
|   |   |   |   |-- cleaned_df.png
|   |   |   |   |-- original_df.png
|   |   |   |   |-- summary_df.png
|   |-- Original Notebooks/
|   |   |-- Alex_Notebook.ipynb
|   |   |-- Avenika_Notebook.ipynb
|   |   |-- Claudia_Notebook.ipynb
|   |   |-- Neel_Notebook.ipynb
|   |-- PDFs/
|   |   |-- disaster_declaration_process.pdf
|   |   |-- FEMA Weather Impact Analysis.pdf
|   |   |-- InternationalCountryCodes.pdf
|   |-- fact_sheet.md
|- .gitignore
|- DisastersDeclarationsSummaries.csv
|- havoc_ETL.ipynb
|- havoc_analysis.ipynb
|- README.md
|- requirements.txt
```