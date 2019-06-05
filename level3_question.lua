
-----------------------------------------------------------------------------------------
-- INITIALIZATIONS
-----------------------------------------------------------------------------------------

-- Use Composer Libraries
local composer = require( "composer" )
local widget = require( "widget" )
local physics = require( "physics")

-----------------------------------------------------------------------------------------

-- Naming Scene
sceneName = "level3_question"

-----------------------------------------------------------------------------------------

-- Creating Scene Object
local scene = composer.newScene( sceneName )

-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------

-- The local variables for this scene
local questionText

local firstNumber
local secondNumber

local answer
local wrongAnswer1
local wrongAnswer2

local answerText 
local wrongAnswerText1
local wrongAnswerText2
local wrongAnswerText3

local answerPosition = 1
local bkg
local cover

local X1 = display.contentWidth*2/9
local X2 = display.contentWidth*4/7
local Y1 = display.contentHeight*1/2
local Y2 = display.contentHeight*5.5/7

local userAnswer
local textTouched = false
local randomQuestion

local question
local correctAnswer
local incorrectAnswer1
local incorrectAnswer2
local incorrectAnswer3

local totalSeconds = 31
local secondsLeft = 31
local clockText
local countDownTimer



-----------------------------------------------------------------------------------------
--LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------

--making transition to next scene
local function BackToLevel3() 
    composer.hideOverlay("crossFade", 400 )
  
    ResumeLevel3()
end 

-----------------------------------------------------------------------------------------
--checking to see if the user pressed the right answer and bring them back to level 1
local function TouchListenerAnswer(touch)
    userAnswer = answerText.text
    
    if (touch.phase == "ended") then

        BackToLevel3( )
    
    end 
end

--checking to see if the user pressed the right answer and bring them back to level 1
local function TouchListenerWrongAnswer(touch)
    userAnswer = wrongText1.text
    
    if (touch.phase == "ended") then
        
        BackToLevel3( )
        
        
    end 
end

--checking to see if the user pressed the right answer and bring them back to level 1
local function TouchListenerWrongAnswer2(touch)
    userAnswer = wrongText2.text
    
    if (touch.phase == "ended") then

        BackToLevel3( )
        
    end 
end

--checking to see if the user pressed the right answer and bring them back to level 1
local function TouchListenerWrongAnswer3(touch)
    userAnswer = wrongText3.text
    
    if (touch.phase == "ended") then

        BackToLevel3( )
        
    end 
end

--adding the event listeners 
local function AddTextListeners ( )
    answerText:addEventListener( "touch", TouchListenerAnswer )
    wrongText1:addEventListener( "touch", TouchListenerWrongAnswer)
    wrongText2:addEventListener( "touch", TouchListenerWrongAnswer2)
    wrongText3:addEventListener( "touch", TouchListenerWrongAnswer3)
end

--removing the event listeners
local function RemoveTextListeners()
    answerText:removeEventListener( "touch", TouchListenerAnswer )
    wrongText1:removeEventListener( "touch", TouchListenerWrongAnswer)
    wrongText2:removeEventListener( "touch", TouchListenerWrongAnswer2)
    wrongText3:removeEventListener( "touch", TouchListenerWrongAnswer3)
end

