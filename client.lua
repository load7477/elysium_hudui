vRP = Proxy.getInterface("vRP")
hudUIC = {}
Tunnel.bindInterface(GetCurrentResourceName(), hudUIC)
Proxy.addInterface(GetCurrentResourceName(), hudUIC)
hudUIS = Tunnel.getInterface(GetCurrentResourceName(), GetCurrentResourceName())



RegisterNetEvent('open')
AddEventHandler('open', function(money, bankMoney, user_id, job, name)
    local player = source
    print(name)
    SendNUIMessage({action = "into", money = money, bank = bankMoney, user_id = user_id, job = job, name = name}) --NUI로 데이터를 보냄
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5000)
        hudUIS.requestclient() 
    end
end)


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if IsControlJustReleased(0,  20) then
            SendNUIMessage({
                action = "z"
            })
        end        
    end
end)

function notify(title, sub)
    SendNUIMessage({
        action = "n",
        title = title,
        sub = sub
    })
end