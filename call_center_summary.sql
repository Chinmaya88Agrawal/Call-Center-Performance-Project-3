
-- Call Center Data Summarization SQL Script

-- 1. Total calls per agent
SELECT Agent, COUNT(*) AS Total_Calls
FROM CallCenter
GROUP BY Agent;

-- 2. Answered vs Unanswered calls
SELECT Answered, COUNT(*) AS Count_Calls
FROM CallCenter
GROUP BY Answered;

-- 3. Resolved rate per agent
SELECT Agent, AVG(CAST(Resolved AS FLOAT))*100 AS Resolved_Rate_Percent
FROM CallCenter
GROUP BY Agent;

-- 4. Average satisfaction rating per agent
SELECT Agent, AVG(Satisfaction_rating) AS Avg_Satisfaction
FROM CallCenter
GROUP BY Agent;

-- 5. Average talk duration per topic
SELECT Topic, AVG(TalkDurationSeconds) AS Avg_Talk_Duration_Seconds
FROM CallCenter
GROUP BY Topic;

-- 6. Daily summary
SELECT CAST(Datetime AS DATE) AS Call_Date,
       COUNT(*) AS Total_Calls,
       AVG(Satisfaction_rating) AS Avg_Satisfaction,
       AVG(TalkDurationSeconds) AS Avg_Talk_Duration
FROM CallCenter
GROUP BY CAST(Datetime AS DATE)
ORDER BY Call_Date;