local function DisplayQuestion()
    --chooses the question asked
    randomQuestion = math.random(1,12)

    if (randomQuestion == 1) then

        --creating the question depending on the selcetion number
        questionText.text = "What is the name of the process\nwhere oxygen is made?"

     --creating answer text from list it corispondes with the animals list
        answerText.text = "Photosynthesis"
    
        --creating wrong answers
        wrongText1.text = "Breathing"
        wrongText2.text = "Cellular respiration"
        wrongText3.text = "Oxygenation"

    elseif (randomQuestion == 2) then

        questionText.text = "What is the freezing temperature?"

     --creating answer text from list it corispondes with the animals list
        answerText.text = "0"
    
        --creating wrong answers
        wrongText1.text = "10"
        wrongText2.text = "1"
        wrongText3.text = "30"

    elseif (randomQuestion == 3) then

        questionText.text = "What is the compound for water?"

    --creating answer text from list it corispondes with the animals list
        answerText.text = "H2O"
    
    --creating wrong answers
        wrongText1.text = "HO2"
        wrongText2.text = "WAT"
        wrongText3.text = "224"

    elseif (randomQuestion == 4) then

        questionText.text = "What gas do you need to breath?"

    --creating answer text from list it corispondes with the animals list
        answerText.text = "Oxygen"
    
    --creating wrong answers
        wrongText1.text = "Carbon"
        wrongText2.text = "Smoke"
        wrongText3.text = "Water"

    elseif (randomQuestion == 5) then

        questionText.text = "What is evaporation?"

    --creating answer text from list it corispondes with the animals list
        answerText.text = "Liquid becomes gas"
    
    --creating wrong answers
        wrongText1.text = "Gas becomes liquid"
        wrongText2.text = "Liquid becomes solid"
        wrongText3.text = "Solid becomes liquid"

    elseif (randomQuestion == 6) then

        questionText.text = "How many planets are there?"

    --creating answer text from list it corispondes with the animals list
        answerText.text = "8"
    
    --creating wrong answers
        wrongText1.text = "1"
        wrongText2.text = "5"
        wrongText3.text = "29"

    elseif (randomQuestion == 7) then

        questionText.text = "What's the largest planet"

    --creating answer text from list it corispondes with the animals list
        answerText.text = "Jupiter"
    
    --creating wrong answers
        wrongText1.text = "Earth"
        wrongText2.text = "Mercury"
        wrongText3.text = "Venus"

    elseif (randomQuestion == 8) then

        questionText.text = "How do plants help you to survive"

    --creating answer text from list it corispondes with the animals list
        answerText.text = "They make oxygen"
    
    --creating wrong answers
        wrongText1.text = "They dont"
        wrongText2.text = "You eat them"
        wrongText3.text = "They are peaceful"

    elseif (randomQuestion == 9) then

        questionText.text = "What's the smallest planet"

    --creating answer text from list it corispondes with the animals list
        answerText.text = "Mercury"
    
    --creating wrong answers
        wrongText1.text = "Earth"
        wrongText2.text = "Jupiter"
        wrongText3.text = "Venus"

    elseif (randomQuestion == 10) then

        questionText.text = "What's the coldest planet"

    --creating answer text from list it corispondes with the animals list
        answerText.text = "Neptune"
    
    --creating wrong answers
        wrongText1.text = "Venus"
        wrongText2.text = "Earth"
        wrongText3.text = "Saturn"

    elseif (randomQuestion == 11) then

        questionText.text = "What's the hottest planet"

    --creating answer text from list it corispondes with the animals list
        answerText.text = "Venus"
    
    --creating wrong answers
        wrongText1.text = "Earth"
        wrongText2.text = "Jupiter"
        wrongText3.text = "Mars"

    elseif (randomQuestion == 12) then

        questionText.text = "How big is the sun"

    --creating answer text from list it corispondes with the animals list
        answerText.text = "695,510Km"
    
    --creating wrong answers
        wrongText1.text = "10Km"
        wrongText2.text = "10Mm"
        wrongText3.text = "695,510Mm"
    end
end

local function UpdateTime()

    -- decrement the number of seconds
    secondsLeft = secondsLeft - 1

    -- display the number of seconds left in the clock object
    clockText.text = "Seconds Left:" .. secondsLeft .. ""

    if (secondsLeft == 0) then
        -- reset the number of seconds left
        numLives = numLives - 1
        BackToLevel3()
    end
end

local function StartTimer()
    -- create a countdown timer that loops infinitely
    countDownTimer = timer.performWithDelay(1000, UpdateTime, 0)
end

