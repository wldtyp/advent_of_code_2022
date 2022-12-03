input_file = io.open(arg[1], "r")

max = 0
current_total = 0

for l in input_file:lines() do 
	if #l > 0 then
		current_total = current_total +  l
	else
		if current_total > max then max = current_total end
		current_total = 0
	end
end
print(max)

