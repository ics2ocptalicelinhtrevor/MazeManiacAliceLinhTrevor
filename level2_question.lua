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

local questionText

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
local X1 = display.contentWidth*2/7
local X2 = display.contentWidth*4/7
local Y1 = display.contentHeight*1/2
local Y2 = display.contentHeight*5.5/7  

-- Variables containing the user answer and the actual answer
local userAnswer

-- boolean variables telling me which answer box was touched
local answerboxAlreadyTouched = false
local alternateAnswerBox1AlreadyTouched = false
local alternateAnswerBox2AlreadyTouched = false
local alternateAnswerBox3AlreadyTouched = false

--create textboxes holding answer and alternate answers 
local answerbox
local alternateAnswerBox1
local alternateAnswerBox2
local alternateAnswerBox3

-- create variables that will hold the previous x- and y-positions so that 
-- each answer will return back to its previous position after it is moved
local answerboxPreviousY
local alternateAnswerBox1PreviousY
local alternateAnswerBox2PreviousY
local alternateAnswerBox3PreviousY

local answerboxPreviousX
local alternateAnswerBox1PreviousX
local alternateAnswerBox2PreviousX
local alternateAnswerBox3PreviousX

-- the black box where the user will drag the answer
local userAnswerBoxPlaceholder

-- sound effects
local correctSound
local booSound

-----------------------------------------------------------------------------------------
-- SOUNDS
-----------------------------------------------------------------------------------------


-----------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------

local function DisplayQuestion()


    -- put the correct answer into the answerbox
    answerbox.text = correctAnswer

    -- make it possible to click on the answers again
    answerboxAlreadyTouched = false
    alternateAnswerBox1AlreadyTouched = false
    alternateAnswerBox2AlreadyTouched = false
    alternateAnswerBox3AlreadyTouched = false

-- RESET ALL X POSITIONS OF ANSWER BOXES 
    answerbox.x = display.contentWidth * 0.9
    alternateAnswerBox1.x = display.contentWidth * 0.9
    alternateAnswerBox2.x = display.contentWidth * 0.9
    alternateAnswerBox3.x = display.contentWidth * 0.9

end

local function AskQuestion()
    -- create random questions
    questionText = math.random(1,10)

    if (questionText == 1) then

        question.text = "Name the shape."

        correctAnswer.text = "circle"
        alternateAnswer1.text = "triangle"
        alternateAnswer2.text = "square"
        alternateAnswer3.text = "rectangle"

        question.text = correctAnswer
        alternateAnswer1.text = alternateAnswer1
        alternateAnswer2.text = alternateAnswer2
        alternateAnswer3.text = alternateAnswer3

        circle.isVisible = true

    elseif (questionText == 2) then

        question.text = "Name the shape."

        correctAnswer.text = "triangle"
        alternateAnswer1.text = "circle"
        alternateAnswer2.text = "star"
        alternateAnswer3.text = "rectangle"

        question.text = correctAnswer
        alternateAnswer1.text = alternateAnswer1
        alternateAnswer2.text = alternateAnswer2
        alternateAnswer3.text = alternateAnswer3

        triangle.isVisible = true

    elseif (questionText == 3) then

        question.text = "Name the shape."

        correctAnswer.text = "rectangle"
        alternateAnswer1.text = "circle"
        alternateAnswer2.text = "star"
        alternateAnswer3.text = "oval"

        question.text = correctAnswer
        alternateAnswer1.text = alternateAnswer1
        alternateAnswer2.text = alternateAnswer2
        alternateAnswer3.text = alternateAnswer3

        rectangle.isVisible = true
       
    elseif (questionText == 4) then

        question.text = "Name the shape."

        correctAnswer.text = "square"
        alternateAnswer1.text = "diamond"
        alternateAnswer2.text = "star"
        alternateAnswer3.text = "rectangle"

        question.text = correctAnswer
        alternateAnswer1.text = alternateAnswer1
        alternateAnswer2.text = alternateAnswer2
        alternateAnswer3.text = alternateAnswer3

        square.isVisible = true

    elseif (questionText == 5) then

        question.text = "Name the shape."

        correctAnswer.text = "oval"
        alternateAnswer1.text = "triangle"
        alternateAnswer2.text = "circle"
        alternateAnswer3.text = "rectangle"

        question.text = correctAnswer
        alternateAnswer1.text = alternateAnswer1
        alternateAnswer2.text = alternateAnswer2
        alternateAnswer3.text = alternateAnswer3

        oval.isVisible = true

    elseif (questionText == 6) then

        question.text = "Name the shape."

        correctAnswer.text = "octagon"
        alternateAnswer1.text = "hexagon"
        alternateAnswer2.text = "circle"
        alternateAnswer3.text = "square"

        question.text = correctAnswer
        alternateAnswer1.text = alternateAnswer1
        alternateAnswer2.text = alternateAnswer2
        alternateAnswer3.text = alternateAnswer3

        octogon.isVisible = true

    elseif (questionText == 7) then

        question.text = "Name the shape."

        correctAnswer.text = "penatagon"
        alternateAnswer1.text = "octagon"
        alternateAnswer2.text = "star"
        alternateAnswer3.text = "square"

        question.text = correctAnswer
        alternateAnswer1.text = alternateAnswer1
        alternateAnswer2.text = alternateAnswer2
        alternateAnswer3.text = alternateAnswer3

        pentagon.isVisible = true

    elseif (questionText == 8) then

        question.text = "Name the shape."

        correctAnswer.text = "hexagon"
        alternateAnswer1.text = "pentagon"
        alternateAnswer2.text = "square"
        alternateAnswer3.text = "circle"

        question.text = correctAnswer
        alternateAnswer1.text = alternateAnswer1
        alternateAnswer2.text = alternateAnswer2
        alternateAnswer3.text = alternateAnswer3

        hexagon.isVisible = true

    elseif (questionText == 9) then

        question.text = "Name the shape."

        correctAnswer.text = "star"
        alternateAnswer1.text = "rectangle"
        alternateAnswer2.text = "circle"
        alternateAnswer3.text = "diamond"

        question.text = correctAnswer
        alternateAnswer1.text = alternateAnswer1
        alternateAnswer2.text = alternateAnswer2
        alternateAnswer3.text = alternateAnswer3

        circle.isVisible = true

    elseif (questionText == 10) then

        question.text = "Name the shape."

        correctAnswer.text = "diamond"
        alternateAnswer1.text = "hexagon"
        alternateAnswer2.text = "star"
        alternateAnswer3.text = "square"

        question.text = correctAnswer
        alternateAnswer1.text = alternateAnswer1
        alternateAnswer2.text = alternateAnswer2
        alternateAnswer3.text = alternateAnswer3
    end
