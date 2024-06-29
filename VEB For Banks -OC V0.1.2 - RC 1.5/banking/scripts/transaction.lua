local io = require("io")
local component = require("component")
local fs = require("filesystem")

print("\n")
print("Transaction Wizard")
print("Please Enter Account Number:")

local accnumber = tostring(io.read())
local accpath = "/banking/files/accounts/" .. accnumber .. "/" .. accnumber .. ".txt"
local trpath = "/banking/files/accounts/" .. accnumber .. "/tr.txt"
if fs.exists(trpath) == false then
  print("Transaction File Doesn't exist, creating now...")
  local ntrf = io.open(trpath, "w")
  ntrf:write("Account Number - Transaction Details - CR/DB - Balance")
  ntrf:close()
end

local accf = io.open(accpath, "r")
local trf = io.open(trpath, "a")
local lines = {}
for line in accf:lines() do
  table.insert(lines, line)
end
accf:close()

print("Please enter function:")
print("--------------------------")
print("/view - View Transactions")
print("/new - New Transaction")
print("")

local opttrt = io.read()
if opttrt == "/view" then
  print("Account: " .. accnumber .. " Transactions:")
  trf:close()
  local opttrf = io.open(trpath, "r")
  local opttrcc = opttrf:read("*a")
  print(opttrcc)
  print("\nType /return to return, type /exit to exit")
  local opttrvexit = io.read()
  if opttrvexit == "/return" then
    print("Returning...")
    dofile("/banking/scripts/functions.lua")
    return
  elseif opttrvexit == "/exit" then
    print("Returning to Shell...")
    return
  end
elseif opttrt == "/new" then


print("Please Enter Transaction Details:")
local trdetails = io.read()
print("Details:" .. trdetails)

print("\n")

print("Credit or Debit Transaction? c/d")
local opttrtype = io.read()
local trtype = ""
if opttrtype == "d" then
  print("Please enter Debit amount:")
  trtype = "Debit"
  local db = tonumber(io.read())
  local oldbal = tonumber(lines[4])
  print("Old Balance: " .. oldbal)
  print("Debit: " .. db)

  local newbal = oldbal - db
  print("New Balance: " .. newbal)
  print("Is this correct? y/n")
  local optsavedb = io.read()
   if optsavedb == "y" then
    print("Changing Balance")
    local editline = 4
    lines[4] = tostring(newbal)
    
    balfile = io.open(accpath, "w")
    trf:write("\n")
    trf:write(accnumber .. " - " .. trdetails .. " - " .. trtype .. " - " .. newbal)
    for _, line in ipairs(lines) do
      balfile:write(line, "\n")
    end

    trf:close()
    balfile:close()
    chkfile = io.open(accpath, "r")
    chkcont = chkfile:read("*all")
    chktrf = io.open(trpath, "r")
    chktrc = chktrf:read("*a")
    print("Account: " .. accnumber)
    print(chkcont)
    print("\n")
    print("Type /return to return to functions")
    print("Type /exit to return to shell")
    local optdbexit = io.read()
    if optdbexit == "/return" then
      print("Returning...")
      chkfile:close()
      trf:close()
      dofile("/banking/scripts/functions.lua")
      return
    elseif optdbexit == "/exit" then
      print("Returning to Shell...")
      chkfile:close()
      trf:close()
      return
    end
  elseif optsavedb == "n" then
    print("Returning...")
    dofile("/banking/scripts/functions.lua")
    return
  end
  elseif opttrtype == "c" then
   print("Please enter Credit amount:")
  trtype = "Credit"
  local cr = tonumber(io.read())
  local oldbal = tonumber(lines[4])
  print("Old Balance: " .. oldbal)
  print("Credit: " .. cr)

  local newbal = oldbal + cr
  print("New Balance: " .. newbal)
  print("Is this correct? y/n")
  local optcrchange = io.read()
  if optcrchange == "y" then
    print("Changing Balance")
    local editline = 4
    lines[4] = tostring(newbal)
    
    balfile = io.open(accpath, "w")
    trf:write("\n")
    trf:write(accnumber .. " - " .. trdetails .. " - " .. trtype .. " - " .. newbal)    
    for _, line in ipairs(lines) do
      balfile:write(line, "\n")
    end
    
    trf:close()
    balfile:close()
    chkfile = io.open(accpath, "r")
    chkcont = chkfile:read("*all")
    chktrf = io.open(trpath, "r")
    chktrc = chktrf:read("*a")
    print("Account: " .. accnumber)
    print(chkcont)
    print(chktrc)
    print("\n")
    print("Type /return to return to functions")
    print("Type /exit to return to shell")
    local optcrexit = io.read()
    if optcrexit == "/return" then
      print("Returning...")
      chkfile:close()
      trf:close()
      dofile("/banking/scripts/functions.lua")
      return
    elseif optcrexit == "/exit" then
      print("Returning to Shell...")
      chkfile:close()
      trf:close()
      return
    end
  elseif optcrchange == "n" then
    print("Returning...")
    dofile("/banking/scripts/functions.lua")
    return
  end
  end
end