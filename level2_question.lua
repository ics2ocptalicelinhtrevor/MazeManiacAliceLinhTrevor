-----------------------------------------------------------------------------------------
--
-- game_level1.lua
-- Created by: Alice
-- Date: Nov. 22nd, 2014
-- Description: This is the level 1 screen of the game.
-----------------------------------------------------------------------------------------


-- Use Composer Library
local composer = require( "composer" )

-----------------------------------------------------------------------------------------

-- Use Widget Library
local widget = require( "widget" )

-----------------------------------------------------------------------------------------

-- Naming Scene
sceneName = "level2_question"

-- Creating Scene Object
local scene = composer.newScene( sceneName )

-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------

-- The background image and soccer ball for this scene
local bkg_image

local question
local questionNumber

-- display the lives
local life1
local life2
local life3

--the alternate numbers randomly generated
local correctAnswer
local alternateAnswer1
local alternateAnswer2
local alternateAnswer3  

-- shapes 
local circle
local triangle
local square
local rectangle
local star
local oval
local diamond
local octogon
local hexagon
local pentagon

-- display answers
local X1 = display.contentWidth*1/7
local X2 = display.contentWidth*4/7
local Y1 = display.contentHeight*1/2
local Y2 = display.contentHeight*4.5/7  

-- Variables containing the user answer and the actual answer
local userAnswer

-- boolean variables telling me which answer box was touched
local correctAnswerAlreadyTouched = false
local alternateAnswer1AlreadyTouched = false
local alternateAnswer2AlreadyTouched = false
local alternateAnswer3AlreadyTouched = false


-- create variables that will hold the previous x- and y-positions so that 
-- each answer will return back to its previous position after it is moved
local correctAnswerPreviousY
local alternateAnswer1PreviousY
local alternateAnswer2PreviousY
local alternateAnswer3PreviousY

local correctAnswerPreviousX
local alternateAnswer1PreviousX
local alternateAnswer2PreviousX
local alternateAnswer3PreviousX

-- the black box where the user will drag the answer
local userAnswerPlaceholder

-- sound effects
local correctSound
local booSound

-----------------------------------------------------------------------------------------
-- SOUNDS
-----------------------------------------------------------------------------------------


-----------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------

local function AskQuestion()
    -- create random questions
    questionNumber = math.random(1,10)

    if  (questionNumber == 1) then

        question.text = "Drag the name onto the shape."

        correctAnswer.text = "circle"
        alternateAnswer1.text = "triangle"
        alternateAnswer2.text = "square"
        alternateAnswer3.text = "rectangle"

        circle.isVisible = true

    elseif  (questionNumber == 2) then

        question.text = "Drag the name onto the shape."

        correctAnswer.text = "triangle"
        alternateAnswer1.text = "circle"
        alternateAnswer2.text = "star"
        alternateAnswer3.text = "rectangle"

        triangle.isVisible = true

    elseif  (questionNumber == 3) then

        question.text = "Drag the name onto the shape."

        correctAnswer.text = "rectangle"
        alternateAnswer1.text = "circle"
        alternateAnswer2.text = "star"
        alternateAnswer3.text = "oval"

        rectangle.isVisible = true
       
    elseif  (questionNumber == 4) then

        question.text = "Drag the name onto the shape."

        correctAnswer.text = "square"
        alternateAnswer1.text = "diamond"
        alternateAnswer2.text = "star"
        alternateAnswer3.text = "rectangle"

        square.isVisible = true

    elseif  (questionNumber == 5) then

        question.text = "Drag the name onto the shape."

        correctAnswer.text = "oval"
        alternateAnswer1.text = "triangle"
        alternateAnswer2.text = "circle"
        alternateAnswer3.text = "rectangle"

        oval.isVisible = true

    elseif  (questionNumber == 6) then

        question.text = "Drag the name onto the shape."

        correctAnswer.text = "octagon"
        alternateAnswer1.text = "hexagon"
        alternateAnswer2.text = "circle"
        alternateAnswer3.text = "square"

        octagon.isVisible = true

    elseif  (questionNumber == 7) then

        question.text = "Drag the name onto the shape."

        correctAnswer.text = "penatagon"
        alternateAnswer1.text = "octagon"
        alternateAnswer2.text = "star"
        alternateAnswer3.text = "square"

        pentagon.isVisible = true

    elseif  (questionNumber == 8) then

        question.text = "Drag the name onto the shape."

        correctAnswer.text = "hexagon"
        alternateAnswer1.text = "pentagon"
        alternateAnswer2.text = "square"
        alternateAnswer3.text = "circle"

        hexagon.isVisible = true

    elseif  (questionNumber == 9) then

        question.text = "Drag the name onto the shape."

        correctAnswer.text = "star"
        alternateAnswer1.text = "rectangle"
        alternateAnswer2.text = "circle"
        alternateAnswer3.text = "diamond"

        star.isVisible = true

    elseif  (questionNumber == 10) then

        question.text = "Drag the name onto the shape."

        correctAnswer.text = "diamond"
        alternateAnswer1.text = "hexagon"
        alternateAnswer2.text = "star"
        alternateAnswer3.text = "square"

        diamond.isVisible = true

    end
