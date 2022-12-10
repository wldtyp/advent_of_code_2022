function new_stack()
    local stack = {}
    local top = 0
    function stack:push(item)
        top = top + 1
        self[top] = item
    end
    function stack:push_back(item)
        table.insert(self,1,item)
        top = top + 1
    end
    function stack:pop()
        local item = self[top]
        self[top] = nil
        top = top - 1
        return item
    end
    return stack
end

cols = 9

input_file = io.open(arg[1], "r")

stacks = {}
for i=1, 9 do
    stacks[i] = new_stack()
end

function to_table(iter)
    local t = {}
    for v in iter do
        t[#t+1] = v
    end
    return t
end

function reverse(table)
    local temp = {}
    for i=#table, 1, -1 do
        temp[#temp+1] = table[i]
    end
    return temp
end

while true do
    line = input_file:read()
    if line:find('%s%d') then break end
    for i=1, cols*4, 4 do
        local n = (i+3)//4
        local letter = line:sub(i+1, i+1)
        if letter ~= ' ' then 
            stacks[n]:push_back(letter)
        end
    end
end

input_file:read()
for line in input_file:lines() do
    m = line:gmatch('%d+')
    local n, from, to = tonumber(m()), tonumber(m()), tonumber(m())
    print(n, from, to)
    local temp = {}
    for i = 1, n do
        local x = stacks[from]:pop()
        temp[#temp+1] = x
    end
    temp = reverse(temp)
    for _, value in pairs(temp) do
        stacks[to]:push(value)
    end
    
end

s = ''
for i=1, cols do
    s = s .. stacks[i]:pop()
end
print(s)
-- for i=1, cols do
--     stacks[i] = new_stack()
-- end