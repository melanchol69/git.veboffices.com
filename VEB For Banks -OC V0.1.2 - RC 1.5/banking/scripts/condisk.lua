local fs = require("filesystem")
local io = require("io")
local component = require("component")
local shell = require("shell")

print("Administrative Console - ConDisk")

print("\n")
print("Example: Install Disk mnt directory:")
print("--------------------------")
print("/mnt/ab1")
print("Please type the 3 characters of your install disk:")

local diskdir = io.read()
if fs.exists("/mnt/" .. diskdir .. "/setup.lua") == true then
  print("Genuine VEB For Banks Disk")
  print("transferring to admin console...")
  shell.setWorkingDirectory("/mnt/" .. diskdir .. "/condisk.lua")
  dofile("/mnt/" .. diskdir .. "/condisk.lua")
  return
elseif not fs.exists("/mnt/" .. diskdir .. "/setup.lua") == true then
  print("Disk Invalid")
  dofile("/banking/scripts/functions.lua")
  return
end

print("\nType /return to return, Type /exit to exit:")

local optexit = io.read()
if optexit == "/return" then
  print("Returning to Functions...")
  dofile("/banking/scripts/functions.lua")
  return
elseif optexit == "/exit" then
  print("Returning to Shell...\n")
  return
end