local s = _G.search:gsub(" ", "+")
local v = _G.variant
local link = "https://bgsi-kyc3.onrender.com/api/items?search=" .. s .. "&variant=" .. v
local d = game:HttpGet(link)
local function pad(l)
	local w = 0
	for _, v in ipairs(l) do if #v > w then w = #v end end
	for i, v in ipairs(l) do l[i] = v .. string.rep(" ", w - #v) end
	return table.concat(l, "\n")
end
local p = d:match("<pre>(.-)</pre>")
if p then
	p = p:gsub("&quot;", "\"")
	local s, j = pcall(function() return game:GetService("HttpService"):JSONDecode(p) end)
	if s and j and j.pets and #j.pets > 0 then
		for _, pet in ipairs(j.pets) do
			local l = {}
			table.insert(l, "\nName:        " .. (pet.name or "nothing found"))
			table.insert(l, "Description: " .. (pet.description or "nothing found"))
			table.insert(l, "Chance:      " .. (pet.chance and tostring(pet.chance) or "nothing found"))
			table.insert(l, "Demand:      " .. (pet.demand or "nothing found"))
			table.insert(l, "Owners:      " .. (pet.owners and tostring(pet.owners) or "nothing found"))
			table.insert(l, "Value:       " .. (pet.value and tostring(pet.value) or "nothing found"))
			table.insert(l, "Status:      " .. (pet.status or "nothing found"))
			table.insert(l, "Variant:     " .. (pet.variant or "nothing found"))
			print(pad(l))
		end
	end
end
