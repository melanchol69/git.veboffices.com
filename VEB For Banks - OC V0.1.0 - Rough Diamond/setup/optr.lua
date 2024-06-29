local io = require("io")
local fs = require("filesystem")

print("Opening Files...")

local banknamef = io.open("/banking/files/bankname.txt", "r")
local bsb1f = io.open("/banking/files/personal_bsb.txt", "r")
local bsb2f = io.open("/banking/files/business_bsb.txt", "r")
local bsb3f = io.open("/banking/files/other_bsb.txt", "r")
local mokbf = io.open("/banking/mok/mokbool.txt", "r")
local mokf = io.open("/banking/mok/mok.txt", "r")

local banknamec = banknamef:read("*a")
local bsb1c = bsb1f:read("*a")
local bsb2c = bsb2f:read("*a")
local bsb3c = bsb3f:read("*a")
local mokbc = mokbf:read("*a")
local mokc = mokf:read("*a")

print("Options:")
print("Security:")
print(mokbc)

if mokbc == "true" then
  print("Passcode: " .. mokc)
end

print("\nBank Details:")
print(banknamec)

print("\nBSB's:")
print(bsb1c)
print(bsb2c)
print(bsb3c)

print("\nIf these Options are not Accurate,")
print("Re-Install the Program")
return