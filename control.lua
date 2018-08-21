--Include needed stdlib libs.
-- require "stdlib/config/config"
-- require "stdlib/entity/entity"
-- require "stdlib/event/gui"
-- require "stdlib/game"
-- require "stdlib/log/logger"
-- require 'stdlib/utils/string'

psc = {}
-- psc.log = Logger.new("PowerStatsCircuit", "debug", true)

script.on_init(function()
    -- global.config = {}
    -- global.player_data = {}
    -- global._radios = {}

    -- fm.cfg = Config.new( global.config )
    -- fm.config.applyDefaults()
    -- fm.gui.showAllMainButton()
end)

local function update_PSC(unit_number,tick,player)
    if global.PSC_entity == nil or global.PSC_entity[unit_number] == nil then
        player.print("update nil")
        return
    end
    local obj = global.PSC_entity[unit_number]
    local main_entity = obj.main_entity
    if main_entity.valid == false then 
        return 
    end
    local power = main_entity.electric_network_statistics
    local output = obj.combinator
    local control = output.get_or_create_control_behavior()
    control.enabled = true

    -- player.print(serpent.block(power.output_counts))
    --output.operable = true

    if obj.last_update_tick == nil or obj.stats == nil then
        obj.last_update_tick = tick
        obj.stats = power.output_counts
        return
    end

    local i = 0
    for name , pwr in pairs(power.output_counts) do
        i = i+1
        local last = obj.stats[name]
        local time = tick-obj.last_update_tick
        local kwatts = ((pwr-last)/(time/60)) / 1000

        local sig = {type = "item", name = name}
		control.set_signal(i, {signal = sig, count = kwatts})
    end
end

script.on_event(defines.events.on_tick, function(event)
    local player = game.players[1]
    local tick = event.tick

    if global.PSC_entity == nil then
        return
    end
    for i , _ in pairs(global.PSC_entity) do
        update_PSC(i,tick,player)
    end
end)

script.on_event(defines.events.on_selected_entity_changed, function(event)
	--game.print("change")
	local player = game.players[event.player_index]
    local current = player.selected
    local tick = event.tick
    if current == nil then

    else
        if current.name == "PSC-interface" and current.valid then
            -- game.print("last="..last.name)
            update_PSC(current.unit_number,tick,player)
            -- player.selected = last
        end
	end
end)

local function on_built(event)
	local main_entity = event.created_entity
   	local surface = main_entity.surface
	local force = main_entity.force
	local position = main_entity.position
	local player = main_entity.last_user
	-- local main_control = main_entity.get_or_create_control_behavior()
	local outcom = nil

    if global.PSC_entity == nil then
        global.PSC_entity = {}
    end
   
    if main_entity.name == "PSC-interface" then 

        local area = {{x = position.x - 0.1,y = position.y - 0.1},{x = position.x + 0.1, y = position.y + 0.1}}

        local ghosts = surface.find_entities_filtered{area = area, ghost_name = "PSC-constant-combinator"} 
            if ghosts ~= nil then	
                for i , ghost in pairs(ghosts) do
                    ghost.revive()
                end
                local results = surface.find_entities_filtered{area = area, name = "PSC-constant-combinator"} 
                for i , result in pairs(results) do
                    if result ~= nil and result.valid then
                        outcom = result
                    end
                end
            end
        
        if outcom == nil then
            outcom = surface.create_entity({ name = "PSC-constant-combinator", 
                                        position = position, force = force, 
                                        fast_replace = true, player = player})
        end
        outcom.last_user = player
        outcom.operable = false

        -- local input_id = defines.circuit_connector_id.combinator_input
	    -- local output_id = defines.circuit_connector_id.combinator_output
        -- local wire = defines.wire_type.green
        -- outcom.connect_neighbour({target_entity = main_entity, wire = wire, source_circuit_id = combinator_output})
        -- wire = defines.wire_type.red
        -- outcom.connect_neighbour({target_entity = main_entity, wire = wire, source_circuit_id = combinator_output})

        global.PSC_entity[main_entity.unit_number] = 
            {	
                main_entity = main_entity,  
                combinator = outcom
            }

        player.print(main_entity.unit_number)
    end
end

local function on_death(event)
	local main_entity = event.entity
	if main_entity.name == "CW-power-combinator" then
		
		if global.PSC_entity[main_entity.unit_number] ~= nil then
			global.PSC_entity[main_entity.unit_number].combinator.die(event.force,event.cause)
			global.PSC_entity[main_entity.unit_number] = nil
		end

	end
end


local build_events = {defines.events.on_built_entity, defines.events.on_robot_built_entity}
script.on_event(build_events, on_built)

script.on_event(defines.events.on_entity_died, on_death)
