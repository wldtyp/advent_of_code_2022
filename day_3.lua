input_file = io.open(arg[1], "r")


p = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

total = 0

for line in input_file:lines() do
	local half = #line / 2
	left = string.sub(line,1,half)
	right = string.sub(line,half+1,#line)

	for c in left:gmatch(".") do 
		index = right:find(c)
		if index then 
			match = right:sub(index,index)
			total = total + ((p:find(match)))
			break
		end
	end
end

print(total)
input_file:seek('set')

total2 = 0
function to_set(backpack)
	local s = {}
	for c in backpack:gmatch(".") do
		s[c] = true
	end
	return s
end

while true do
	a, b, c = input_file:read('l'),input_file:read('l'),input_file:read('l')
	if a == nil then break end
	a, b, c = to_set(a), to_set(b), to_set(c)
	for k, _ in pairs(a) do
		if b[k] ~= nil and c[k] ~= nil then
			total2 = total2 + ((p:find(k)))
		end
	end
end
print(total2)