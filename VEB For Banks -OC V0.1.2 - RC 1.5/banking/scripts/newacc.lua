local fs = require("filesystem")
local shell = require("shell")
local io = require("io")
local component = require("component")

local accindexf = io.open("/banking/files/accindex.txt", "a")
local accindexc = accindexf:read("*all")
print(accindexc)
print("\n")
print("New Account Wizard")
print("Please Enter Account number in 6 digit format")
local accnumber = tostring(io.read())
print("Checking...")

if fs.exists("/banking/files/accounts/" .. accnumber) == true then
  print("Account Already Exists,")
  print("Would you like to delete the account? y/n")
  local fsdop = io.read()
  if fsdop == "n" then
    print("File not Deleted")
    dofile("/banking/scripts/newacc.lua")
    return
  elseif fsdop == "y" then
    print("Deleting Account...")
    fs.remove("/banking/files/accounts/" .. accnumber)
    if fs.exists("/banking/files/accounts/" .. accnumber) == true then
      print("Error, unable to delete account: " .. accnumber)
      dofile("/banking/scripts/newacc.lua")
      return
    end
  end
else
  print("Creating Account File...")
  fs.makeDirectory("/banking/files/accounts/" .. accnumber)
  local accf = io.open("/banking/files/accounts/" .. accnumber .. "/" .. accnumber .. ".txt", "w")
  local accc = accf:read("*a")
  if fs.exists("/banking/files/accounts/" .. accnumber) == true then
    print("Directory Created Successfully")
  else
    print("Failed to Create Directory")
    print("Returning...")
    dofile("/banking/scripts/functions.lua")
    return
  end
  if fs.exists("/banking/files/accounts/" .. accnumber) == true then
    if not fs.exists("/banking/files/accounts/" .. accnumber .. "/" .. accnumber .. ".txt") == true then
      print("Error, unable to create account file")
      print("Returning...")
      dofile("/banking/scripts/functions.lua")
      return
    end
    print("Created Successfully")
  else
    print("Creation Failed")
    print("Returning...")
    dofile("/banking/scripts/newacc.lua")
    return
  end
  
  local personalbsbf = io.open("/banking/files/personal_bsb.txt", "r")
  local businessbsbf = io.open("/banking/files/business_bsb.txt", "r")
  local otherbsbf = io.open("/banking/files/other_bsb.txt", "r")
  local personalbsbc = personalbsbf:read("*all")
  local businessbsbc = businessbsbf:read("*all")
  local otherbsbc = otherbsbf:read("*all")
  local selectedbsb = ""
  print("\nPlease select account type:")
  print("personal - BSB: " .. personalbsbc)
  print("business - BSB: " .. businessbsbc)
  print("other - BSB: " .. otherbsbc)
  
  local optselbsb = io.read()
  if optselbsb == "personal" then
    print("Personal Account Selected")
    selectedbsb = personalbsbc
  elseif optselbsb == "business" then
    print("Business Account Selected")
    selectedbsb = businessbsbc
  elseif optselbsb == "other" then
    print("Other Account Selected")
    selectedbsb = otherbsbc
  else
    print("Unrecognised Option")
    dofile("/banking/scripts/newacc.lua")
    return
  end
  
  print("Please Enter First and Last Name of Account Owner:")
  local accowner = io.read()
  
  print("\nAre these details correct?")
  print("Account: " .. accnumber)
  print("BSB: " .. selectedbsb)
  print("Account Owner: " .. accowner)
  print("y/n")
  
  local optaccconfirm = io.read()
  if optaccconfirm == "y" then
    print("Writing Account Details...")
    accf:write(accnumber .. "\n")
    accf:write(selectedbsb .. "\n")
    accf:write(accowner .. "\n")
    accf:write("0")
    accindexf:write("\n")
    accindexf:write(accnumber .. " - " .. selectedbsb .. " - " .. accowner)
    print(accc)
    print("Was written to: " .. accnumber .. ".txt")
    accf:close()
    print("Index:")
    print(accindexc)
    accindexf:close()
    print("Returning...")
    dofile("/banking/scripts/functions.lua")
    return
  elseif optaccconfirm == "n" then
    print("Would you like to redo the wizard? y/n")
    local optredowiz = io.read()
    if optredowiz == "n" then
      print("Returning...")
      accf:close()
      accindexf:close()
      fs.remove("/banking/files/accounts/" .. accnumber)
      dofile("/banking/scripts/functions.lua")
      return
    elseif optredowiz == "y" then
      accf:close()
      accindexf:close()
      fs.remove("/banking/files/accounts/" .. accnumber)
      dofile("/banking/scripts/newacc.lua")
      return
    end
  end
end