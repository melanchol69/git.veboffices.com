local component = require("component")
local io = require("io")
local fs = require("filesystem")
local event = require("event")
local shell = require("shell")
local comp = require("computer")

print("VEB For Banks - Admin Console")
print("\nPlease enter your CD Key:")

local cdi = io.read()
local cdf = io.open("setup/cd.txt", "r")
local cdc = cdf:read("*a")

if cdi == cdc then
  print("CD Key Genuine")
  print("Continuing...\n")
elseif not cdi == cdc then
  print("CD Key Invalid")
  print("Returning...")
  dofile("/banking/scripts/functions.lua")
  return
end

print("Checking Installation...")

local verifdisk = fs.exists("/banking")
if verifdisk == true then
  print("Install Genuine")
else
  print("Error; returning...")
  dofile("/banking/scripts/functions.lua")
  return
end

print("Checking Security...")
local mokdir = "/banking/mok/"
local mokf = io.open(mokdir .. "mok.txt", "r")
local mokbf = io.open(mokdir .. "mokbool.txt", "r")
local mokc = mokf:read("*a")
local mokbc = mokbf:read("*a")

if mokbc == "false" or "" then
  print("No Security set")
elseif mokbc == "true" then
  print("Please enter security key:")
  local moki = io.read()
  if moki == mokc then
    print("Access Granted")
  elseif not moki == mokc then
    print("Access Denied")
    return
  end
end

print("\nPlease enter function:")
print("/reset - Clear Data")
print("/return - Return to functions")
print("/exit - Return to Shell")
print("\n")

local selfunc = io.read()

if selfunc == "/reset" then
  print("Current Options:")
  print("/rm - Uninstall VEB For Banks")
  print("/cld - Reset all Options")
  print("/c - Cancel Operation")
  print("Please type your option below:")

  local optresop = io.read()
  if optresop == "/rm" then
  print("\nRemove Selected!")

  local bankversfile = io.open("/banking/files/version.txt", "r")
  local bankvers = bankversfile:read("*a")
  print("Current Version:")
  print(bankvers)

  print("Are you sure you want to remove")
  print("VEB For Banks? y/n")

  local optresc = io.read()

  if optresc == "y" then
    print("Removing: " .. bankvers)
    cdf:close()
    bankversfile:close()

    fs.remove("/banking")
    if not fs.exists("/banking") == true then
      print("Files Deleted Successfully!")
      print("Rebooting...")
      comp.shutdown(true)
      else
      print("Files not deleted! Returning...")
      return
    end

  elseif optresc == "n" then
    print("Operation Cancelled...")
    print("Returning to Shell...\n")
    return
  end
end

elseif selfunc == "/return" then
  print("Returning...\n")
  dofile("/banking/scripts/functions.lua")
  return
elseif selfunc == "/exit" then
  print("Returning to Shell...\n")
  return
end