end


local function PositionAnswers()

 --creating random start position in a cretain area
    answerPosition = math.random(1,4)

    if (answerPosition == 1) then

        correctAnswer.x = X1
        correctAnswer.y = Y1
        
        alternateAnswer1.x = X2
        alternateAnswer1.y = Y1
        
        alternateAnswer2.x = X1
        alternateAnswer2.y = Y2

        alternateAnswer3.x = X2
        alternateAnswer3.y = Y2

        
    elseif (answerPosition == 2) then

        correctAnswer.x = X2
        correctAnswer.y = Y1
        
        alternateAnswer1.x = X1
        alternateAnswer1.y = Y1
        
        alternateAnswer2.x = X1
        alternateAnswer2.y = Y2

        alternateAnswer3.x = X2
        alternateAnswer3.y = Y2

    elseif (answerPosition == 3) then

        correctAnswer.x = X1
        correctAnswer.y = Y2
        
        alternateAnswer1.x = X2
        alternateAnswer1.y = Y1
        
        alternateAnswer2.x = X2
        alternateAnswer2.y = Y2

        alternateAnswer3.x = X1
        alternateAnswer3.y = Y1 

    elseif (answerPosition == 4) then

        correctAnswer.x = X2
        correctAnswer.y = Y2
        
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
    DisplayQuestion()
    PositionAnswers()    
end

-- Function to Check User Input
local function CheckUserAnswerInput()
          
    timer.performWithDelay(1600, RestartLevel1) 
end

local function TouchListenerAnswerbox(touch)
    --only work if none of the other boxes have been touched
    if (alternateAnswerBox1AlreadyTouched == false) and 
        (alternateAnswerBox2AlreadyTouched == false) and
        (alternateAnswerBox3AlreadyTouched == false)  then

        if (touch.phase == "began") then

            --let other boxes know it has been clicked
            answerboxAlreadyTouched = true

        --drag the answer to follow the mouse
        elseif (touch.phase == "moved") then
            
            answerbox.x = touch.x
            answerbox.y = touch.y

        -- this occurs when they release the mouse
        elseif (touch.phase == "ended") then

            answerboxAlreadyTouched = false

              -- if the number is dragged into the userAnswerBox, place it in the center of it
            if (((userAnswerBoxPlaceholder.x - userAnswerBoxPlaceholder.width/2) < answerbox.x ) and
                ((userAnswerBoxPlaceholder.x + userAnswerBoxPlaceholder.width/2) > answerbox.x ) and 
                ((userAnswerBoxPlaceholder.y - userAnswerBoxPlaceholder.height/2) < answerbox.y ) and 
                ((userAnswerBoxPlaceholder.y + userAnswerBoxPlaceholder.height/2) > answerbox.y ) ) then

                -- setting the position of the number to be in the center of the box
                answerbox.x = userAnswerBoxPlaceholder.x
                answerbox.y = userAnswerBoxPlaceholder.y
                userAnswer = correctAnswer

                -- call the function to check if the user's input is correct or not
                CheckUserAnswerInput()

            --else make box go back to where it was
            else
                answerbox.x = answerboxPreviousX
                answerbox.y = answerboxPreviousY
            end
        end
    end                
