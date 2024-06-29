local fs = require("filesystem")
local io = require("io")
local shell = require("shell")
local component = require("component")

print("\n")
print("Please enter function")
print("--------------------------")
print("/new - New Account")
print("/view - View Accounts")
print("/tr - Make Transaction")
print("/exit - Return to Shell")

local selfunc = io.read()
if selfunc == "/view" then
  print("Opening Account Index...")  
  local indexfile = io.open("/banking/files/accindex.txt", "r")
  local indexcontent = indexfile:read("*all")
  print(indexcontent)
  print("\n")
  print("type /return to return to functions list")
  print("type /exit to exit application.")
  local optviewret = io.read()
  if optviewret == "/return" then
    indexfile:close()
    dofile("/banking/scripts/functions.lua")
    return
  elseif optviewret == "/exit" then
    print("Returning to Shell")
    indexfile:close()
    return
  end
elseif selfunc == "/exit" then
  print("Returning to Shell")
  return
elseif selfunc == "/new" then
  print("Opening Wizard...")
  dofile("/banking/scripts/newacc.lua")
  return
elseif selfunc == "/tr" then
  print("Opening Wizard")
  dofile("/banking/scripts/transaction.lua")
  return
elseif selfunc == "#admin" then
  print("Running ConnectDisk...")
  dofile("/banking/scripts/condisk.lua")
  return
else
  print("Error: Function not recognised")
  dofile("/banking/scripts/function.lua")
  return
end