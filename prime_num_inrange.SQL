DECLARE @UpperLimit INT, @LoweLimit INT

SET @UpperLimit = 10000
SET @LoweLimit = 0

DECLARE @N INT, @P INT
DECLARE @DUMMY TABLE (Number INT NULL, NotPrimeNum INT NULL)

SET @P = @UpperLimit

WHILE @P > @LoweLimit
	BEGIN
		INSERT INTO @DUMMY(Number) VALUES (@P)
		IF (@P <> 2 AND @P%2 = 0) OR (@P IN (0, 1))
			BEGIN
				INSERT INTO @DUMMY(NotPrimeNum) VALUES (@P)
			END
		ELSE
			BEGIN
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
			END
		SET @P = @P - 1
	END

SELECT Number AS PrimeNumbers
FROM @DUMMY 
WHERE Number NOT IN(SELECT A.Number FROM @DUMMY A INNER JOIN @DUMMY B ON A.Number = B.NotPrimeNum)
ORDER BY PrimeNumbers

