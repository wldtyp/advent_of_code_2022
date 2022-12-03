input_file = io.open(arg[1], "r")

-- A Rock, B Paper, C Scissors
-- 1 for Rock, 2 for Paper, and 3 for Scissors
-- 0 if you lost, 3 if the round was a draw, and 6 if you won


scoring = { AX = 4, 	
			AY = 8, 	
			AZ = 3, 	
			BX = 1, 	
			BY = 5, 	
			BZ = 9,   
			CX = 7, 	
			CY = 2,	
			CZ = 6,
		}

part_b_scoring = {
			AX = 3, -- lose 0 + 3  	
			AY = 4, -- draw	3 + 1
			AZ = 8, -- win	6 + 2
			BX = 1, -- lose 0 + 1	
			BY = 5, -- draw	3 + 2	
			BZ = 9, -- win	6 + 3
			CX = 2, -- lose	0 + 2	
			CY = 6,	-- draw	3 + 3
			CZ = 7, -- win	6 + 1
		}

sum_a = 0
sum_b = 0

for line in input_file:lines() do
	key = string.gsub(line, " ", '')
	sum_a = sum_a + scoring[key]
	sum_b = sum_b + part_b_scoring[key]
end

print(sum_a, sum_b)