local function PositionAnswers()

    --creating random start position in a cretain area
    answerPosition = math.random(1,3)

    if (answerPosition == 1) then

        answerText.x = X1
        answerText.y = Y1
        
        wrongText1.x = X2
        wrongText1.y = Y1
        
        wrongText2.x = X1
        wrongText2.y = Y2

        wrongText3.x = X2
        wrongText3.y = Y2

        
    elseif (answerPosition == 2) then

        answerText.x = X1
        answerText.y = Y2
            
        wrongText1.x = X1
        wrongText1.y = Y1
            
        wrongText2.x = X2
        wrongText2.y = Y2

        wrongText3.x = X2
        wrongText3.y = Y1


    elseif (answerPosition == 3) then

        answerText.x = X2
        answerText.y = Y1
            
        wrongText1.x = X2
        wrongText1.y = Y2
            
        wrongText2.x = X1
        wrongText2.y = Y1
        
        wrongText3.x = X1
        wrongText3.y = Y2   
    end
end

-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------

-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view  

    -----------------------------------------------------------------------------------------
    --covering the other scene with a rectangle so it looks faded and stops touch from going through
    bkg = display.newRect(display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight)
    --setting to a semi black colour
    bkg:setFillColor(0,0,0,0.5)

    -----------------------------------------------------------------------------------------
    --making a cover rectangle to have the background fully bolcked where the question is
    cover = display.newRoundedRect(display.contentCenterX, display.contentCenterY, display.contentWidth*0.8, display.contentHeight*0.95, 50 )
    --setting its colour
    cover:setFillColor(96/255, 96/255, 96/255)

    -- create the question text object
    questionText = display.newText("", display.contentCenterX, display.contentCenterY*3/8, Arial, 35)

    -- create the answer text object & wrong answer text objects
    answerText = display.newText("", X1, Y2, Arial, 35)
    answerText.anchorX = 0
    wrongText1 = display.newText("", X2, Y2, Arial, 35)
    wrongText1.anchorX = 0
    wrongText2 = display.newText("", X1, Y1, Arial, 35)
    wrongText2.anchorX = 0
    wrongText3 = display.newText("", X2, Y1, Arial, 35)
    wrongText3.anchorX = 0

    clockText = display.newText("", 500, 230, Arial, 50)
    clockText:setFillColor(1,0,0)

    -----------------------------------------------------------------------------------------

    -- insert all objects for this scene into the scene group
    sceneGroup:insert(bkg)
    sceneGroup:insert(cover)
    sceneGroup:insert(questionText)
    sceneGroup:insert(answerText)
    sceneGroup:insert(wrongText1)
    sceneGroup:insert(wrongText2)
    sceneGroup:insert(wrongText3)
    sceneGroup:insert(clockText)


end --function scene:create( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to appear on screen
function scene:show( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view
    local phase = event.phase

    -----------------------------------------------------------------------------------------

    if ( phase == "will" ) then

        -- Called when the scene is still off screen (but is about to come on screen).
    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        -- Called when the scene is now on screen.
        -- Insert code here to make the scene come alive.
        -- Example: start timers, begin animation, play audio, etc.
        DisplayQuestion()
        PositionAnswers()
        AddTextListeners()
        StartTimer()

    end

end --function scene:show( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to leave the screen
function scene:hide( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view
    local phase = event.phase

    -----------------------------------------------------------------------------------------

    if ( phase == "will" ) then
        -- Called when the scene is on screen (but is about to go off screen).
        -- Insert code here to "pause" the scene.
        -- Example: stop timers, stop animation, stop audio, etc.
        --parent:resumeGame()
    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen.
        timer.cancel (countDownTimer)
        RemoveTextListeners()
    end

end --function scene:hide( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to be destroyed
function scene:destroy( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------

    -- Called prior to the removal of scene's view ("sceneGroup"). 
    -- Insert code here to clean up the scene.
    -- Example: remove display objects, save state, etc.

end -- function scene:destroy( event )

-----------------------------------------------------------------------------------------
-- EVENT LISTENERS
-----------------------------------------------------------------------------------------

-- Adding Event Listeners
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene