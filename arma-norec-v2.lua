local Activation_Key = 4
local Button = false
local CorrectionLVL = 0

EnablePrimaryMouseButtonEvents(true);

local function OutputLogs(WriteEvent)
    OutputLogMessage(WriteEvent);
end

function OnEvent(event, arg)
    if IsMouseButtonPressed(Activation_Key) and Button == false then
        OutputLogs('\nHello there')
        OutputLogs('\nCorrectionLVL => 0')
        Button = true
    elseif IsMouseButtonPressed(Activation_Key)  and Button == true then
        OutputLogs('\nYou are a bold one')
        Button = false
    end
    if Button == true then
        if IsMouseButtonPressed(1) and arg == 1 then
            repeat
                MoveMouseRelative(-0.9,2)
                Sleep(16)
                CorrectionLVL = CorrectionLVL + 1
                if CorrectionLVL > 90 then
                    OutputLogs('\nCorrectionLVL => 1')
                    MoveMouseRelative(-1,2.5)
                    Sleep(16)
                end
            until not IsMouseButtonPressed(1)
            OutputLogs('\nCorrectionLVL => 0')
            CorrectionLVL = 0
        end
    end 
end
