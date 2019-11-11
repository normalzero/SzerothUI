-- function: storage all data object template as a class
-- author: saltyzero@foxmail.com

Data = {}

function Data:test()
    print("data test call ok")
	-- aaa = { _A = 123, _B = { "_B" }}
	-- bbb = {}
	-- setmetatable(bbb, aaa)
	-- aaa.__index = aaa
	
	-- print("bbb", bbb["_A"], bbb["_B"][1])
	-- bbb["_A"] = 222
	-- if bbb["_B"] == (getmetatable(bbb))["_B"] then
	    -- print(bbb["_B"], aaa["_B"])
	-- end
	-- bbb["_B"] = { "oo" }
	-- print("aaa", aaa["_A"], aaa["_B"][1])
	-- print("bbb", bbb["_A"], bbb["_B"][1])
	
end

function Data:new(data, ...)
    data = data or {}
	setmetatable(data, self)
	self.__index = self
	
	-- 对象初始化
	if self._key ~= nil then
	    memcpy(data, self, self._key, true, true)
	end
	
	-- 对象赋值
	if ... then
	    local values = {}
		
		if type(...) == "table" then
		    values = ...
        else
		    values = {...}
        end
		
		memcpy(data, values, self._key)
    end

    return data
end

ItemRandomData = Data:new({
    _key = {"id", "prefix", "quality", "dmg_arm", "stat", "spell", "subfix"},
	
    id = 0,
	prefix = 0,
	quality = 0,
	dmg_arm = 0,
	stat = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
	spell = { 0, 0, 0},
	subfix = 0,
})
