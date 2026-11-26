-- Sanity Check for Values --

-- total count for rows in places: 3860
SELECT COUNT(*)
FROM places;

-- South Carolina county count: 46
SELECT COUNT(DISTINCT LocationName) 
FROM places;

-- values types for measures: CrdPrv (crude) and AgeAdjPrv (age-adjusted)
SELECT DISTINCT DataValueTypeID
FROM places;

-- filter for age-adjusted prevalence to account for age differences
SELECT *
FROM places
WHERE DataValueTypeID = 'AgeAdjPrv';

-- top 10 counties with highest uninsured rate
SELECT LocationName AS [County], Data_Value AS [Percent]
FROM places
WHERE DataValueTypeID = 'AgeAdjPrv'
	AND MeasureId = 'ACCESS2'
ORDER BY Data_Value ASC LIMIT 10;

-- measure averages for all 46 SC counties
SELECT Short_Question_Text AS [Description], ROUND(AVG(Data_Value), 1) AS [Average], MeasureId AS [Measure] 
FROM places
WHERE DataValueTypeID = 'AgeAdjPrv'
GROUP BY MeasureId;