end


local function PositionAnswers()

 --creating random start position in a cretain area
    answerPosition = math.random(1,4)

    if (answerPosition == 1) then

        correctAnswer.x = X1
        correctAnswer.y = Y1
        correctAnswerPreviousX = X1
        correctAnswerPreviousY = Y1
        
        alternateAnswer1.x = X2
        alternateAnswer1.y = Y1
        
        alternateAnswer2.x = X1
        alternateAnswer2.y = Y2

        alternateAnswer3.x = X2
        alternateAnswer3.y = Y2

        
    elseif (answerPosition == 2) then

        correctAnswer.x = X2
        correctAnswer.y = Y1
        correctAnswerPreviousX = X2
        correctAnswerPreviousY = Y1
        
        alternateAnswer1.x = X1
        alternateAnswer1.y = Y1
        
        alternateAnswer2.x = X1
        alternateAnswer2.y = Y2

        alternateAnswer3.x = X2
        alternateAnswer3.y = Y2

    elseif (answerPosition == 3) then

        correctAnswer.x = X1
        correctAnswer.y = Y2
        correctAnswerPreviousX = X1
        correctAnswerPreviousY = Y2
        
        alternateAnswer1.x = X2
        alternateAnswer1.y = Y1
        
        alternateAnswer2.x = X2
        alternateAnswer2.y = Y2

        alternateAnswer3.x = X1
        alternateAnswer3.y = Y1 

    elseif (answerPosition == 4) then

        correctAnswer.x = X2
        correctAnswer.y = Y2
        correctAnswerPreviousX = X2
        correctAnswerPreviousY = Y2
        
        alternateAnswer1.x = X1
        alternateAnswer1.y = Y2
        
        alternateAnswer2.x = X2
        alternateAnswer2.y = Y1

        alternateAnswer3.x = X1
        alternateAnswer3.y = Y1 
    end
end

-- Transitioning Function to YouWin screen
local function YouWinTransitionLevel2( )
    composer.gotoScene("you_win", {effect = "fade", time = 500})
end

-- Function to Restart Level 1
local function RestartLevel2()
    AskQuestion()
    PositionAnswers()    
end

-- Function to Check User Input
local function CheckUserAnswerInput()
          
    timer.performWithDelay(1600, RestartLevel2) 
end

local function TouchListenerCorrectAnswer(touch)
    --only work if none of the other boxes have been touched
    if (alternateAnswer1AlreadyTouched == false) and 
        (alternateAnswer2AlreadyTouched == false) and
        (alternateAnswer3AlreadyTouched == false)  then

        if (touch.phase == "began") then

            --let other boxes know it has been clicked
            correctAnswerAlreadyTouched = true
            print ("**clicked on correct answer")

        --drag the answer to follow the mouse
        elseif (touch.phase == "moved") then
            
            correctAnswer.x = touch.x
            correctAnswer.y = touch.y

        -- this occurs when they release the mouse
        elseif (touch.phase == "ended") then

            correctAnswerAlreadyTouched = false

              -- if the correct answer is dragged into the answer placeholder, place it in the center of it
            if (((userAnswerPlaceholder.x - userAnswerPlaceholder.width/2) < correctAnswer.x ) and
                ((userAnswerPlaceholder.x + userAnswerPlaceholder.width/2) > correctAnswer.x ) and 
                ((userAnswerPlaceholder.y - userAnswerPlaceholder.height/2) < correctAnswer.y ) and 
                ((userAnswerPlaceholder.y + userAnswerPlaceholder.height/2) > correctAnswer.y ) ) then

                -- setting the position of the number to be in the center of the box

                correctAnswer.x = userAnswerPlaceholder.x
                correctAnswer.y = userAnswerPlaceholder.y


                -- call the function to check if the user's input is correct or not
                CheckUserAnswerInput()

            --else make box go back to where it was
            else
                correctAnswer.x = correctAnswerPreviousX
                correctAnswer.y = correctAnswerPreviousY
            end
        end
    end                
