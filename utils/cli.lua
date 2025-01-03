local argparse = require "argparse"

local parser = argparse()

-- Arguments
parser
	:argument(
		"entry",
		"File to be parse. Will cause the entry file in the config to be ignored."
	)
	:args "?"

-- Options
parser:option("-c --config", "Force this configuration file to be used.")

return parser
