input_file = io.open(arg[1], "r")

max = 0
current_total = 0

totals = {}

for l in input_file:lines() do 
	if #l > 0 then
		current_total = current_total +  l
	else
		totals[#totals + 1] = current_total
		current_total = 0
	end
end

table.sort(totals, function(a, b) return a > b end)

print(totals[1] + totals[2] + totals[3])

-- for k,v in pairs(totals) do
-- 	print(k,v)
-- end


