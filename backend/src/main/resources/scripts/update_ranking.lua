-- Redis Lua Script for Atomic Contest Ranking Update
-- KEYS[1]: participantHashKey (e.g., contest:participant:1:101:live)
-- ARGV[1]: field (e.g., problem_5)
-- ARGV[2]: isAcNew (1 or 0)
-- ARGV[3]: submitTimeSec (seconds from contest start)

local liveKey = KEYS[1]
local field = ARGV[1]
local isAcNew = tonumber(ARGV[2])
local submitTimeSec = tonumber(ARGV[3])

local currentStatus = redis.call('HGET', liveKey, field)
local isAc = 0
local wrong = 0
local acTime = 0

if currentStatus and currentStatus ~= "" then
    local parts = {}
    for part in string.gmatch(currentStatus, "[^:]+") do
        table.insert(parts, part)
    end
    if #parts >= 3 then
        isAc = tonumber(parts[1]) or 0
        wrong = tonumber(parts[2]) or 0
        acTime = tonumber(parts[3]) or 0
    end
end

-- If already solved, return ALREADY_SOLVED indicator with current status
if isAc == 1 then
    return "ALREADY_SOLVED:" .. isAc .. ":" .. wrong .. ":" .. acTime
end

if isAcNew == 1 then
    isAc = 1
    acTime = submitTimeSec
else
    wrong = wrong + 1
end

local newStatus = isAc .. ":" .. wrong .. ":" .. acTime
redis.call('HSET', liveKey, field, newStatus)
return newStatus
