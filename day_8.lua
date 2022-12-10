require "Grid"
write = io.write

input_file = io.open(arg[1], "r")
str = input_file:read("a")

local g = Grid:new()
g:read(str)


total = 0
for y = 1, #g.rows do
    for x = 1, #g:cols() do
        tree = g:get(x,y)
        r = g.rows[y]
        c = g:col(x)
        v_left = true
        v_right = true
        v_down = true
        v_up = true
        for new_x = x+1, #r do
            t = g:get(new_x,y)
            if t >= tree then v_left = false end
        end
        for new_x = x-1, 1, -1 do            
            t = g:get(new_x,y)
            if t >= tree then v_right = false end
        end
        for new_y = y+1, #c do
            t = g:get(x,new_y)
            if t >= tree then v_down = false end
        end
        for new_y = y-1, 1, -1 do
            t = g:get(x,new_y)
            if t >= tree then v_up = false end
        end
        visible = (v_up or v_down or v_left or v_right)
        if visible then total = total + 1 end
    end
end
print(total)

scenic = 0
for y = 1, #g.rows do
    for x = 1, #g:cols() do
        tree = g:get(x,y)
        r = g.rows[y]
        c = g:col(x)
        s_left = 0
        s_right = 0
        s_down = 0
        s_up = 0
        for new_x = x+1, #r do
            t = g:get(new_x,y)
            s_right = s_right + 1
            if t >= tree then break end
        end
        for new_x = x-1, 1, -1 do            
            t = g:get(new_x,y)
            s_left = s_left + 1
            if t >= tree then break end
        end
        for new_y = y+1, #c do
            t = g:get(x,new_y)
            s_down = s_down + 1
            if t >= tree then break end
        end
        for new_y = y-1, 1, -1 do
            t = g:get(x,new_y)
            s_up = s_up + 1
            if t >= tree then break end
        end
        s = (s_right * s_left * s_up * s_down)
        scenic = math.max(s, scenic)
    end
end
print(scenic)