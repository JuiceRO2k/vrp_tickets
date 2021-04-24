Citizen.CreateThread(function()
    Citizen.Wait(1000)
    RegisterFontFile('wmk')
    fontId = RegisterFontId('Freedom Font')
end)

local activeTickets = 0

RegisterNetEvent("tikceeee")
AddEventHandler("tikceeee", function()
        activeTickets = activeTickets + 1
end)

RegisterNetEvent("stikceeee")
AddEventHandler("stikceeee", function()
    activeTickets = activeTickets - 1
if activeTickets < 0 then activeTickets = 0 end
end)

RegisterNetEvent("initTickets")
AddEventHandler("initTickets",function(numarDeTickete)
    print(activeTickets,numarDeTickete)
    activeTickets = activeTickets + numarDeTickete
    Citizen.CreateThread(function()
    local scale = 0.7
    while true do
        Wait(1)
			drwTicket(" ~w~Tickets: ~r~0".. activeTickets,0,1,0.9,0.955,0.45*scale,255,255,255,255) 
        end
    end)
end)

function drwTicket(text,font,centre,x,y,scale,r,g,b,a)
    SetTextFont(fontId)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextCentre(centre)
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x, y)
end
