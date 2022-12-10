
local input_file = io.open(arg[1], "r")
local stream = input_file:read('a')

print(stream)

function unique(str)
    local count = 0
    local tmp = {}
    for c in str:gmatch"." do
        if not tmp[c] then
            count = count + 1
            tmp[c] = true
        end
    end
    return count
end

function find_first_n_unique(stream, n)
    local one_less = n - 1
    for i = one_less, #stream do
        if unique(string.sub(stream, i-one_less, i)) > one_less then
            print( n .. ": " .. i)
            break
        end
    end
end

find_first_n_unique(stream, 4)
find_first_n_unique(stream, 14)