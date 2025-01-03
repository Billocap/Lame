local allowedExtensions = {
	markup = { "htm", "html", "xml", "lml" },
	style = { "css" },
	script = { "js", "lua" },
}

Config = {
	allowedExtensions = allowedExtensions,
}

function Config:new(o)
	o = o or {}

	setmetatable(o, self)
	self.__index = self

	if not o.allowedExtensions.markup then
		o.allowedExtensions.markup = allowedExtensions.markup
	end

	if not o.allowedExtensions.style then
		o.allowedExtensions.style = allowedExtensions.style
	end

	if not o.allowedExtensions.script then
		o.allowedExtensions.script = allowedExtensions.script
	end

	return o
end

return Config
