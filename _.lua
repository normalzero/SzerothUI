-- function: all base functions
-- author: saltyzero@foxmail.com

function _dump(t, _Key)
    for k, v in pairs(t) do
	    -- if type(v) == "table" then
		    -- -- print("table")
		    -- -- dumpt(v)
		-- else
		    -- print(k, v)
		-- end
		
		print(k, v)
	end
end

function memset(_Dst, _Src, _Key, _F, _E)
    _F = _F or false
    _E = _E or false

    -- explict key table
    if type(_Key) == "table" and next(_Src) ~= nil then
        for k, v in ipairs(_Key) do
		    -- print(k, v, _Dst[v], _Src[k], _Src[v])
			
            if _Src[k] ~= nil and type(_Src[k]) == type(_Dst[v]) then
			
			    -- assign dst with src
			    if type(_Src[k]) == "table" then
				    _Dst[v] = _Dst[v] == (getmetatable(_Dst))[v] and {} or _Dst[v]
					memset(_Dst[v], _Src[k], _Dst[v][_key], _F, _E)
				else
					_Dst[v] = _Src[k]
					-- print(_Dst[v])
				end
		    elseif (_Src[v] ~= nil and _F) then
			
			    -- fill dst with src
				if type(_Src[v]) == "table" then
			        _Dst[v] = _Dst[v] == (getmetatable(_Dst))[v] and {} or _Dst[v]
					-- print(v, _Dst[v])
					memset(_Dst[v], _Src[v], _Src[v][_key], _F, _E)
				else
					_Dst[v] = _Src[v]
					-- print(_Dst[v])
				end
			else
			    if _E then print("assigned error", v, _Dst[v], _Src[k]) end
		    end
	    end
		
	    return
	end
	
	-- array table
	if _Src[1] then
		if (_Dst[1] and _Dst[#_Src])  then
		    -- assign dst with src
			for k, v in ipairs(_Dst) do
			
				-- print(_Src[k], _Dst[k])
				if _Src[k] ~= nil and type(_Src[k]) == type(_Dst[k]) then
					if type(_Src[k]) == "table" then
						memset(_Dst[k], _Src[k], _Dst[k][_key], _F, _E)
					else
						_Dst[k] = _Src[k]
						-- print(k, _Dst[k])
					end
				else
					if _E then print("assigned error", k, _Dst[k], _Src[k]) end
				end
			end
		elseif _F then
		
		    -- fill dst with src
		    for k, v in ipairs(_Src) do
			    if type(_Src[k]) == "table" then
				    memset(_Dst[k], _Src[k], _Src[k][_key], _F, _E)
				else
				    _Dst[k] = _Src[k]
				end
			end
		end
		
		return
	end
end