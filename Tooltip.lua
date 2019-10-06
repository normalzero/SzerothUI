-- function: display info
-- author: saltyzero@foxmail.com

local function OnItemTip(self)

	local _, itemLink = self:GetItem()
	
	if itemLink then
	    local _,_,_,_, itemId, enchantId, jewelId1, jewelId2, jewelId3, jewelId4, suffixId, uniqueId,linkLevel,_ = string.find(itemLink,"|?c?f?f?(%x*)|?H?([^:]*):?(%d+):?(%d*):?(%d*):?(%d*):?(%d*):?(%d*):?(%-?%d*):?(%-?%d*):?(%d*):?(%d*):?(%-?%d*)|?h?%[?([^%[%]]*)%]?|?h?|?r?")
		
		self:SetHyperlink("item:"..uniqueId..":"..enchantId..":"..jewelId1..":"..jewelId2..":"..jewelId3..":"..jewelId4..":"..suffixId..":".."0"..":"..linkLevel)
		
		
	end
end
GameTooltip:HookScript("OnShow", OnItemTip)
ItemRefTooltip:HookScript("OnShow", OnItemTip)
ItemRefShoppingTooltip1:HookScript("OnShow", OnItemTip)
ItemRefShoppingTooltip2:HookScript("OnShow", OnItemTip)
ItemRefShoppingTooltip3:HookScript("OnShow", OnItemTip)
ShoppingTooltip1:HookScript("OnShow", OnItemTip)
ShoppingTooltip2:HookScript("OnShow", OnItemTip)
ShoppingTooltip3:HookScript("OnShow", OnItemTip)