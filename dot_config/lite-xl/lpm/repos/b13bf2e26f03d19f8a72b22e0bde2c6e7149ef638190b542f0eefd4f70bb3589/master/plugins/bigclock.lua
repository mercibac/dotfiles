-- mod-version:3
local core = require "core"
local style = require "core.style"
local command = require "core.command"
local common = require "core.common"
local config = require "core.config"
local View = require "core.view"


config.plugins.bigclock = common.merge({
  time_format = "%H:%M:%S",
  date_format = "%A, %d %B %Y",
  scale = 1,
  -- The config specification used by the settings gui
  config_spec = {
    name = "Big Clock",
    {
      label = "Time Format",
      description = "Time specification defined with Lua date/time place holders.",
      path = "time_format",
      type = "string",
      default = "%H:%M:%S"
    },
    {
      label = "Date Format",
      description = "Date specification defined with Lua date/time place holders.",
      path = "date_format",
      type = "string",
      default = "%A, %d %B %Y",
    },
    {
      label = "Scale",
      description = "Size of the clock relative to screen.",
      path = "scale",
      type = "number",
      default = 1,
      min = 0.5,
      max = 3.0,
      step = 0.1
    }
  }
}, config.plugins.bigclock)


local ClockView = View:extend()


function ClockView:new()
  ClockView.super.new(self)
  self.time_text = ""
  self.date_text = ""
  self.last_scale = 0
end


function ClockView:get_name()
  return "Big Clock"
end


function ClockView:update_fonts()
  if self.last_scale ~= config.plugins.bigclock.scale then
    self.last_scale = config.plugins.bigclock.scale
  else
    return
  end
  local size = math.floor(self.size.x * 0.15 / 15) * 15 * config.plugins.bigclock.scale
  if self.font_size ~= size then
    self.time_font = renderer.font.copy(style["font"], size)
    self.date_font = renderer.font.copy(style["font"], size * 0.3)
    self.font_size = size
    collectgarbage()
  end
end


function ClockView:update()
  local time_text = os.date(config.plugins.bigclock.time_format)
  local date_text = os.date(config.plugins.bigclock.date_format)
  if self.time_text ~= time_text or self.date_text ~= date_text then
    core.redraw = true
    self.time_text = time_text
    self.date_text = date_text
  end
  ClockView.super.update(self)
end


function ClockView:draw()
  self:update_fonts()
  self:draw_background(style.background)
  local x, y = self.position.x, self.position.y
  local w, h = self.size.x, self.size.y
  local _, y = common.draw_text(self.time_font, style.text, self.time_text, "center", x, y, w, h)
  local th = self.date_font:get_height()
  common.draw_text(self.date_font, style.dim, self.date_text, "center", x, y, w, th)
end


command.add(nil, {
  ["big-clock:open"] = function()
    local node = core.root_view:get_active_node()
    node:add_view(ClockView())
  end,
})


return ClockView
