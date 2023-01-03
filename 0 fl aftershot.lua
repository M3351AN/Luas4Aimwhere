--ich forgot my aimware password so ne tested/(ToT)/~~
--da, ia ist m1tZw desu!!
client.AllowListener("weapon_fire")--aimwhere...
local lP = entities.GetLocalPlayerIndex()
local shotFl = gui.Checkbox(m1tZw,"shotFl", "0 fl on shot ", false)
--local shotflticks = gui.Slider(m1tZw,"shotflticks", "0 fl on shot ticks",0,0,128)
--sie sagen subete 15 ticks...
local reset = 0
local shotTime = 0
local originFl = 0
callbacks.Register("createmove", "timer",function()
    if reset == 1 and shotTime < globals.TickCount() then 
        gui.SetValue("misc.fakelag.factor",originFl)--reset fl
        reset = 0
    elseif reset == 1 and shotTime > globals.TickCount() then--anti other fl luas.15ticks such long long a time right?
        gui.SetValue("misc.fakelag.factor",0)--keep fl 0 
    end
end)
local function smFl(Event)--所以说smfl是什么意思，虐待假卡？😳
    if (event:Get_Name("weapon_fire")) and gui.GetValue("shotFl") then
        local fireman = Event:GetInt("userid");
        local firemanindex = client.GetPlayerNameByUserID(fireman);
        if firemanindex == lP and reset == 0 then
            originFl = gui.GetValue("misc.fakelag.factor")--fetch origin fl
            gui.SetValue("misc.fakelag.factor",0)--set fl 0
            shotTime = globals.TickCount() + 15--kept for 15ticks or you can set to gui.GetValue("shotflticks")
            reset = 1
            return
        end
        if firemanindex == lP and reset == 1 then
            gui.SetValue("misc.fakelag.factor",0)--set fl 0
            shotTime = globals.TickCount() + 15--kept for 15ticks or you can set to gui.GetValue("shotflticks")
            return
        end

    end
end
callbacks.Register("FireGameEvent", "smFl", smFl);
