-- Banking - Welcome Script

local shell = require("shell")
local fs = require("filesystem")
local io = require("io")
local component = require("component")

local versionfile = io.open("/banking/files/version.txt", "r")
local banknamefile = io.open("/banking/files/bankname.txt", "r")
local vfdetails = versionfile:read("*all")
local banknamedetails = banknamefile:read("*all")

print("-------------------------------------------------------------")
print("Welcome to: " .. banknamedetails .. "!")
print(vfdetails .. "!")
print("Type /ch to view Changelog, type /c to continue")

if io.read() == "/c" then
  print("Continuing")  
elseif io.read() == "/ch" then
  print("Opening Changelog...")
  versionfile:close()
  banknamefile:close()
  dofile("/banking/scripts/version.lua")
  return
end

print("\n")

print("Checking security ...")
local mokfile = io.open("/banking/mok/mok.txt", "r")
local mokcontent = mokfile:read("*all")
local mokboolfile = io.open("/banking/mok/mokbool.txt", "r")
local mokboolcontent = mokboolfile:read("*all")
if mokboolcontent == "true" then
  print("Please Enter Secuity Key:")
  local mokentry = io.read()
  if mokentry == mokcontent then
    print("Access Granted")
    dofile("/banking/scripts/functions.lua")
    return
  else
    print("Acees Denied")
    return
  end
elseif mokboolcontent == "false" then
  print("No Security found")
  print("Continuing...")
  dofile("/banking/scripts/functions.lua")
  return
end