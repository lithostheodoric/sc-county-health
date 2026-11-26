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