select * 
from socialmedia;

Select platform,
	count(*) as post_count
    FROM socialmedia
    GROUP BY(platform)
    ORDER BY(platform);

SELECT language,
	COUNT(*) as post_count
    FROM socialmedia
    GROUP BY language
    ORDER BY post_count;


select *
from socialmedia
where shares_count <= 500000 and
language ='en' and
platform = 'instagram' ;

SELECT platform , count(platform) as count
FROM socialmedia
GROUP BY platform
ORDER BY count DESC; 

select *
from socialmedia;
SELECT language , COUNT(language) as count
FROM socialmedia
GROUP BY language
ORDER BY count DESC;


SELECT *
FROM socialmedia;



SELECT sentiment_label,count(sentiment_label) count
FROM socialmedia
GROUP BY sentiment_label;

SELECT 
    platform,
    ROUND(AVG(CHAR_LENGTH(text_content)), 2) AS avg_text_len
FROM socialmedia
GROUP BY platform
ORDER BY avg_text_len DESC;

SELECT 
    platform,
    sentiment_label,
    COUNT(*) AS post_count
FROM socialmedia
WHERE sentiment_label IN ('Positive', 'Negative')
GROUP BY platform, sentiment_label
ORDER BY platform, post_count DESC;

SELECT 
    platform,
    ROUND(100.0 * SUM(CASE WHEN sentiment_label = 'Positive' THEN 1 ELSE 0 END) / COUNT(*), 2) AS positive_percent,
    ROUND(100.0 * SUM(CASE WHEN sentiment_label = 'Negative' THEN 1 ELSE 0 END) / COUNT(*), 2) AS negative_percent
FROM socialmedia
GROUP BY platform
ORDER BY positive_percent DESC;
SELECT 
	hashtags,
    COUNT(*) as usage_count
    FROM socialmedia
    WHERE hashtags IS NOT NULL AND hashtags <> ''
    GROUP BY hashtags
    ORDER BY usage_count DESC
    LIMIT 20;
    
SELECT 
    sentiment_label,
    hashtags,
    COUNT(*) AS usage_count
FROM socialmedia
WHERE hashtags IS NOT NULL AND hashtags <> ''
GROUP BY sentiment_label, hashtags
ORDER BY sentiment_label, usage_count DESC
LIMIT 50;
SELECT 
    hashtags,   -- the hashtag
    SUM(CASE WHEN sentiment_label = 'Positive' THEN 1 ELSE 0 END) AS positive_count,
    SUM(CASE WHEN sentiment_label = 'Negative' THEN 1 ELSE 0 END) AS negative_count,
    ROUND(100.0 * SUM(CASE WHEN sentiment_label = 'Positive' THEN 1 ELSE 0 END) / COUNT(*), 2) AS positive_percent,
    ROUND(100.0 * SUM(CASE WHEN sentiment_label = 'Negative' THEN 1 ELSE 0 END) / COUNT(*), 2) AS negative_percent
FROM socialmedia
WHERE hashtags IS NOT NULL AND hashtags <> ''   -- ignore empty hashtags
GROUP BY hashtags
HAVING COUNT(*) > 5    -- optional: only keep hashtags with at least 5 uses
ORDER BY positive_percent DESC
LIMIT 20;

SELECT *
FROM socialmedia;

SELECT
	day_of_week as day_week,
	COUNT(*) as post_count
FROM socialmedia
GROUP BY day_of_week
ORDER BY FIELD(day_of_week,'Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday')DESC;

SELECT 
	platform,
	day_of_week,
    COUNT(*) as post_count 
FROM socialmedia
GROUP BY platform,day_of_week
ORDER BY post_count DESC;
