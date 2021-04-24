local numarDeTickete = 0
local Tickets = {}
local activeTickets = {}
local cooldown = {}
adminRequests = {}

local usewebhook = false
local usesound = true


local function ch_calladmin(player)
    local user_id = vRP.getUserId(player)
    local user_source = vRP.getUserId(user_id)
    if user_id ~= nil then
        if cooldown[user_id] == nil then
        TriggerClientEvent("tikceeee",-1)
        vRPclient.notify(player,{"~g~Succes: ~w~Ticket was sent"})
        cooldown[user_id] = true
        for i = 1,200 do 
        if(Tickets[i] == nil) then
            table.insert(activeTickets,user_id)
            numarDeTickete = numarDeTickete + 1
                    
            if usesound then
              if vRP.hasPermission(user_id,"admin.tickets") then
                TriggerClientEvent('InteractSound_CL:PlayOnOne', -1, 'ticket', 0.2)
              end
            end
                    
            SetTimeout(60000,function()
              cooldown[user_id] = nil
            end)
            break
                end
            end
        else
            vRPclient.notify(player,{"~r~Failed: ~w~Wait 1 minute to make another ticket"})
            return
        end
    end
end

--vRPclient.notify(source,{"Ai trimis un ticket. Asteapta un raspuns."})

vRP.registerMenuBuilder("admin", function(add, data)
  local user_id = vRP.getUserId(data.player)
  if user_id ~= nil then
    local choices = {}
      choices["Call Admin"] = {ch_calladmin}
    add(choices)
  end
end)

RegisterCommand("tk", function(source)
  local user_id = vRP.getUserId(source)
  local _src = vRP.getUserSource(user_id)
  if vRP.hasPermission(user_id,"admin.tickets") then
    if (#activeTickets > 0) then
      math.randomseed(os.time())
      local randomTicket = math.random(1,#activeTickets)
      local targetId = parseInt(activeTickets[randomTicket])
      local targetSource = vRP.getUserSource(targetId)
      vRPclient.getPosition(targetSource, {}, function(x,y,z)
        vRPclient.teleport(_src,{x,y,z})
        exports.ghmattimysql:execute("UPDATE `vrp_users` SET `reports` = `reports` + 1 WHERE `id` = @sender_id", {['@sender_id'] = _src})

        if usewebhook then
          local tkt = "https://discord.com/api/webhooks/799046581369569310/k74cqvXg8EfADw9_qX_Rk0QvCvHN7Z91Q9sxX2ljzcMO71CRc1az0jV_LivmCMXtPxJC"
          local communityname = "Admin Ticket Systems"
          local communtiylogo = "https://cdn.discordapp.com/attachments/788065188922130463/795578826997628968/logodiscord.png"
          local connect = {
            {
              ["color"] = "8663711",
              ["title"] = "Tickete",
              ["description"] = "Ticket: sent by [ ID ] -> "..vRP.getUserId(targetSource).." | Accepted by [ ID ] -> "..vRP.getUserId(_src),
              ["footer"] = {
                ["text"] = communityname,
                ["icon_url"] = communtiylogo,
              },
            }
          }
          PerformHttpRequest(tkt, function(err, text, headers) end, 'POST', json.encode({username = "Ticket Logs", embeds = connect}), { ['Content-Type'] = 'application/json' })
        end

        vRPclient.notify(targetSource,{"~w~[~b~SERVER~w~] ~w~Staff: ~g~"..GetPlayerName(_src).." \n~w~[~b~SERVER~w~] ~b~Took your ticket"})
      end)
      
      TriggerClientEvent("stikceeee",-1)
      table.remove(activeTickets,randomTicket)
      numarDeTickete = numarDeTickete - 1
    else
      vRPclient.notify(_src,{"~w~[~b~SERVER~w~] ~g~No active tickets!"})
    end
  else
    vRPclient.notify(_src,{"~w~[~b~SERVER~w~] ~r~Acces denied."})
  end
end)

RegisterCommand('resetreports', function(source, args, msg)
  local user_id = vRP.getUserId(source)
  if vRP.hasPermission(user_id,"admin.resetrepo") then
    vRPclient.notify(source, {"~g~Succes: ~w~All ticket counts were deleted ~r~PERMANENTLY"})
    exports.ghmattimysql:execute("UPDATE vrp_users SET reports = 0", function()end)
  end
end)

RegisterCommand('reports', function(source, args, msg)
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,"admin.repolist") then
      local rows = exports.ghmattimysql:executeSync("SELECT reports, id FROM vrp_users WHERE reports != 0")
      local content = "<em><b>Staff Reports</b></em>"
      for i, v in pairs(rows) do
          content = content .. "<br/><em>ID: " .. v.id .. " -> " .. v.reports .. " reports</em>"
      end
      vRPclient.setDiv(source,{"war_reports",".div_war_reports{ background-color: rgba(0,0,0,0.75); color: skyblue; font-weight: bold; width: 500px; padding: 10px; margin: auto; margin-top: 150px; }",content})
      Wait(10000)
      vRPclient.removeDiv(source,{"war_reports"})
    end
end)

 AddEventHandler("vRP:playerSpawn", function(user_id, source, first_spawn)
    if first_spawn then 
      if vRP.hasPermission(user_id,"admin.tickets") then
        TriggerClientEvent("initTickets",source,numarDeTickete)
    end
end
end)

AddEventHandler('vRP:playerLeave', function(user_id, source)
  if(cooldown[user_id] == true)then
    cooldown[user_id] = nil
    TriggerClientEvent("stikceeee",-1)
    table.remove(activeTickets,randomTicket)
  end
end)
