-- US#213768 Views: Add Quarters and other grouped planned dates as lanes
USE "@Database";
GO

CREATE FUNCTION [dbo].[f_FloorHalfYear]
(
	@date DATETIME
)
RETURNS DATETIME
AS
BEGIN
    DECLARE @flooredYear DATETIME;
    SET @flooredYear = [dbo].[f_FloorYear](@date);

    DECLARE @month int;
    SET @month = DATEDIFF(MONTH, @flooredYear, @date) + 1;

    IF @month <= 6
    	RETURN @flooredYear;

	RETURN DATEADD(MONTH, 6, @flooredYear);
END
GO
