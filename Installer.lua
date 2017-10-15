-- Program to update devRant
-- Essentially a "git pull git@github.com:olback/devRant-computercraft"
 
local downloadMain = "https://raw.githubusercontent.com/olback/devRant-computercraft/master/devRant.lua"
local downloadJSON = "https://raw.githubusercontent.com/olback/devRant-computercraft/master/json.lua"
local downloadInstaller = "https://raw.githubusercontent.com/olback/devRant-computercraft/master/Installer.lua"
local version = "1.0d"
local headers = {["User-Agent"] = "ComputerCraft devRant Updater" .. version}
 
local main = http.get(downloadMain, headers)
local json = http.get(downloadJSON, headers)
local installer = http.get(downloadInstaller, headers)
 
----- Failed function -----
 
function failed(file)
  if term.isColor() then
    term.setTextColor(colors.red)
  end
  print("Failed to update ".. file)
  term.setTextColor(colors.white)
end
 
 
----- Udate devRant -----
 
if main ~= nil then
       
  -- Don't bother removing old file since f.write() will write over it anyways.
  print("Updating devRant...")
  f = fs.open("devRant", "w")
  f.write(main.readAll())
  f.close()
 
else
 
  failed("devRant")
 
end
 
 
----- Update json API -----
 
if json ~= nil then
 
  print("Updating JSON API...")
  f = fs.open("json", "w")
  f.write(json.readAll())
  f.close()
 
else
 
  failed("json")
 
end
 
 
----- Update installer -----
 
if installer ~= nil then
 
  print("Updating installer...")
  f = fs.open("devRantInstaller", "w")
  f.write(installer.readAll())
  f.close()
 
else
 
  failed("installer")
 
end
