local io = require("io")

local vf = io.open("banking/files/version.txt", "r")
local vc = vf:read("*a")

print(vc .. " Quick Guide")
print("\n")
print("Please Select Subject:")
print("--------------------------")
print("/inst - Installer Info")
print("/opt - All Options")
print("/sec - Security Info")
print("/cred - Credits")
print("/return - Return")
print("/exit - Return to Shell")
print("\nPlease Type the / exactly as shown:")
vf:close()
local sub1 = io.read()

if sub1 == "/inst" then
  print("Installer Information:")
  local instf = io.open("setup/inst/inst.txt", "r")
  local instc = instf:read("*a")
  print(instc)
  print("/return to return")
  if io.read() == "/return" then
    dofile("setup/info.lua")
    return
  end
elseif sub1 == "/opt" then
  print("All Options:")
  local optf = io.open("setup/opt/opt.txt", "r")
  local optc = optf:read("*a")
  print(optc)
  print("/return to return")
  if io.read() == "/return" then
    dofile("setup/info.lua")
    return
  end
elseif sub1 == "/sec" then
  print("Security Information:")
  local secf = io.open("setup/sec/sec.txt", "r")
  local secc = secf:read("*a")
  print(secc)
  print("/return to return")
  if io.read() == "/return" then
    dofile("setup/info.lua")
    return
  end
elseif sub1 == "/cred" then
  print("Credits:")
  local credf = io.open("setup/cred/cred.txt", "r")
  local credc = credf:read("*a")
  print(credc)
  print("/return to return")
  if io.read() == "/return" then
    dofile("setup/info.lua")
    return
  end
elseif sub1 == "/return" then
  print("Returning...")
  dofile("setup.lua")
  return
elseif sub1 == "/exit" then
  print("Returning to Shell...")
  return
else
  print("Function error, returning...")
  dofile("setup/info.lua")
  return
end