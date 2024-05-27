SELECT	[index],
		[TITLE],
		[RELEASE_YEAR],
		[SCORE],
		[NUMBER_OF_SEASONS],
		[MAIN_GENRE],
		[MAIN_PRODUCTION]
  FROM [NetflixDataset].[dbo].[BestShows] 


  SELECT 
  MIN([NUMBER_OF_SEASONS]) as 'Number_of_Seasons'
  FROM [NetflixDataset].[dbo].[BestShows] GROUP BY [NUMBER_OF_SEASONS]

 
  --Inserting South African netflix shows into the table
INSERT INTO [NetflixDataset].[dbo].[BestShows]
VALUES
('31', 'Blood and Water', '2020', '7.2', '4', 'Drama', 'RSA'),
('32', 'Young, Famous and African', '2022', '4.9', '1', 'Reality', 'RSA'),
('33', 'Kings of Joburg', '2020', '5.4', '2', 'Crime', 'RSA'),
('34', 'Queen Sono', '2020', '9.1', '1', 'Action', 'RSA');

--Inserting duplicate South African show for the purpose of demonstrating modification in the 
--next SQL query
INSERT INTO [NetflixDataset].[dbo].[BestShows]
VALUES ('35', 'Queen Sono', '2020', '9.1', '1', 'Action', 'RSA')

--Updating a record
UPDATE [NetflixDataset].[dbo].[BestShows] 
SET [MAIN_GENRE] = 'Thriller' 
WHERE [INDEX] = '33'
 
 --Using the DELETE funcion to remove the duplicate values.
DELETE FROM [NetflixDataset].[dbo].[BestShows] 
WHERE [INDEX] = '35';

  --Selecting the average score from this range
SELECT 
AVG([SCORE]) AS 'Average Score' 
FROM NetflixDataset.dbo.BestShows

--Selecting shows that are above the average score (8.4) from the years 2015 and onwards
SELECT	[index],
		[TITLE],
		[RELEASE_YEAR],
		[SCORE],
		[NUMBER_OF_SEASONS],
		[MAIN_GENRE],
		[MAIN_PRODUCTION]
  FROM [NetflixDataset].[dbo].[BestShows] 
  WHERE [SCORE] > 8.4 
  AND [RELEASE_YEAR] >= 2015
  ORDER BY 4 DESC;

  
  --Selecting which countries had the most productions from highest to lowest--
  --Result: Considering that the average score across the dataset was "8.4", the below query
  -- highlights that 4 out 5 main proudction regions were above average and only RSA was below.
  SELECT
  [MAIN_PRODUCTION] AS 'Main Production',
  COUNT([MAIN_PRODUCTION]) AS '# of Shows Produced',
  AVG([SCORE]) AS 'Average Score per Region'
  FROM [NetflixDataset].[dbo].[BestShows] 
  GROUP BY [MAIN_PRODUCTION]
  ORDER BY 'Average Score per Region' DESC 



