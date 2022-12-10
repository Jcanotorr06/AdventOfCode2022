local open = io.open

-- Read Input File
local function read_file(path)
    local file = open(path, "rb") -- r read mode and b binary mode
    if not file then return nil end
    local content = file:read "*a" -- *a or *all reads the whole file
    file:close()
    return content
end

-- Parse Input into a grid
local function parseInput(input)
    local output = {}
    for row in input:gmatch("[^\r\n]+") do
        table.insert(output, {})
        for i = 1, #row do
            local char = row:sub(i,i)
            table.insert(output[#output], char)
        end
    end
    return output
end


Forest = read_file("input.txt")

ForestTable = parseInput(Forest)

-- Part 1 ----------------------------------------------------------------------

-- Check if a tree is visible from the four cardinal directions
local function isVisibleEast(grid, row, col)
    local height = grid[row][col]
    local size = #grid

    for i = col+1, size do
        local other = grid[row][i]
        if other >= height then
            return false
        end
    end
    return true
end

local function isVisibleWest(grid, row, col)
    local height = grid[row][col]

    for i = col-1, 1, -1 do
        local other = grid[row][i]
        if other >= height then
            return false
        end
    end
    return true
end

local function isVisibleNorth(grid, row, col)
    local height = grid[row][col]

    for i = row-1, 1, -1 do
        local other = grid[i][col]
        if other >= height then
            return false
        end
    end
    return true
end

local function isVisibleSouth(grid, row, col)
    local height = grid[row][col]
    local size = #grid

    for i = row+1, size do
        local other = grid[i][col]
        if other >= height then
            return false
        end
    end
    return true
end

local function isVisible(grid, row, col)
    return isVisibleEast(grid, row, col) or isVisibleWest(grid, row, col) or isVisibleNorth(grid, row, col) or isVisibleSouth(grid, row, col)
end

VisibleTreeCount = 0

for i = 1, #ForestTable do
    for j = 1, #ForestTable[i] do
        if isVisible(ForestTable, i, j) then
            VisibleTreeCount = VisibleTreeCount + 1
        end
    end
end

print("Visible trees: " .. VisibleTreeCount)

-- Part 2 ----------------------------------------------------------------------
-- Measure the viewing distance of a tree in all four cardinal directions

local function getDistanceEast(grid, row, col)
    local height = grid[row][col]
    local size = #grid
    local distance = 0
    if col == size then
        return 0
    end

    for i = col+1, size do
        local other = grid[row][i]
        if other >= height then
            distance = distance + 1
            return distance
        end
        distance = distance + 1
    end
    return distance
end

local function getDistanceWest(grid, row, col)
    local height = grid[row][col]
    local distance = 0
    if col == 1 then
        return 0
    end

    for i = col-1, 1, -1 do
        local other = grid[row][i]
        if other >= height then
            distance = distance + 1
            return distance
        end
        distance = distance + 1
    end
    return distance
end

local function getDistanceNorth(grid, row, col)
    local height = grid[row][col]
    local distance = 0
    if row == 1 then
        return 0
    end

    for i = row-1, 1, -1 do
        local other = grid[i][col]
        if other >= height then
            distance = distance + 1
            return distance
        end
        distance = distance + 1
    end
    return distance
end

local function getDistanceSouth(grid, row, col)
    local height = grid[row][col]
    local size = #grid
    local distance = 0
    if row == size then
        return 0
    end

    for i = row+1, size do
        local other = grid[i][col]
        if other >= height then
            distance = distance + 1
            return distance
        end
        distance = distance + 1
    end
    return distance
end

local function getDistance(grid, row, col)
    return getDistanceEast(grid, row, col) * getDistanceWest(grid, row, col) * getDistanceNorth(grid, row, col) * getDistanceSouth(grid, row, col)
end

HighestDistance = 0

for i = 1, #ForestTable do
    for j = 1, #ForestTable[i] do
        if getDistance(ForestTable, i, j) > HighestDistance then
            HighestDistance = getDistance(ForestTable, i, j)
        end
    end
end

print("Highest distance: " .. HighestDistance)
