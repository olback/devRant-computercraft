os.loadAPI("json")
 
local rantAmount = 2
local showUsername = true
local showScore = true
local showWeeklyMsg = false
 
local version = "1.1r"
local link = "https://www.devrant.io/api/devrant/rants?app=3&sort=recent&skip=0"
local headers = {["User-Agent"] = "ComputerCraft devRant Client " .. version}
 
-- Note: Arrays start at 1 in this shitty language. Fuck me. Took way to loong for me to realize that.
 
function cls()
  term.clear()
  term.setCursorPos(1,1)
  term.setTextColor(colors.white)
end
 
cls()
 
if term.isColor() then
  term.setTextColor(colors.yellow)
end
 
print("Waiting for response from devrant.io...")
 
local str = http.get(link, headers).readAll()
local obj = json.decode(str)
 
if obj.success then
 
  cls()
 
  if showWeeklyMsg then
    print("Weekly rant: ", obj.news.body)
    print("---------------------------------------------------")
  end
 
  print("-----------------------Rants-----------------------")
 
  local i = 1
 
  while(i <= rantAmount) do
 
    if showUsername then
      print("Posted by: ", obj.rants[i].user_username)
    end
 
    print(obj.rants[i].text)
   
    if obj.rants[i].attached_image.url ~= nil then
      print("[IMG]")
    end
   
    if showScore then
      print("++: ", obj.rants[i].score)
    end
   
               
    if i ~= rantAmount then
      print("")
    end
   
    i = i + 1  
   
  end
     
else
 
  cls()
  if term.isColor() then
    term.setTextColor(colors.red)
  end
  print("Failed.")
  print("Something went wrong.")
  term.setTextColor(colors.white)
 
end
