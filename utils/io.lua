local json = require "cjson"
local htmlparser = require "htmlparser"

local allowed_exts = {
	"htm",
	"html",
	"xml",
	"lml",
}

IOUtils = {
	read_file = function(path)
		local file = io.open(path, "r")

		if not file then
			return nil
		end

		local content = file:read "a"

		file:close()

		return content
	end,
	parse_json_file = function(path)
		local raw_content = IOUtils.read_file(path)

		if not raw_content then
			return nil
		end

		return json.decode(raw_content)
	end,
	is_ext_allowed = function(path, exts)
		exts = exts or allowed_exts

		for _, ext in ipairs(exts) do
			if path:match("%." .. ext .. "$") then
				return true
			end
		end

		return false
	end,
	parse_ml_file = function(path)
		if not IOUtils.is_ext_allowed(path) then
			return nil
		end

		local raw_content = IOUtils.read_file(path)

		if not raw_content then
			return nil
		end

		return htmlparser.parse(raw_content)
	end,
}

return IOUtils
