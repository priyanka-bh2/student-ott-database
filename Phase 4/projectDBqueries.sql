-- Find students names whose email contains 'example.net', order by Name, fetch top 5
SET PAGESIZE 100
SET LINESIZE 100
COLUMN name FORMAT A30
SELECT s.name
FROM F23_S001_T5_Students s
JOIN F23_S001_T5_Subscription sub ON s.SubscriptionID = sub.SubscriptionID
WHERE s.Email LIKE '%example.net%'
ORDER BY s.Name
FETCH FIRST 5 ROWS ONLY;


--For each genre how many students watch it?

SET PAGESIZE 100
SET LINESIZE 100
COLUMN genre FORMAT A15
COLUMN "Count(StudentID)" FORMAT 99999
select M.genre, count(S.StudentID)
from F23_S001_T5_Students S,F23_S001_T5_Watches W, F23_S001_T5_Media M 
where S.StudentID=W.StudentID and W.ContentID=M.ContentID
group by M.genre;

-- Count the number of students who have given reviews and their average ratings, filter those with an average rating greater than 4

SET PAGESIZE 100
SET LINESIZE 100
COLUMN StudentID FORMAT 99999
COLUMN Name FORMAT A30
COLUMN ReviewCount FORMAT 99999
COLUMN AvgRating FORMAT 999.99
SELECT s.StudentID,s.Name,COUNT(s.Reviews) AS ReviewCount,AVG(s.Ratings) AS AvgRating
FROM F23_S001_T5_Students s
JOIN F23_S001_T5_Students r ON s.StudentID = r.StudentID
GROUP BY s.StudentID, s.Name
HAVING AVG(s.Ratings) > 4;

-- Count the number of watches for each student, including their subscription details

SELECT s.StudentID, s.Name, sub.SubscriptionID, COUNT(w.ContentID) AS WatchCount
FROM F23_S001_T5_Students s
JOIN F23_S001_T5_Watches w ON s.StudentID = w.StudentID
JOIN F23_S001_T5_Subscription sub ON s.SubscriptionID = sub.SubscriptionID
GROUP BY s.StudentID, s.Name, sub.SubscriptionID;

-- Calculate the total views for each subscription level and device type, including overall total
SELECT 
  s.subscriptionid,
  d.type,
  SUM(m.views) AS total_views,
  SUM(SUM(m.views)) OVER () AS overall_total
FROM F23_S001_T5_Subscription s
JOIN F23_S001_T5_Students st ON s.subscriptionid = st.subscriptionid
JOIN F23_S001_T5_Device d ON st.studentid = d.studentid
JOIN F23_S001_T5_Watches w ON st.studentid = w.studentid
JOIN F23_S001_T5_Media m ON w.contentid = m.contentid
GROUP BY s.subscriptionid, d.type;





--Retrieve distinct ContentID values and corresponding media titles from the F23_S001_T5_Watches and F23_S001_T5_Media tables for content that has been watched by all students who have not watched any 'Drama' content.
SET PAGESIZE 100
SET LINESIZE 150
COLUMN MediaTitle FORMAT A50
SELECT DISTINCT w1.ContentID, m.Title AS MediaTitle
FROM F23_S001_T5_Watches w1
JOIN F23_S001_T5_Media m ON m.ContentID = w1.ContentID
WHERE NOT EXISTS (
    SELECT s.StudentID
    FROM F23_S001_T5_Students s
    WHERE NOT EXISTS (
        SELECT w2.ContentID
        FROM F23_S001_T5_Watches w2
        WHERE w2.StudentID = s.StudentID
        AND w2.ContentID = w1.ContentID
    )
    AND NOT EXISTS (
        SELECT m2.ContentID
        FROM F23_S001_T5_Media m2
        WHERE m2.Genre = 'Drama'
        AND m2.ContentID = w1.ContentID
    )
);


--Retrieve the StudentID, ContentID, SubscriptionID, and the count of watches for each distinct combination of these columns and generate subtotals and a grand total for the counts based on the specified columns (StudentID, ContentID, SubscriptionID) 
SELECT w.StudentID, w.ContentID, s.SubscriptionID, COUNT(*) AS WatchCount
FROM F23_S001_T5_Watches w
JOIN F23_S001_T5_Students s ON w.StudentID = s.StudentID
JOIN F23_S001_T5_Media m ON w.ContentID = m.ContentID
GROUP BY CUBE (w.StudentID, w.ContentID, s.SubscriptionID);


--Retrieve the StudentID, Genre, and the count of watches for each distinct combination of these columns to provide subtotals at different levels, including subtotals for individual StudentID, individual Genre, and a grand total.
SELECT
    w.StudentID,
    m.Genre,
    COUNT(*) AS WatchCount
FROM
    F23_S001_T5_Watches w
JOIN
    F23_S001_T5_Media m ON w.ContentID = m.ContentID
GROUP BY
    ROLLUP (w.StudentID, m.Genre);
