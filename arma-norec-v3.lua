local Activation_Key = 4
local Button = false
local CorrectionLVL = 0
local Spray = 0
local Pattern = {-0.8, 1.5, -0.9, 2, -1, 2.5}
local RandomizeSleep = math.random(47,48)

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
        if IsMouseButtonPressed(1) and arg == 1 then
            repeat
                MoveMouseRelative(Pattern[0],Pattern[1])
                Sleep(RandomizeSleep)
                Spray = Spray + 1
                if Spray > 90 then
                    CorrectionLVL = 1
                    OutputLogs('\nCorrectionLVL => 2')
                    MoveMouseRelative(Pattern[2],Pattern[3])
                    Sleep(RandomizeSleep)
                    if Spray == 149
                        CorrectionLVL = 3
                    end
                elseif Spray > 150 and CorrectionLVL == 3
                    OutputLogs('\nCorrectionLVL => 3')
                    MoveMouseRelative(Pattern[4],Pattern[5])
                    Sleep(RandomizeSleep)
                end
            until not IsMouseButtonPressed(1)
            OutputLogs('\nCorrectionLVL => 1')
            Spray = 0
        end
    end 
end