end 

local function TouchListenerAnswerBox1(touch)
    --only work if none of the other boxes have been touched
    if (answerboxAlreadyTouched == false) and 
        (alternateAnswerBox2AlreadyTouched == false) then

        if (touch.phase == "began") then
            --let other boxes know it has been clicked
            alternateAnswerBox1AlreadyTouched = true
            
        --drag the answer to follow the mouse
        elseif (touch.phase == "moved") then
            alternateAnswerBox1.x = touch.x
            alternateAnswerBox1.y = touch.y

        elseif (touch.phase == "ended") then
            alternateAnswerBox1AlreadyTouched = false

            -- if the box is in the userAnswerBox Placeholder  go to center of placeholder
            if (((userAnswerBoxPlaceholder.x - userAnswerBoxPlaceholder.width/2) < alternateAnswerBox1.x ) and 
                ((userAnswerBoxPlaceholder.x + userAnswerBoxPlaceholder.width/2) > alternateAnswerBox1.x ) and 
                ((userAnswerBoxPlaceholder.y - userAnswerBoxPlaceholder.height/2) < alternateAnswerBox1.y ) and 
                ((userAnswerBoxPlaceholder.y + userAnswerBoxPlaceholder.height/2) > alternateAnswerBox1.y ) ) then

                alternateAnswerBox1.x = userAnswerBoxPlaceholder.x
                alternateAnswerBox1.y = userAnswerBoxPlaceholder.y

                userAnswer = alternateAnswer1

                -- call the function to check if the user's input is correct or not
                CheckUserAnswerInput()

            --else make box go back to where it was
            else
                alternateAnswerBox1.x = alternateAnswerBox1PreviousX
                alternateAnswerBox1.y = alternateAnswerBox1PreviousY
            end
        end
    end
end 

local function TouchListenerAnswerBox2(touch)
    --only work if none of the other boxes have been touched
    if (answerboxAlreadyTouched == false) and 
        (alternateAnswerBox1AlreadyTouched == false) then

        if (touch.phase == "began") then
            --let other boxes know it has been clicked
            alternateAnswerBox2AlreadyTouched = true
            
        elseif (touch.phase == "moved") then
            --dragging function
            alternateAnswerBox2.x = touch.x
            alternateAnswerBox2.y = touch.y

        elseif (touch.phase == "ended") then
            alternateAnswerBox2AlreadyTouched = false

            -- if the box is in the userAnswerBox Placeholder  go to center of placeholder
            if (((userAnswerBoxPlaceholder.x - userAnswerBoxPlaceholder.width/2) < alternateAnswerBox2.x ) and 
                ((userAnswerBoxPlaceholder.x + userAnswerBoxPlaceholder.width/2) > alternateAnswerBox2.x ) and 
                ((userAnswerBoxPlaceholder.y - userAnswerBoxPlaceholder.height/2) < alternateAnswerBox2.y ) and 
                ((userAnswerBoxPlaceholder.y + userAnswerBoxPlaceholder.height/2) > alternateAnswerBox2.y ) ) then

                alternateAnswerBox2.x = userAnswerBoxPlaceholder.x
                alternateAnswerBox2.y = userAnswerBoxPlaceholder.y
                userAnswer = alternateAnswer2

                -- call the function to check if the user's input is correct or not
                CheckUserAnswerInput()

            --else make box go back to where it was
            else
                alternateAnswerBox2.x = alternateAnswerBox2PreviousX
                alternateAnswerBox2.y = alternateAnswerBox2PreviousY
            end
        end
    end
end 

local function TouchListenerAnswerBox3(touch)
    --only work if none of the other boxes have been touched
    if (answerboxAlreadyTouched == false) and 
        (alternateAnswerBox1AlreadyTouched == false) then

        if (touch.phase == "began") then
            --let other boxes know it has been clicked
            alternateAnswerBox3AlreadyTouched = true
            
        elseif (touch.phase == "moved") then
            --dragging function
            alternateAnswerBox3.x = touch.x
            alternateAnswerBox3.y = touch.y

        elseif (touch.phase == "ended") then
            alternateAnswerBox3AlreadyTouched = false

            -- if the box is in the userAnswerBox Placeholder  go to center of placeholder
            if (((userAnswerBoxPlaceholder.x - userAnswerBoxPlaceholder.width/2) < alternateAnswerBox3.x ) and 
                ((userAnswerBoxPlaceholder.x + userAnswerBoxPlaceholder.width/2) > alternateAnswerBox3.x ) and 
                ((userAnswerBoxPlaceholder.y - userAnswerBoxPlaceholder.height/2) < alternateAnswerBox3.y ) and 
                ((userAnswerBoxPlaceholder.y + userAnswerBoxPlaceholder.height/2) > alternateAnswerBox3.y ) ) then

                alternateAnswerBox3.x = userAnswerBoxPlaceholder.x
                alternateAnswerBox3.y = userAnswerBoxPlaceholder.y
                userAnswer = alternateAnswer3

                -- call the function to check if the user's input is correct or not
                CheckUserAnswerInput()

            --else make box go back to where it was
            else
                alternateAnswerBox3.x = alternateAnswerBox3PreviousX
                alternateAnswerBox3.y = alternateAnswerBox3PreviousY
            end
        end
    end
end 

-- Function that Adds Listeners to each answer box
local function AddAnswerBoxEventListeners()
    answerbox:addEventListener("touch", TouchListenerAnswerbox)
    alternateAnswerBox1:addEventListener("touch", TouchListenerAnswerBox1)
    alternateAnswerBox2:addEventListener("touch", TouchListenerAnswerBox2)
    alternateAnswerBox3:addEventListener("touch", TouchListenerAnswerBox3)
end 

-- Function that Removes Listeners to each answer box
local function RemoveAnswerBoxEventListeners()
    answerbox:removeEventListener("touch", TouchListenerAnswerbox)
    alternateAnswerBox1:removeEventListener("touch", TouchListenerAnswerBox1)
    alternateAnswerBox2:removeEventListener("touch", TouchListenerAnswerBox2)
    alternateAnswerBox3:removeEventListener("touch", TouchListenerAnswerBox3)
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
    bkg_image = display.newImageRect("Images/level2screen1AliceR@2x.png", 2048, 1536)
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

    oval = display.newImageRect("Images/ovalAliceR@2x.png", 100, 100)
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
    questionText = display.newText( "Drag the name onto the shape." , 0, 0, nil, 50)
    questionText.anchorX = 0
    questionText.anchorY = 0
    questionText.x = display.contentWidth *0.2
    questionText.y = display.contentHeight *0.3

    questionText:setTextColor(0/255, 0/255, 0/255)


    -- boolean variables stating whether or not the answer was touched
    answerboxAlreadyTouched = false
    alternateAnswerBox1AlreadyTouched = false
    alternateAnswerBox2AlreadyTouched = false
    alternateAnswerBox3AlreadyTouched = false

    --create answerbox alternate answers and the boxes to show them
    answerbox = display.newText("", display.contentWidth * 0.9, 0, nil, 100)
    alternateAnswerBox1 = display.newText("", display.contentWidth * 0.9, 0, nil, 100)
    alternateAnswerBox2 = display.newText("", display.contentWidth * 0.9, 0, nil, 100)
    alternateAnswerBox3 = display.newText("", display.contentWidth * 0.9, 0, nil, 100)

    -- set the x positions of each of the answer boxes
    answerboxPreviousX = display.contentWidth * 0.9
    alternateAnswerBox1PreviousX = display.contentWidth * 0.9
    alternateAnswerBox2PreviousX = display.contentWidth * 0.9
    alternateAnswerBox3PreviousX = display.contentWidth * 0.9


    -- the black box where the user will drag the answer
    userAnswerBoxPlaceholder = display.newImageRect("Images/userAnswerBoxPlaceholder.png",  130, 130, 0, 0)
    userAnswerBoxPlaceholder.x = display.contentWidth * 0.6
    userAnswerBoxPlaceholder.y = display.contentHeight * 0.9

    correctAnswer = display.newText( "Circle", 5, 10, nil, 50)
    correctAnswer.anchorX = 0
    correctAnswer.anchorY = 0
    alternateAnswer1 = display.newText( "Triangle", 5, 20, nil, 50)
    alternateAnswer1.anchorX = 0
    alternateAnswer1.anchorY = 0
    alternateAnswer2 = display.newText( "Rectangle", 5, 30, nil, 50)
    alternateAnswer2.anchorX = 0
    alternateAnswer2.anchorY = 0
    alternateAnswer3 = display.newText( "Square", 5, 40, nil, 50)
    alternateAnswer3.anchorX = 0
    alternateAnswer3.anchorY = 0

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
    sceneGroup:insert( userAnswerBoxPlaceholder )
    sceneGroup:insert( correctAnswer )
    sceneGroup:insert( alternateAnswer1 )
    sceneGroup:insert( alternateAnswer2 )
    sceneGroup:insert( alternateAnswer3 )
    sceneGroup:insert( questionText )
    sceneGroup:insert( alternateAnswerBox1 )
    sceneGroup:insert( alternateAnswer2 )



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
        AddAnswerBoxEventListeners() 

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
        RemoveAnswerBoxEventListeners()
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