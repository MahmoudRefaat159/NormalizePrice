USE [cofiguration]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER FUNCTION [dbo].[NormalizePrice] (@price NVARCHAR(50))
RETURNS NVARCHAR(50)
AS
BEGIN
    DECLARE @normalizedPrice NVARCHAR(50)
    
    SET @normalizedPrice = REPLACE(@price, '€', '')
 
    SET @normalizedPrice = CASE
        WHEN CHARINDEX(',', @normalizedPrice) > CHARINDEX('.', @normalizedPrice)
             AND CHARINDEX('.', @normalizedPrice) > 0 
             AND CHARINDEX(',', @normalizedPrice) > 0 THEN
           
            REPLACE(REPLACE(@normalizedPrice, '.', ''), ',', '.')
        WHEN CHARINDEX(',', @normalizedPrice) < CHARINDEX('.', @normalizedPrice)
             AND CHARINDEX('.', @normalizedPrice) > 0 
             AND CHARINDEX(',', @normalizedPrice) > 0 THEN
          
            REPLACE(@normalizedPrice, ',', '')
        WHEN @normalizedPrice LIKE '%,%' THEN
            
            REPLACE(@normalizedPrice, ',', '.')
        ELSE
         
            @normalizedPrice end
			return @normalizedPrice;

END