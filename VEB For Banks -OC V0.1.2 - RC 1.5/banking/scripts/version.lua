local io = require("io")
local fs = require("filesystem")

local changelog = io.open("/banking/files/changelog.txt", "r")
local version = io.open("/banking/files/version.txt", "r")
local chc = changelog:read("*a")
local vc = version:read("*a")

print(chc)
print("Current Version: " .. vc)

print("/return to return, /exit to exit")

local optret = io.read()
if optret == "/return" then
  print("Returning...")
  changelog:close()
  version:close()
  dofile("/banking/scripts/welcome.lua")
  return
elseif optret == "exit" then
  print("Returning to Shell...")
  changelog:close()
  version:close()
  return
end