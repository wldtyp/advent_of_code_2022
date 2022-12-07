input_file = io.open(arg[1], "r")

function is_fully_contained(a1,a2,b1,b2)
	return ((a1 <= b1 and a2 >= b2) or (b1 <= a1 and b2 >= a2))
end

function overlap(a1,a2,b1,b2)
	if a1 < b1 then
		return a2 >= b1
	else
		return b2 >= a1
	end
end

function split(full_string, split_string)
	local substrings = {}
	i = full_string:find(split_string) 
	while i do 
		-- print(full_string)
		substrings[#substrings + 1] = full_string:sub(1,i-1)
		full_string = full_string:sub(i+#split_string)
		i = full_string:find(split_string)
	end
	substrings[#substrings + 1] = full_string
	return(substrings)
end

function dump(table)
	for _, s in pairs(table) do
		print(s)
	end
end	

function get_all_endpoints( line )
	pair = split(line, ',')
	first = split(pair[1], '-')
	second = split(pair[2], '-')
	return tonumber(first[1]), tonumber(first[2]), tonumber(second[1]), tonumber(second[2])
end

total = 0
total_overlap = 0 
for line in input_file:lines() do
	if is_fully_contained(get_all_endpoints(line)) then total = total + 1 end  
	if overlap(get_all_endpoints(line)) then total_overlap = total_overlap + 1 end  
end
print(total)
print(total_overlap)

