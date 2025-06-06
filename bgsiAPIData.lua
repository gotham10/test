local d = game:HttpGet(_G.link)
local j = d:match("<pre>(.-)</pre>")
j = j:gsub("&quot;", "\"")
setclipboard(j)
