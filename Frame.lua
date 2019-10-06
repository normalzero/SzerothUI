-- function: controller callback
-- author: saltyzero@foxmail.com

local ttt = CreateFrame("Frame")
ttt:RegisterEvent("CHAT_MSG_ADDON")
ttt:SetScript("OnEvent", function(self, event, prefix, msg, type, sender)
	Data:test()

    local item = ItemRandomData:new({}, {123456, 0, 3, 1.15, {1.1}, {1.2}})
	
	print(item.stat[5], ItemRandomData.stat[5])
	item.stat[5] = 1.5
	print(item.stat[5], ItemRandomData.stat[5])
	
	local item2 = ItemRandomData:new()
	print(item2.stat[5])
	item2.stat[5] = 1.6
	print(item2.stat[5], ItemRandomData.stat[5])
end)