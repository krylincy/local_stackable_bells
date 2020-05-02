	
local stackSize = GLOBAL.TUNING.STACK_SIZE_SMALLITEM

local function onHammerFn (inst, worker)	
	local amount = inst.components.stackable:StackSize() or 1
	
	for i = 1, amount do
		inst.components.lootdropper:DropLoot()
	end	
	
	GLOBAL.SpawnPrefab("singingshell_critterfx").Transform:SetPosition(inst.Transform:GetWorldPosition())
	
	inst.SoundEmitter:PlaySound("dontstarve/common/destroy_pot")
	inst:Remove()	
end

local function singingshell (inst)	
	if inst.components ~= nil and inst.components.workable ~= nil then
		inst:AddComponent("stackable")
		inst.components.stackable.maxsize = stackSize
		
		inst.components.workable:SetOnFinishCallback(onHammerFn)
	end
end

AddPrefabPostInit("singingshell_octave3", singingshell)
AddPrefabPostInit("singingshell_octave4", singingshell)
AddPrefabPostInit("singingshell_octave5", singingshell)