end 


local function TouchListenerAlternateAnswer1(touch)
    --only work if none of the other boxes have been touched
    if (AnswerAlreadyTouched == false) and 
        (alternateAnswer2AlreadyTouched == false) then

        if (touch.phase == "began") then
            --let other boxes know it has been clicked
            alternateAnswer1AlreadyTouched = true
            
        --drag the answer to follow the mouse
        elseif (touch.phase == "moved") then
            alternateAnswer1.x = touch.x
            alternateAnswer1.y = touch.y

        elseif (touch.phase == "ended") then
            alternateAnswer1AlreadyTouched = false

            -- if the box is in the usercorrectAnswer Placeholder  go to center of placeholder
            if (((userAnswerPlaceholder.x - userAnswerPlaceholder.width/2) < alternateAnswer1.x ) and 
                ((userAnswerPlaceholder.x + userAnswerPlaceholder.width/2) > alternateAnswer1.x ) and 
                ((userAnswerPlaceholder.y - userAnswerPlaceholder.height/2) < alternateAnswer1.y ) and 
                ((userAnswerPlaceholder.y + userAnswerPlaceholder.height/2) > alternateAnswer1.y ) ) then

                userAnswerPlaceholder.x = alternateAnswer1.x
                userAnswerPlaceholder.y = alternateAnswer1.y


                -- call the function to check if the user's input is correct or not
                CheckUserAnswerInput()

            --else make box go back to where it was
            else
                alternateAnswer1.x = alternateAnswer1PreviousX
                alternateAnswer1.y = alternateAnswer1PreviousY
            end
        end
    end
end 

local function TouchListenerAlternateAnswer2(touch)
    --only work if none of the other boxes have been touched
    if (correctAnswerAlreadyTouched == false) and 
        (alternateAnswer1AlreadyTouched == false) then

        if (touch.phase == "began") then
            --let other boxes know it has been clicked
            alternateAnswer2AlreadyTouched = true

            
        elseif (touch.phase == "moved") then
            --dragging function
            alternateAnswer2.x = touch.x
            alternateAnswer2.y = touch.y

        elseif (touch.phase == "ended") then
            alternateAnswer2AlreadyTouched = false

            -- if the box is in the usercorrectAnswer Placeholder  go to center of placeholder
            if (((userAnswerPlaceholder.x - userAnswerPlaceholder.width/2) < alternateAnswer2.x ) and 
                ((userAnswerPlaceholder.x + userAnswerPlaceholder.width/2) > alternateAnswer2.x ) and 
                ((userAnswerPlaceholder.y - userAnswerPlaceholder.height/2) < alternateAnswer2.y ) and 
                ((userAnswerPlaceholder.y + userAnswerPlaceholder.height/2) > alternateAnswer2.y ) ) then

                userAnswerPlaceholder.x = alternateAnswer2.x
                userAnswerPlaceholder.y = alternateAnswer2.y

                -- call the function to check if the user's input is correct or not
                CheckUserAnswerInput()

            --else make box go back to where it was
            else
                alternateAnswer2.x = alternateAnswer2PreviousX
                alternateAnswer2.y = alternateAnswer2PreviousY
            end
        end
    end
end 

