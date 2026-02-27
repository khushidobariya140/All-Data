create database exam;
Use exam;

-- 1️. Total & Average Daily Energy Consumption by Zone

SELECT 
    Zone,
    SUM(EnergyConsumed_kWh) AS Total_Energy_kWh,
    AVG(EnergyConsumed_kWh) AS Avg_Daily_Energy_kWh
FROM SmartCityEnergy
GROUP BY Zone
ORDER BY Total_Energy_kWh DESC;

-- 2.Top 5 Highest Energy-Consuming Consumers by Type
SELECT *
FROM (
    SELECT 
        MeterID,
        ConsumerType,
        SUM(EnergyConsumed_kWh) AS Total_Consumption,
        RANK() OVER (PARTITION BY ConsumerType 
                     ORDER BY SUM(EnergyConsumed_kWh) DESC) AS Rank_No
    FROM SmartCityEnergy
    GROUP BY MeterID, ConsumerType
) ranked
WHERE Rank_No <= 5;

-- 3. Monthly Trend of Consumption Across Zones

SELECT 
    Zone,
    YEAR(Date) AS Year,
    MONTH(Date) AS Month,
    SUM(EnergyConsumed_kWh) AS Monthly_Consumption
FROM SmartCityEnergy
GROUP BY Zone, YEAR(Date), MONTH(Date)
ORDER BY Year, Month, Zone;

-- 4.Average Cost per Zone
-- (EnergyConsumed × TariffRate)

SELECT 
    Zone,
    AVG(EnergyConsumed_kWh * TariffRate) AS Avg_Cost_Per_Zone
FROM SmartCityEnergy
GROUP BY Zone
ORDER BY Avg_Cost_Per_Zone DESC;

-- 5. Meters with Highest Number of Faults or Outages

SELECT 
    MeterID,
    COUNT(*) AS Fault_Count,
    SUM(OutageMinutes) AS Total_Outage_Minutes
FROM SmartCityEnergy
WHERE MeterStatus = 'Faulty' 
   OR OutageMinutes > 0
GROUP BY MeterID
ORDER BY Fault_Count DESC, Total_Outage_Minutes DESC;

-- 6. Zones with Lowest Energy Efficiency
-- (High Usage + Frequent Outages)

SELECT 
    Zone,
    SUM(EnergyConsumed_kWh) AS Total_Usage,
    SUM(OutageMinutes) AS Total_Outage,
    (SUM(EnergyConsumed_kWh) / NULLIF(SUM(OutageMinutes),0)) 
        AS Efficiency_Ratio
FROM SmartCityEnergy
GROUP BY Zone
ORDER BY Efficiency_Ratio ASC;
-- Lower ratio = inefficient zone.

-- 7.Peak Usage – Weekdays vs Weekends

SELECT 
    CASE 
        WHEN DAYOFWEEK(Date) IN (1,7) THEN 'Weekend'
        ELSE 'Weekday'
    END AS Day_Type,
    AVG(PeakUsage_kWh) AS Avg_Peak_Usage
FROM SmartCityEnergy
GROUP BY 
    CASE 
        WHEN DAYOFWEEK(Date) IN (1,7) THEN 'Weekend'
        ELSE 'Weekday'
    END;








