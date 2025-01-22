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


## Setup  

### Quick-Run Instructions  

1. Clone the repository in the local directory of your choosing: `cd your/path/here`  
    - Using the HTTPS web URL  
        ```bash  
        git clone https://github.com/neelka96/havocmapper.git  
        cd havocmapper  
        ```  
    - Using a password protected SSH Key (if you have it enabled other wise use method above)  
        ```bash  
        git clone git@github.com:Neelka96/HavocMapper.git  
        cd havocmapper  
        ```  
2. Create a virtual environment (optional but recommended)  
    - With Conda  
        ```bash  
        conda create --name venv python=3.12.2  
        conda activate venv  
        ```  
    - With Built-in Python venv Library  
        ```bash  
        python -m venv venv  
        source venv/bin/activate  # On Windows: venv\Scripts\activate  
        ```  
3. Install dependencies:  
    ```bash  
    pip install -r requirements.txt  
    ```  
4. Add API keys in a file named `api_keys.py`:  
    ```python  
    geoapify_NEEL_1 = "your_api_key_here"  
    # Add additional keys as needed  
    ```  
> [!NOTE]  
> While the native system all code was built on runs through the conda python interpreter (Anaconda Distribution), all
> dependencies were loaded through pip to ensure cross-compatibility with other Python interpreters. Anaconda's official
> statement is that they can not ensure the resolution of dependency conflicts from packages installed through Pypi, BUT
> conda does naturally house pip installed dependencies separately from each other when installed in different conda
> environments. When creating a new environment from scratch, this process will almost always function as intended!


### Notebook Execution Order  

1. Run `havoc_ETL.ipynb` first to prepare the dataset and geocode locations.  
2. Follow with `havoc_analysis.ipynb` for visualizations and analyses.  

### Reading Notebooks Effectively  

- Use Jupyter Notebook's Outline feature (e.g., in VS Code) to collapse and expand sections for better navigation.  
- Outputs and markdown are organized with headings and foldable cells for clarity.  


## General Overview  

This project follows a structured workflow to explore and analyze FEMA's disaster declarations. Data is extracted, cleaned,  
geocoded, and visualized to identify trends in extreme weather responses, leveraging modern Python libraries and API integrations.  


## Major Technologies Used  

- Python 3.12.2  
- pandas  
- matplotlib  
- hvplot  
- holoviews  
- seaborn  
- dataframe\_image  
- requests  
- pathlib  
- Jupyter Notebook  


## System Requirements  

### Hardware  

- A modern computer with at least 8GB RAM and 2GHz multi-core CPU.  
- Internet access for API calls.  

### Software  

- Python 3.12 or higher  
- Recommended: Conda for environment management.  

### Manual Dependencies (if not using `requirements.txt`)  

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
   - Apply minor and major cleaning steps, including regex operations.  
2. **API Integration**:  
   - Geocode locations using Geoapify API.  
   - Utilize `ThreadPoolExecutor` for multi-threaded API calls.  
3. **Data Aggregation**:  
   - Summarize geocoded data.  
   - Export multiple intermediate and final CSV files.  
4. **Analysis and Visualization**:  
   - Load cleaned data for analysis.  
   - Generate visualizations such as maps, line plots, and bar charts.  

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

1. Understanding and parsing FEMA's dataset.  
2. Handling API rate limits with 9 keys and multi-threading.  
3. Adapting workflow to handle large datasets efficiently.  


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
- Cycle times and distributions of responses.  

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

