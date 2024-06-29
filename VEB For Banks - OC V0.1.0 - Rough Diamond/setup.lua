local shell = require("shell")
local fs = require("filesystem")
local io = require("io")
local component = require("component")

local vf = io.open("banking/files/version.txt", "r")
local vc = vf:read("*all")
local chf = io.open("banking/files/changelog.txt", "r")
local chc = chf:read("*all")

print(vc)
print("/ch to view changelog, /c to continue, /exit to exit")

local op1 = io.read()

if op1 == "/ch" then
  print("Printing Changelog...")
  print(chc)
  print("/return to continue setup, /exit to exit")

  local op1r = io.read()
  if op1r == "/return" then
    print("Returning...")
  elseif op1r == "/exit" then
    print("Returning to Shell...")
    return
  end
elseif op1 == "/c" then
  print("Continuing Setup...")
elseif op1 == "/exit" then
  print("Returning to Shell...")
  return
end

print("")
print("Please read the details:")
local detf = io.open("setup/details.txt")
local detc = detf:read("*a")
print(detc)
print("/more for more info, /c to continue")
local op2 = io.read()

if op2 == "/more" then
  print("Opening Full Info...")
  dofile("setup/info.lua")
  return
elseif op2 == "/c" then
  print("Continuing Setup...")
end
print("")
print("Please Enter CD Key:")
print("All Lower Case, no Spaces or -'s")
local cdf = io.open("setup/cd.txt", "r")
local cdc = cdf:read("*a")
local cde = io.read()

if cde == cdc then
  print("CD Key Valid")
else
  print("Key Incorrect, try again")
  dofile("setup.lua")
end

print("\n")
print("Options:")
print("--------------------------")
print("Security")
print("Account BSB's")
print("Bank Details")
print("/c to Continue /return to Return")

local op3 = io.read()
if op3 == "/c" then
  print("Continuing...")
elseif op3 == "/return" then
  print("Returning to Shell...")
  return
end

print("\n")
print("Security Options:")
print("Would you like a security passcode? y/n")
local sece = io.read()
local secop = ""

if sece == "y" then
  print("Setting Security")
  secop = "true"
elseif sece == "n" then
  secop = "false"
end

local passc = ""
if secop == "true" then
  print("Please Enter Passcode")
  passc = tostring(io.read())
  print("Passcode = " .. passc)
else
  print("Continuing...")
end

print("Security Review:")
print(secop)
if secop == "true" then
  print(passc)
end
print("Are these Details Correct? y/n")
local secrev = io.read()

local optsec = ""
local optsecp = ""

if secrev == "y" then
  print("Security Options Set...")

  optsec = secop
  optsecp = passc
elseif secrev == "n" then
  print("Returning...")
  dofile("setup.lua")
  return
end

print("\n")
print("Bank Details:")
print("Please Enter Bank Name:")

local bankname = io.read()

print(bankname)
print("Is this Correct? y/n")

local banknameop = io.read()
local optbankname = ""

if banknameop == "y" then
  print("Bank Name set to:")
  print(bankname)
  optbankname = bankname
elseif banknameop == "n" then
  print("Returning...")
  dofile("setup.lua")
  return
end

print("\n")
print("Account BSB's:")
print("The New Account Script has 3 Account Options,")
print("these options refer to the saved BSB's")
print("Please Enter Personal Account BSB: ex: 123-456")

local optbsb1 = ""
local optbsb2 = ""
local optbsb3 = ""

local bsb1 = io.read()

print(bsb1)

print("Please Enter Business Account BSB:")

local bsb2 = io.read()

print(bsb2)

print("Please Enter Other Account BSB:")

local bsb3 = io.read()

print(bsb3)

print("\nSelected BSB's:")
print("Personal: " .. bsb1)
print("Business: " .. bsb2)
print("Other: " .. bsb3)
print("Are these Correct? y/n")

local bsbop = io.read()

if bsbop == "y" then
  print("Saving BSB's:")
  optbsb1 = bsb1
  optbsb2 = bsb2
  optbsb3 = bsb3
elseif bsbop == "n" then
  print("Returning...")
  dofile("setup.lua")
  return
end

print("\nOptions:")
print("Security:")
print("- " .. optsec)
print("- " .. optsecp)
print("Bank Details:")
print("- " .. optbankname)
print("BSB's:")
print("- " .. optbsb1)
print("- " .. optbsb2)
print("- " .. optbsb3)
print("--------------------------")
print("\nAre these Correct? y/n")
local finalop = io.read()
if finalop == "y" then
  print("Options Saved")
elseif finalop == "n" then
  print("Returning...")
  dofile("setup.lua")
  return
end

print("\nDo you want to install VEB For Banks? y/n")
local instop = io.read()
if instop == "y" then
  if fs.exists("/banking") == true then
    print("Deleting Setup Directory from Root /")
    fs.copy("setup/banking.lua", "/bin/banking.lua")
    fs.remove("/setup.lua")
    fs.remove("/setup")
    fs.remove("/testfile.txt")

    print("Saving Options:")
    local banknamefile = io.open("/banking/files/bankname.txt", "w")
    banknamefile:write(optbankname)
    banknamefile:close()

    local bsb1file = io.open("/banking/files/personal_bsb.txt", "w")
    local bsb2file = io.open("/banking/files/business_bsb.txt", "w")
    local bsb3file = io.open("/banking/files/other_bsb.txt", "w")
    bsb1file:write(optbsb1)
    bsb2file:write(optbsb2)
    bsb3file:write(optbsb3)
    bsb1file:close()
    bsb2file:close()
    bsb3file:close()

    local mokboolfile = io.open("/banking/mok/mokbool.txt", "w")
    mokboolfile:write(optsec)
    mokboolfile:close()
    if optsec == "true" then
      local mokfile = io.open("/banking/mok/mok.txt", "w")
      mokfile:write(optsecp)
      mokfile:close()
    end
    print("Opening Options Review...")
    dofile("setup/optr.lua")
    return
  else
    print("Running Default Installer")
    print("Please ReRun Setup After Installing Files:")
    dofile("/bin/install.lua")
  end
elseif instop == "n" then
  print("Returning to Shell...")
  return
end