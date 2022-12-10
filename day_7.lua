input_file = io.open(arg[1], "r")

all_paths = {}
depth = {}
local current_path = '/'

function cd(p)
    print(p)
    all_paths[p] = 0
    table.insert(depth,p)
end

function cd_up()
    local x = table.remove(depth)
    return depth[#depth]
end

cd(current_path)

for line in input_file:lines() do
    if line:match('cd (%w+)') then
        x = line:match('cd (%w+)')
        current_path = current_path .. x .. '/'
        cd(current_path)
    elseif line:match('$ cd ..') then
        current_path = cd_up()
    elseif line:match('(%d+) [%w%.]+') then
        x, file = line:match('(%d+) ([%w%.]+)')
        for i = #depth, 1, -1 do
            p = depth[i]
            all_paths[p] = all_paths[p] + x
        end
        print(x, file)
    end
end

sum = 0 
for k,v in pairs(all_paths) do
    if v <= 100000 then
        sum = sum + v
        print(k,v)
    end
end
print(sum)

used_space = all_paths['/']
print('Used space:', all_paths['/'])
free_space = 70000000 - used_space
print('Free space:', free_space)
needed_space = math.abs(free_space - 30000000)
print("Needed space:", needed_space)

sizes = {}
for _,v in pairs(all_paths) do
    table.insert(sizes, v)
end

table.sort(sizes)
for k,v in pairs(sizes) do
    if v >= needed_space then
        print(v)
        break
    end
end
