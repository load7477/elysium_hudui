local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP", GetCurrentResourceName())
hudUIC = Tunnel.getInterface(GetCurrentResourceName(), GetCurrentResourceName())

hudUIS = {}
Tunnel.bindInterface(GetCurrentResourceName(), hudUIS)

function hudUIS.requestclient() 
	local player = source
	local user_id = vRP.getUserId({source})
	local job = vRP.getUserGroupByType({user_id, "job"})
	if not job or job == "" then
		job = "(직업 미선택)"
	end
    local money = vRP.getMoney({user_id})
    local bankMoney = vRP.getBankMoney({user_id})
	local name = vRP.getPlayerName({source})
    TriggerClientEvent('open', player, money, bankMoney, user_id, job, name)
end
