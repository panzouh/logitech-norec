local Activation_Key = 4
local Button = false

EnablePrimaryMouseButtonEvents(true);

local function OutputLogs(WriteEvent)
    OutputLogMessage(WriteEvent);
end

function OnEvent(event, arg)
    if IsMouseButtonPressed(Activation_Key) and Button == false then
        OutputLogs('\nHello there')
        Button = true
    elseif IsMouseButtonPressed(Activation_Key)  and Button == true then
        OutputLogs('\nYou are a bold one')
        Button = false
    end
    if Button == true then
        if IsMouseButtonPressed(1) and arg == 1 then
            repeat
                MoveMouseRelative(-2,2)
                Sleep(9.5)
                MoveMouseRelative(1.75,1)
                Sleep(5)
            until not IsMouseButtonPressed(1)
            CorrectionLVL = 0
        end
    end 
end
