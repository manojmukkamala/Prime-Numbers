DECLARE @UpperLimit INT, @LoweLimit INT

SET @UpperLimit = 1000
SET @LoweLimit = 900

DECLARE @N INT, @P INT
DECLARE @DUMMY TABLE (Number INT NULL, NotPrimeNum INT NULL)

SET @P = @UpperLimit

WHILE @P > @LoweLimit
	BEGIN
		INSERT INTO @DUMMY(Number) VALUES (@P)
		SET @N =@P
		WHILE @N > 1
			BEGIN
				IF (@P%@N = 0 AND @P <> @N)
					BEGIN
						INSERT INTO @DUMMY(NotPrimeNum) VALUES (@P)
						BREAK
					END
				SET @N = @N - 1
			END
		SET @P = @P - 1
	END

SELECT Number AS PrimeNumbers
FROM @DUMMY 
WHERE Number NOT IN(SELECT A.Number FROM @DUMMY A INNER JOIN @DUMMY B ON A.Number = B.NotPrimeNum)
ORDER BY PrimeNumbers