local function TouchListenerAlternateAnswer3(touch)
    --only work if none of the other boxes have been touched
    if (correctAnswerAlreadyTouched == false) and 
        (alternateAnswer1AlreadyTouched == false) then

        if (touch.phase == "began") then
            --let other boxes know it has been clicked
            alternateAnswer3AlreadyTouched = true
            
        elseif (touch.phase == "moved") then
            --dragging function
            alternateAnswer3.x = touch.x
            alternateAnswer3.y = touch.y

        elseif (touch.phase == "ended") then
            alternateAnswer3AlreadyTouched = false

            -- if the box is in the usercorrectAnswer Placeholder  go to center of placeholder
            if (((userAnswerPlaceholder.x - userAnswerPlaceholder.width/2) < alternateAnswer3.x ) and 
                ((userAnswerPlaceholder.x + userAnswerPlaceholder.width/2) > alternateAnswer3.x ) and 
                ((userAnswerPlaceholder.y - userAnswerPlaceholder.height/2) < alternateAnswer3.y ) and 
                ((userAnswerPlaceholder.y + userAnswerPlaceholder.height/2) > alternateAnswer3.y ) ) then

                userAnswerPlaceholder.x = alternateAnswer3.x
                userAnswerPlaceholder.y = alternateAnswer3.y

                -- call the function to check if the user's input is correct or not
                CheckUserAnswerInput()

            --else make box go back to where it was
            else
                alternateAnswer3.x = alternateAnswer3PreviousX
                alternateAnswer3.y = alternateAnswer3PreviousY
            end
        end
    end
end 

-- Function that Adds Listeners to each answer box
local function AddTouchListeners()
    correctAnswer:addEventListener("touch", TouchListenerCorrectAnswer)
    alternateAnswer1:addEventListener("touch", TouchListenerAlternateAnswer1)
    alternateAnswer2:addEventListener("touch", TouchListenerAlternateAnswer2)
    alternateAnswer3:addEventListener("touch", TouchListenerAlternateAnswer3)
end 

-- Function that Removes Listeners to each answer box
local function RemoveTouchListeners()
    correctAnswer:removeEventListener("touch", TouchListenerCorrectAnswer)
    alternateAnswer1:removeEventListener("touch", TouchListenerAlternateAnswer1)
    alternateAnswer2:removeEventListener("touch", TouchListenerAlternateAnswer2)
    alternateAnswer3:removeEventListener("touch", TouchListenerAlternateAnswer3)
end 

----------------------------------------------------------------------------------
-- GLOBAL FUNCTIONS
----------------------------------------------------------------------------------


----------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
----------------------------------------------------------------------------------

