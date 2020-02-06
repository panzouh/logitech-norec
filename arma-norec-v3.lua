local Activation_Key = 4
local Button = false
local CorrectionLVL = 1
local Spray = 0

EnablePrimaryMouseButtonEvents(true);

local function OutputLogs(WriteEvent)
    OutputLogMessage(WriteEvent);
end

function OnEvent(event, arg)
    if IsMouseButtonPressed(Activation_Key) and Button == false then
        OutputLogs('\nHello there')
        OutputLogs('\nCorrectionLVL => 1')
        Button = true
    elseif IsMouseButtonPressed(Activation_Key)  and Button == true then
        OutputLogs('\nYou are a bold one')
        Button = false
    end

    if Button == true then
        if IsMouseButtonPressed(1) then
            repeat
				OutputLogs('\nEntree repeat')
                MoveMouseRelative(-0.8,1.5)
                Sleep(16)
                Spray = Spray + 1
                if Spray == 89 then
				OutputLogs('\nEntree spray 89')
                    CorrectionLVL = 2
                    Spray = Spray + 1
                elseif Spray > 90 and CorrectionLVL == 2 then
                    CorrectionLVL = 2
                    OutputLogs('\nCorrectionLVL => 2')
                    MoveMouseRelative(-0.9,2)
                    Sleep(16)
                    if Spray == 149 then
                        Spray = Spray + 1
                        CorrectionLVL = 3
                    end
                elseif Spray > 150 and CorrectionLVL == 3 then
                    OutputLogs('\nCorrectionLVL => 3')
                    MoveMouseRelative(-1,2)
                    Sleep(16)
                end
            until not IsMouseButtonPressed(1)
            OutputLogs('\nCorrectionLVL => 1')
            Spray = 0
        end
    end 
end
