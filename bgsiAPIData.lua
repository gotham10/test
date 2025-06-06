local s, r = pcall(function() return game:HttpGet(_G.link) end)
if s then
	local p = r:match("<pre>(.-)</pre>")
	if p then
		p = p:gsub("&quot;", "\"")
		setclipboard(p)
	else
		setclipboard(r)
	end
else
	setclipboard(tostring(r))
end