-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    ----------------------------------------------------------------------------------
    ----------------------------------------------------------------------------------
    --Inserting backgroud image and lives
    ----------------------------------------------------------------------------------

    -- Insert the background image
    bkg_image = display.newImageRect("Images/Level2ScreenAliceR@2x.png", 2048, 1536)
    bkg_image.anchorX = 0
    bkg_image.anchorY = 0
    bkg_image.width = display.contentWidth
    bkg_image.height = display.contentHeight

    -- Insert the life images
    life1 = display.newImageRect("Images/heart.png", 100, 100)
    life1.x = display.contentWidth * 5 / 8
    life1.y = display.contentHeight * 1 / 7

    life2 = display.newImageRect("Images/heart.png", 100, 100)
    life2.x = display.contentWidth * 6 / 8
    life2.y = display.contentHeight * 1 / 7

    life3 = display.newImageRect("Images/heart.png", 100, 100)
    life3.x = display.contentWidth * 7 / 8
    life3.y = display.contentHeight * 1 / 7

    -- Insert the shapes for the questions
    circle = display.newImageRect("Images/circleAliceR@2x.png", 100, 100)
    circle.x = display.contentWidth * 0.6
    circle.y = display.contentHeight * 0.9

    circle.isVisible = false

    triangle = display.newImageRect("Images/triangleAliceR@2x.png", 100, 100)
    triangle.x = display.contentWidth * 0.6
    triangle.y = display.contentHeight * 0.9

    triangle.isVisible = false

    diamond = display.newImageRect("Images/diamondAliceR@2x.png", 100, 100)
    diamond.x = display.contentWidth * 0.6
    diamond.y = display.contentHeight * 0.9

    diamond.isVisible = false

    hexagon = display.newImageRect("Images/hexagonAliceR@2x.png", 100, 100)
    hexagon.x = display.contentWidth * 0.6
    hexagon.y = display.contentHeight * 0.9

    hexagon.isVisible = false

    rectangle = display.newImageRect("Images/rectangleAliceR@2x.png", 200, 100)
    rectangle.x = display.contentWidth * 0.6
    rectangle.y = display.contentHeight * 0.9

    rectangle.isVisible = false

    star = display.newImageRect("Images/starAliceR@2x.png", 100, 100)
    star.x = display.contentWidth * 0.6
    star.y = display.contentHeight * 0.9

    star.isVisible = false

    oval = display.newImageRect("Images/ovalAliceR@2x.png", 200, 100)
    oval.x = display.contentWidth * 0.6
    oval.y = display.contentHeight * 0.9

    oval.isVisible = false

    pentagon = display.newImageRect("Images/pentagonAliceR@2x.png", 100, 100)
    pentagon.x = display.contentWidth * 0.6
    pentagon.y = display.contentHeight * 0.9

    pentagon.isVisible = false

    octagon = display.newImageRect("Images/octagonAliceR@2x.png", 100, 100)
    octagon.x = display.contentWidth * 0.6
    octagon.y = display.contentHeight * 0.9

    octagon.isVisible = false

    square = display.newImageRect("Images/squareAliceR@2x.png", 100, 100)
    square.x = display.contentWidth * 0.6
    square.y = display.contentHeight * 0.9

    square.isVisible = false

    --the text that displays the question
    question = display.newText( "" , 0, 0, nil, 50)
    question.anchorX = 0
    question.anchorY = 0
    question.x = display.contentWidth *0.2
    question.y = display.contentHeight *0.3

    question:setTextColor(0/255, 0/255, 0/255)


    -- boolean variables stating whether or not the answer was touched
    correctAnswerAlreadyTouched = false
    alternateAnswer1AlreadyTouched = false
    alternateAnswer2AlreadyTouched = false
    alternateAnswer3AlreadyTouched = false

    -- set the x positions of each of the answer boxes
    correctAnswerPreviousX = display.contentWidth * 0.9
    alternateAnswer1PreviousX = display.contentWidth * 0.9
    alternateAnswer2PreviousX = display.contentWidth * 0.9
    alternateAnswer3PreviousX = display.contentWidth * 0.9


    -- the black box where the user will drag the answer
    userAnswerPlaceholder = display.newImageRect("Images/userAnswerBoxPlaceholder.png",  200, 130)
    userAnswerPlaceholder.x = display.contentWidth * 0.6
    userAnswerPlaceholder.y = display.contentHeight * 0.9

    userAnswerPlaceholder.isVisible = true

    correctAnswer = display.newText( "", 10, 10, nil, 50)
 

    alternateAnswer1 = display.newText( "", 10, 10, nil, 50)

    alternateAnswer2 = display.newText( "", 10, 10, nil, 50)


    alternateAnswer3 = display.newText( "", 10, 10, nil, 50)


    correctAnswer:setTextColor(0/255, 0/255, 0/255)
    alternateAnswer1:setTextColor(0/255, 0/255, 0/255)
    alternateAnswer2:setTextColor(0/255, 0/255, 0/255)
    alternateAnswer3:setTextColor(0/255, 0/255, 0/255)



    ----------------------------------------------------------------------------------
    --adding objects to the scene group
    ----------------------------------------------------------------------------------

    sceneGroup:insert( bkg_image ) 
    sceneGroup:insert( life1 )
    sceneGroup:insert( life2 )
    sceneGroup:insert( life3 )
    sceneGroup:insert( circle )
    sceneGroup:insert( rectangle )
    sceneGroup:insert( triangle )
    sceneGroup:insert( diamond )
    sceneGroup:insert( star )
    sceneGroup:insert( hexagon )
    sceneGroup:insert( pentagon )
    sceneGroup:insert( oval )
    sceneGroup:insert( octagon )
    sceneGroup:insert( square )
    sceneGroup:insert( correctAnswer )
    sceneGroup:insert( alternateAnswer1 )
    sceneGroup:insert( alternateAnswer2 )
    sceneGroup:insert( alternateAnswer3 )
    sceneGroup:insert( userAnswerPlaceholder )
    sceneGroup:insert( question )
    
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

    elseif ( phase == "did" ) then

        -- Called when the scene is now on screen.
        -- Insert code here to make the scene come alive.
        -- Example: start timers, begin animation, play audio, etc.
        RestartLevel2()
        AddTouchListeners() 

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
        

    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen.
        audio.stop()
        RemoveTouchListeners()
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
end

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