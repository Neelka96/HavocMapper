# Disaster Declaration Summaries Description

Disaster Declarations Summaries is a summarized dataset describing all federally declared disasters. This dataset lists all official FEMA Disaster Declarations, beginning with the first disaster declaration in 1953 and features all three disaster declaration types: major disaster, emergency, and fire management assistance. The dataset includes declared recovery programs and geographic areas (county not available before 1964; Fire Management records are considered partial due to historical nature of the dataset).

Please note the unique structure of the disaster sequencing (due to a numbering system that originated in the 1950's-1970's):
- 0001-1999 Major Disaster Declaration
- 2000-2999 Fire Management
- 3000-3999 Emergency Declaration (Special Emergency)
- 4000-4999 Major Disaster Declaration
- 5000-5999 Fire Management

For more information on the disaster declaration process, see https://www.fema.gov/disasters

- This is raw, unedited data from FEMA's National Emergency Management Information System (NEMIS) and as such is subject to a small percentage of human error. The dataset is primarily composed of historical data that was manually entered into NEMIS after it launched in 1998.
- Additionally, NEMIS utilizes census data from the United States Census Bureau in which Tribal Nations are listed as localities within a State. As such, disaster declarations for Tribal Nations are currently included in State data.


# How are incidents declared?
Please see: https://www.fema.gov/disaster/how-declared


# What is the difference between the declaration date, incident begin date, disaster closeout date, incident end date?
- Disaster declaration date - the date when a disaster was declared
- Disaster closeout date - the date when all financial transactions for all programs are completed and the disaster is closed
- Incident begin date - the date the actual incident or disaster began
- Incident end date - the date the incident or disaster ended

The incident period is the time interval during which the disaster-causing incident occurs. The Governor or Tribal Chief Executive usually requests the incident period “incident begin date” and “incident end date” in the request for a declaration. However, if the declaration has an incident period of “continuing,” FEMA has the delegated authority to close it. When FEMA closes the incident period after the declaration the dataset is updated to reflect the “incident end date.”


# Is there an API solution for determining if an address is in a FEMA disaster area?
The best method is to determine the county in which the address is located. The Disaster Declarations Summaries or FEMA Web Declaration Areas API endpoints can be used to look up a location by county. The placeName (or declaredCountyArea depending on the endpoint used) field contains a textual description of the county/area, while the last 3 digits of the placeCode field represents the FIPS county code. Zip codes are not useable because they can span county boundaries.


# How frequently is disaster data updated?
The dataset page indicates the update frequency. The frequency of update depends on the specific dataset. Most of the disaster related datasets are updated every 20 minutes. When accessing the datasets through the OpenFEMA API, the OpenFemaDataSets endpoint can be used to determine the last refresh time.

For example, the following URL displays metadata for the DisasterDeclarations Summaries dataset, indicating the last update in the “lastRefresh” field: https://www.fema.gov/api/open/v1/OpenFemaDataSets?$filter=name eq %27DisasterDeclarationsSummaries%27


# SOURCE: 
https://www.fema.gov/about/openfema/faq