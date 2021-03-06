DROP TABLE IF EXISTS tr.hotness_score;

CREATE TABLE tr.hotness_score AS

SELECT
  year_month_day,
  (MAX(case when element='TMAX' Then data_value Else NULL END) + MIN(case when element='TMIN' Then data_value Else NULL END))*1.0/2 median_temp
FROM
  tr.yearly_data st
Where
    st.id like 'GM%'
GROUP BY year_month_day;
