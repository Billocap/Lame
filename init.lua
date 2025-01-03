local parser = require "utils.cli"
local IOUtils = require "utils.io"
local Config = require "lib.config"

local args = parser:parse()

local config = Config:new(IOUtils.parse_json_file(args.config or "lame.json"))

if args.entry then
	config.entry = args.entry
end

if not config.entry then
	parser:error "No entry file"
end

if
	not IOUtils.is_ext_allowed(config.entry, config.allowedExtensions.markup)
then
	error "Entry file is not a valid markup file."
end

local html_root = IOUtils.parse_ml_file(config.entry)

if html_root then
	local q = html_root "title"

	print(q[#q]:getcontent())
end
