local t = {}
local function fmt(s)
	local l = {}
	for line in s:gmatch("[^\r\n]+") do table.insert(l, line) end
	local w = 0
	for _, v in ipairs(l) do if #v > w then w = #v end end
	for i, v in ipairs(l) do l[i] = v .. string.rep(" ", w - #v) end
	return table.concat(l, "\n")
end
local links = typeof(_G.link) == "table" and _G.link or {_G.link}
for _, u in ipairs(links) do
	local s, r = pcall(function() return game:HttpGet(u, true) end)
	if s then
		local p = r:match("<pre>(.-)</pre>")
		if p then
			p = p:gsub("&quot;", "\"")
			table.insert(t, fmt(p))
		else
			table.insert(t, fmt(r))
		end
	else
		table.insert(t, "ERROR: " .. tostring(r))
	end
end
setclipboard(table.concat(t, "\n\n|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||\n\n"))
