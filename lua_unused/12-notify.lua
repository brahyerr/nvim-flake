require("telescope").load_extension("notify")
local notify = require("notify")

local buffered_messages = {
	"Client %d+ quit",
	"You press key %d+ too",
	"Key %d+ is disabled",
}
local message_notifications = {}

notify.setup({
	background_colour = "#0b0c16",
})

vim.notify = function(msg, level, opts)
	opts = opts or {}
	for _, pattern in ipairs(buffered_messages) do
		if string.find(msg, pattern) then
			if message_notifications[pattern] then
				-- opts.replace = message_notifications[pattern]
				opts.replace = nil
			end

			opts.on_close = function()
				message_notifications[pattern] = nil
			end
			message_notifications[pattern] = notify.notify(msg, level, opts)
			return
		end
	end

	notify.notify(msg, level, opts)
end
