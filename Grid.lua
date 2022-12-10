Grid = {
    rows = {},
    _cols = nil,
    height = 0,
    width = 0,
    number = true
}

function Grid:new(o)
    o = o or {}
    self.__index = self
    setmetatable(o, self) 
    return o
end

function Grid:read(str)
    for line in str:gmatch('([^\n]*)\n?') do 
        row = {}
        for c in line:gmatch('.') do
            if self.number then c = tonumber(c) end
            table.insert(row, c)
        end
        table.insert(self.rows, row)
    end
end

function Grid:print()
    for y, r in ipairs(self.rows) do
        for x, cell in ipairs(r) do
            io.write(cell)
        end
        io.write('\n')
    end
end

function Grid:cols()
    if self._cols == nil then
        self._cols = {}
        for i = 1, #self.rows do
            self._cols[i] = {}
        end
        for rowi, row in ipairs(self.rows) do
            for i, value in ipairs(row) do
                table.insert(self._cols[i], value)
            end
        end
    end
    return self._cols
end

function Grid:get(x,y)
    return self.rows[y][x]
end

function Grid:is_edge(x,y)
    return x  == 1 or x == #self.rows[1] or y == 1 or y == #self.rows  
end

function Grid:row(n)
    return self.rows[n]
end

function Grid:col(n)
    return self:cols()[n]
end

function dump(table)
	for _, s in pairs(table) do
		print(s)
	end
end	