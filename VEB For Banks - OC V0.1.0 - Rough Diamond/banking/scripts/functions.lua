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

if io.read() == "/view" then
  print("Opening Account Index...")  
  local indexfile = io.open("/banking/files/accindex.txt", "r")
  local indexcontent = indexfile:read("*all")
  print(indexcontent)
  print("\n")
  print("type /return to return to functions list")
  print("type /exit to exit application.")
  if io.read() == "/return" then
    indexfile:close()
    dofile("/banking/scripts/functions.lua")
    return
  elseif io.read() == "/exit" then
    print("Returning to Shell")
    indexfile:close()
    return
  end
elseif io.read() == "/exit" then
  print("Returning to Shell")
  return
end

if io.read() == "/new" then
  print("Opening Wizard...")
  dofile("/banking/scripts/newacc.lua")
  return
elseif io.read() == "/tr" then
  print("Opening Wizard")
  dofile("/banking/scripts/transaction.lua")
  return
end