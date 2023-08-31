#Answer 1)
SELECT date, SUM(impressions) AS total_impressions
FROM marketing_data
GROUP BY date
ORDER BY date;

#Answer 2) 
SELECT state, SUM(revenue) AS total_revenue
FROM website_revenue
GROUP BY state
ORDER BY total_revenue DESC
LIMIT 3;

#Answer 3) 
SELECT c.name AS campaign_name, 
       SUM(md.cost) AS total_cost, 
       SUM(md.impressions) AS total_impressions, 
       SUM(md.clicks) AS total_clicks, 
       SUM(wr.revenue) AS total_revenue
FROM campaign_info c
JOIN marketing_data md ON c.id = md.campaign_id
JOIN website_revenue wr ON c.id = wr.campaign_id
GROUP BY c.id, campaign_name;

#Answer 4) 
SELECT wr.state, SUM(md.conversions) AS total_conversions
FROM marketing_data md
JOIN website_revenue wr ON md.campaign_id = wr.campaign_id
WHERE md.campaign_id = 'Campaign5'
GROUP BY wr.state
ORDER BY total_conversions DESC
LIMIT 1;

#Answer 5) -- Efficiency could be calculated by dividing revenue by cost. 
-- Higher efficiency implies higher revenue generated for the cost incurred.
-- Let's assume that efficiency is represented by a column named 'efficiency' in the output.
SELECT c.name AS campaign_name,
       (SUM(wr.revenue) / SUM(md.cost)) AS efficiency
FROM campaign_info c
JOIN marketing_data md ON c.id = md.campaign_id
JOIN website_revenue wr ON c.id = wr.campaign_id
GROUP BY c.name
ORDER BY efficiency DESC
LIMIT 1;



#Answer 6) SELECT DAYNAME(date) AS day_of_week, 
       AVG(impressions) AS avg_impressions
FROM marketing_data
GROUP BY day_of_week
ORDER BY avg_impressions DESC
LIMIT 1;
