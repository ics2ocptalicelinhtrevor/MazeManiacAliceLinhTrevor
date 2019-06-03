-----------------------------------------------------------------------------------------
--
-- level2_screen.lua
-- Created by: alice 
-- Date: May 6th
-- Description: This is the level 1 screen of the game.
-- Date: May 6th, 2019
-- Description: This is the level 1 screen of the game. Everytime lion touches a 
-- question mark, it asks a math question. If the timer runs out, you lose a life
-- To win, you must answer 5 math questions. 
-----------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-----------------------------------------------------------------------------------------
-- INITIALIZATIONS
-----------------------------------------------------------------------------------------

-- Use Composer Libraries
local composer = require( "composer" )
local widget = require( "widget" )
local physics = require("physics")
local joystick = require( "joystick" )
-----------------------------------------------------------------------------------------

-- Naming Scene
sceneName = "level2_screen"

-----------------------------------------------------------------------------------------

-- Creating Scene Object
local scene = composer.newScene( sceneName )

-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------

-- The local variables for this scene

local analogStick
local facingWhichDirection = "right"
local joystickPressed = false

local bkg_image

local wall1
local wall2
local wall3
local wall4 
local wall5 
local wall6
local wall7 
local wall8
local wall9 
local wall10
local wall11
local wall12
local wall13

local door
local character

local heart1
local heart2
local heart3

-- character movement
local motionx = 0

local leftW 
local topW
local rightW
local floor

local questionMark1
local questionMark2
local questionMark3
local questionMark4
local questionMark5
local theQuestion

local questionsAnswered = 0

local muteButton
local unmuteButton

------------------------------------------------------------------------------------------
-- SOUNDS
------------------------------------------------------------------------------------------

-- background music 
local mainMenu = audio.loadSound("Sounds/bkgMusic.mp3")
local mainMenuChannel

-----------------------------------------------------------------------------------------
-- GLOBAL VARIABLES
-----------------------------------------------------------------------------------------

-- set the boolean variable to be true
soundOn = true

-- Number of lives
numLives = 3

-----------------------------------------------------------------------------------------
-- LOCAL SCENE FUNCTIONS
----------------------------------------------------------------------------------------- 
 
-- Creating a function which limits the characters' movement to the visible screen
local function ScreenLimit( character )   

    -- Checking if the the character is about to go off the right side of the screen
    if character.x > ( display.contentWidth - character.width / 2 ) then
            
        character.x = character.x - 7.5

    -- Checking if the character is about to go off the left side of the screen
    elseif character.x < ( character.width / 2 ) then

        character.x = character.x + 7.5

    -----------------------------------------------------------------------------------------

    -- Checking if the character is about to go off the bottom of the screen
    elseif character.y > ( display.contentHeight - character.height / 2 ) then

        character.y = character.y - 7.5

    -- Checking if the character is about to off the top of the screen
    elseif character.y < ( character.height / 2 ) then

        character.y = character.y + 7.5

    end
end
 
local function RuntimeEvents( )

        -- Retrieving the properties of the joystick
        angle = analogStick:getAngle()
        distance = analogStick:getDistance() -- Distance from the center of the joystick background
        direction = analogStick.getDirection()

        -----------------------------------------------------------------------------------------

        -- Checking if the joystick is being held
        if joystickPressed == true then

            -- Applying the force of the joystick to move the character
            analogStick:move( character, 0.75)

        end

        -----------------------------------------------------------------------------------------

        -- Limiting each character's movement to the edge of the screen
        ScreenLimit( character )

        -----------------------------------------------------------------------------------------

        -- Checking if the joystick is pointing the opposite direction of the character
        if facingWhichDirection == "left" then
            
            -- Checking if the joystick is pointing to the right
            if direction == 1 or direction == 2 or direction == 8 then

                -- Flipping the controlled charcter's direction
               -- character:scale( -1, 1 )

                -- Setting the status of the character's directions
                facingWhichDirection = "right"

            end
        end

        -----------------------------------------------------------------------------------------

        -- Checking if the joystick is pointing the opposite direction of the character
        if facingWhichDirection == "right" then


            -- Checking if the joystick is pointing to the right
            if direction == 4 or direction == 5 or direction == 6 then

                -- Flipping the controlled charcter's direction
                --flower:scale( -1, 1 )

                -- Setting the status of the character's directions
                facingWhichDirection = "left"

            end

        end
-----------------------------------------------------------------------------------------
end -- local function RuntimeEvents( )

-- Creating Joystick function that determines whether or not joystick is pressed
local function Movement( touch )

    if touch.phase == "began" then
        -- Setting a boolean to true to simulate the holding of a button
        joystickPressed = true

    elseif touch.phase == "ended" then
        -- Setting a boolean to false to simulate the release of a held button
        joystickPressed = false
    end

end --local function Movement( touch )

-- Move character horizontally
local function movePlayer (event)
    character.x = character.x + motionx
end
 
-- Stop character movement when no arrow is pushed
local function stop (event)

    if (event.phase =="ended") then
        motionx = 0
    end

end


local function AddRuntimeListeners()
    Runtime:addEventListener("enterFrame", movePlayer)
    Runtime:addEventListener("touch", stop )
end

local function RemoveRuntimeListeners()
    Runtime:removeEventListener("enterFrame", movePlayer)
    Runtime:removeEventListener("touch", stop )
end

local function ReplaceCharacter()
    character = display.newImageRect("Images/lion.png", 150, 150)
    character.x = 50
    character.y = 200
    character.width = 100
    character.height = 100
    character.myName = "lion"

    -- intialize horizontal movement of character
    motionx = 0

    -- add physics body
    physics.addBody( character, "dynamic" )
    -- prevent character from being able to tip over
    character.isFixedRotation = true

    -- add back runtime listeners
    AddRuntimeListeners()
end

local function MakeQuestionMarkVisible()
    questionMark1.isVisible = true
    questionMark2.isVisible = true
    questionMark3.isVisible = true
    questionMark4.isVisible = true
    questionMark5.isVisible = true
end

local function MakeHeartsVisible()
    heart1.isVisible = true
    heart2.isVisible = true
    heart3.isVisible = true
end

local function YouLoseTransition()
    composer.gotoScene( "you_lose2" )
end

local function YouWinTransition()
    composer.gotoScene( "you_win2" )
end

local function onCollision( self, event )
    -- for testing purposes
    --print( event.target )        --the first object in the collision
    --print( event.other )         --the second object in the collision
    --print( event.selfElement )   --the element (number) of the first object which was hit in the collision
    --print( event.otherElement )  --the element (number) of the second object which was hit in the collision
    --print( event.target.myName .. ": collision began with " .. event.other.myName )


    if  (event.target.myName == "questionMark1") or
        (event.target.myName == "questionMark2") or
        (event.target.myName == "questionMark3") or
        (event.target.myName == "questionMark4") or
        (event.target.myName == "questionMark5") then

        -- get the question mark that the user hit
        theQuestion = event.target

        -- stop the character from moving
        motionx = 0

        -- make the character invisible
        character.isVisible = false

        -- show overlay with math question
        composer.showOverlay( "level2_question", { isModal = true, effect = "fade", time = 100})

        -- Increment questions answered
        questionsAnswered = questionsAnswered + 1
    end

    if (event.target.myName == "door") then
        --check to see if the user has answered 5 questions
        if (questionsAnswered == 5) then
        -- after getting 3 questions right, go to the you win screen
        YouWinTransition()

        end
    end       
end


local function AddCollisionListeners()

    -- if character collides with question mark, onCollision will be called    
    questionMark1.collision = onCollision
    questionMark1:addEventListener( "collision" )
    questionMark2.collision = onCollision
    questionMark2:addEventListener( "collision" )
    questionMark3.collision = onCollision
    questionMark3:addEventListener( "collision" )
    questionMark4.collision = onCollision
    questionMark4:addEventListener( "collision" )
    questionMark5.collision = onCollision
    questionMark5:addEventListener( "collision" )


    door.collision = onCollision
    door:addEventListener( "collision" )
end

local function RemoveCollisionListeners()
    questionMark1:removeEventListener( "collision" )
    questionMark2:removeEventListener( "collision" )
    questionMark3:removeEventListener( "collision" )
    questionMark4:removeEventListener( "collision" )
    questionMark5:removeEventListener( "collision" )
    door:removeEventListener( "collision")

end

local function AddPhysicsBodies()
    --add to the physics engine

    physics.addBody(wall1, "static", {friction = 0})
    physics.addBody(wall2, "static", {friction = 0})
    physics.addBody(wall3, "static", {friction = 0})
    physics.addBody(wall4, "static", {friction = 0})
    physics.addBody(wall5, "static", {friction = 0})
    physics.addBody(wall6, "static", {friction = 0})
    physics.addBody(wall7, "static", {friction = 0})
    physics.addBody(wall8, "static", {friction = 0})
    physics.addBody(wall9, "static", {friction = 0})
    physics.addBody(wall10, "static", {friction = 0})
    physics.addBody(wall11, "static", {friction = 0})
    physics.addBody(wall12, "static", {friction = 0})
    physics.addBody(wall13, "static", {friction = 0})

    physics.addBody(leftW, "static", {friction = 0})
    physics.addBody(topW, "static", {friction = 0})
    physics.addBody(floor, "static", {friction = 0})
    physics.addBody(rightW, "static", {friction = 0})

    physics.addBody(questionMark1, "static",  {density=0, friction=0, bounce=0} )
    physics.addBody(questionMark2, "static",  {density=0, friction=0, bounce=0} )
    physics.addBody(questionMark3, "static",  {density=0, friction=0, bounce=0} )
    physics.addBody(questionMark4, "static",  {density=0, friction=0, bounce=0} )
    physics.addBody(questionMark5, "static",  {density=0, friction=0, bounce=0} )
    physics.addBody(door, "static", {density=0, friction=0.0 } )

end

local function RemovePhysicsBodies()

    physics.removeBody(wall1)
    physics.removeBody(wall2)
    physics.removeBody(wall3)
    physics.removeBody(wall4)
    physics.removeBody(wall5)
    physics.removeBody(wall6)
    physics.removeBody(wall7)
    physics.removeBody(wall8)
    physics.removeBody(wall9)
    physics.removeBody(wall10)
    physics.removeBody(wall11)
    physics.removeBody(wall12)
    physics.removeBody(wall13)

    physics.removeBody(leftW)
    physics.removeBody(topW)
    physics.removeBody(floor)

end

-----------------------------------------------------------------------------------------

local function Mute(touch)
    if (touch.phase == "ended") then
        -- pause the sound
        audio.pause(mainMenu)
        -- set the boolean variable to be false
        soundOn = false
        -- hide the mute button
        muteButton.isVisible = false
        -- make the unmute button visible
        unmuteButton.isVisible = true
    end
end

-----------------------------------------------------------------------------------------

local function Unmute(touch)
    if (touch.phase == "ended") then
        -- play the sound
        mainMenuChannel = audio.play(mainMenu)
        -- set the boolean variable to be false
        soundOn = true
        -- hide the mute button
        muteButton.isVisible = true
        -- make the unmute button visible
        unmuteButton.isVisible = false
    end
end

local function UpdatingLives()

    if (numLives == 3) then
        heart1.isVisible = true
        heart2.isVisible = true
        heart3.isVisible = true
    elseif (numLives == 2) then
        heart3.isVisible = false
    elseif (numLives == 1) then
        heart2.isVisible = false
    elseif (numLives == 0) then
        heart1.isVisible = false
        YouLoseTransition()
    end
end

-----------------------------------------------------------------------------------------
-- GLOBAL FUNCTIONS
-----------------------------------------------------------------------------------------

function ResumeLevel1()

    -- make character visible again
    character.isVisible = true

    -- Updating the lives
    UpdatingLives()

    if (questionsAnswered > 0) then
        if (theQuestion ~= nil) and (theQuestion.isBodyActive == true) then
            physics.removeBody(theQuestion)
            theQuestion.isVisible = false
        end
    end

end

-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------

-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -- Insert the background image
    bkg_image = display.newImageRect("Images/Level2Screen1AliceR@2x.png", display.contentWidth, display.contentHeight)
    bkg_image.x = display.contentWidth / 2 
    bkg_image.y = display.contentHeight / 2

    -- Insert background image into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( bkg_image )   
    -- Walls
    wall1 = display.newRect(0, 0,display.contentWidth, 20)
    wall1.x = display.contentCenterX
    wall1.y = 0
    wall1:setFillColor(0, 0, 0)
    wall1:toFront()
    
    wall2 = display.newRect(0, 0,display.contentWidth, 20)
    wall2.x = display.contentCenterX
    wall2.y = display.contentHeight
    wall2:setFillColor(0, 0, 0)
    wall2:toFront()
    
    wall3 = display.newRect(0, 0, 20, display.contentHeight)
    wall3.x = display.contentWidth
    wall3.y = display.contentCenterY
    wall3:setFillColor(0, 0, 0)
    wall3:toFront()
    
    wall4 = display.newRect(0, 0, 20, display.contentHeight)
    wall4.x = 0
    wall4.y = display.contentCenterY
    wall4:setFillColor(0, 0, 0)
    wall4:toFront()

    wall5 = display.newRect(0, 0, 10, display.contentHeight - 150)
    wall5.x = 150
    wall5.y = display.contentCenterY - 75
    wall5:setFillColor(0, 0, 0)
    wall5:toFront()
    
    wall6 = display.newRect(0, 0, 10, display.contentHeight - 150)
    wall6.x = 600
    wall6.y = 650
    wall6:setFillColor(0, 0, 0)
    wall6:toFront()
    wall6.rotation = 90
    

    wall7 = display.newRect(0, 0, 10, display.contentHeight - 150)
    wall7.x = 300
    wall7.y = 100
    wall7:setFillColor(0, 0, 0)
    wall7:toFront()
    

    wall8 = display.newRect(0, 0, 10, display.contentHeight - 281)
    wall8.x = 450
    wall8.y = 405
    wall8:setFillColor(0, 0, 0)
    wall8:toFront()
    
    wall9 = display.newRect(0, 0, 150, 10)
    wall9.x = 520
    wall9.y = 167
    wall9:setFillColor(0, 0, 0)
    wall9:toFront()

    wall10 = display.newRect(0, 0, 10, display.contentHeight - 500)
    wall10.x = 890
    wall10.y = 280
    wall10:setFillColor(0, 0, 0)
    wall10:toFront()

    wall11 = display.newRect(0, 0, 10, display.contentHeight - 400)
    wall11.x = 600
    wall11.y = 346
    wall11:setFillColor(0, 0, 0)
    wall11:toFront()

    wall12 = display.newRect(0, 0, 150, 10)
    wall12.x = 670
    wall12.y = 530
    wall12:setFillColor(0, 0, 0)
    wall12:toFront()

    wall13 = display.newRect(0, 0, 10, display.contentHeight - 395)
    wall13.x = 750
    wall13.y = 348
    wall13:setFillColor(0, 0, 0)
    wall13:toFront()

    wall14 = display.newRect(0, 0, 10, display.contentHeight - 890)
    wall14.x = 904
    wall14.y = 710
    wall14:setFillColor(0, 0, 0)
    wall14:toFront()    

    -- Creating Joystick
    analogStick = joystick.new( 50, 75 ) 

    -- Setting Position
    analogStick.x = 900
    analogStick.y = display.contentHeight - 125

    -- Changing transparency
    analogStick.alpha = 0.5

    -- Insert the Door
    door = display.newImage("Images/Level-1Door.png", 200, 200)
    door.x = 955
    door.y = 70
    door.myName = "door"
    door:scale( 0.6, 0.6 )

    -- Insert the Hearts
    heart1 = display.newImageRect("Images/heart.png", 80, 80)
    heart1.x = 60
    heart1.y = 60
    heart1.isVisible = true

    heart2 = display.newImageRect("Images/heart.png", 80, 80)
    heart2.x = 150
    heart2.y = 60
    heart2.isVisible = true

    heart3 = display.newImageRect("Images/heart.png", 80, 80)
    heart3.x = 240
    heart3.y = 60
    heart3.isVisible = true

    -- Walls outside of screen
    leftW = display.newLine( 0, 0, 0, display.contentHeight)
    leftW.isVisible = true

    rightW = display.newLine( 0, 0, 0, display.contentHeight)
    rightW.x = display.contentCenterX * 2
    rightW.isVisible = true

    topW = display.newLine( 0, 0, display.contentWidth, 0)
    topW.isVisible = true

    floor = display.newImageRect("Images/Level-1Floor.png", 1024, 100)
    floor.x = display.contentCenterX
    floor.y = display.contentHeight * 1.06

    --questionMark1
    questionMark1 = display.newImageRect ("Images/mark.png", 70, 70)
    questionMark1.x = 250
    questionMark1.y = 700
    questionMark1.myName = "questionMark1"

    --questionMark2
    questionMark2 = display.newImageRect ("Images/mark.png", 70, 70)
    questionMark2.x = 380
    questionMark2.y = 450
    questionMark2.myName = "questionMark2"

    --questionMark3
    questionMark3 = display.newImageRect ("Images/mark.png", 70, 70)
    questionMark3.x = 500
    questionMark3.y = 100
    questionMark3.myName = "questionMark3"

    --questionMark4
    questionMark4 = display.newImageRect ("Images/mark.png", 70, 70)
    questionMark4.x = 800
    questionMark4.y = 530
    questionMark4.myName = "questionMark4"

    -- Insert objects into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( questionMark4 )
    --questionMark5
    questionMark5 = display.newImageRect ("Images/mark.png", 70, 70)
    questionMark5.x = 950
    questionMark5.y = 200
    questionMark5.myName = "questionMark5"

    -- mute button
    muteButton = display.newImageRect("Images/Mute Button Unpressed.png", 100, 100)
    muteButton.x = 340
    muteButton.y = 60
    muteButton.isVisible = true

    -- unmute button
    unmuteButton = display.newImageRect("Images/Mute Button Pressed.png", 100, 100)
    unmuteButton.x = 340
    unmuteButton.y = 60
    unmuteButton.isVisible = false

    sceneGroup:insert( analogStick )
    sceneGroup:insert( wall1 )
    sceneGroup:insert( wall2 )
    sceneGroup:insert( wall3 )
    sceneGroup:insert( wall4 )
    sceneGroup:insert( wall5 )
    sceneGroup:insert( wall6 )
    sceneGroup:insert( wall7 )
    sceneGroup:insert( wall8 )
    sceneGroup:insert( wall9 )
    sceneGroup:insert( wall10 )
    sceneGroup:insert( wall11 )
    sceneGroup:insert( wall12 )
    sceneGroup:insert( wall13 )
    sceneGroup:insert( door )
    sceneGroup:insert( heart1 )
    sceneGroup:insert( heart2 )
    sceneGroup:insert( heart3 )
    sceneGroup:insert( leftW )
    sceneGroup:insert( rightW )
    sceneGroup:insert( topW )
    sceneGroup:insert( floor )
    sceneGroup:insert( questionMark1 )
    sceneGroup:insert( questionMark2 )
    sceneGroup:insert( questionMark3 )
    sceneGroup:insert( questionMark5 )
    sceneGroup:insert( muteButton )
    sceneGroup:insert( unmuteButton )

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
        -- start physics
        physics.start()

        -- set gravity
        physics.setGravity( 0, 0 )

    elseif ( phase == "did" ) then

        -- Called when the scene is now on screen.
        -- Insert code here to make the scene come alive.
        -- Example: start timers, begin animation, play audio, etc.

        -- Play the background music for this scene
        mainMenuChannel = audio.play(mainMenu)

        -- display the mute button at the start, so it doesn't overlap when it's muted
        muteButton.isVisible = true
        unmuteButton.isVisible = false

        -- lower the volume
        audio.setVolume(0.5, { channel=1, loops=-1 } )

        -- mute button
        muteButton:addEventListener("touch", Mute)

        -- unmute button
        unmuteButton:addEventListener("touch", Unmute)

        -- number of lives and questions answered
        numLives = 3
        questionsAnswered = 0

        -- make all question mark visible
        MakeQuestionMarkVisible()

        -- make all lives visible
        MakeHeartsVisible()

        -- add physics bodies to each object
        AddPhysicsBodies()

        -- add collision listeners to objects
        AddCollisionListeners()

        -- create the character, add physics bodies and runtime listeners
        ReplaceCharacter()

        -- activate the joystick
        AddPhysicsBodies()
        analogStick:activate()

        -----------------------------------------------------------------------------------------
        -- EVENT LISTENERS
        -----------------------------------------------------------------------------------------
        
        -- Listening for the usage of the joystick
        analogStick:addEventListener( "touch", Movement )
        Runtime:addEventListener("enterFrame", RuntimeEvents)

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
        audio.stop(mainMenuChannel)
    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen.

        -- remove event listener from mute and unmute button
        muteButton:removeEventListener("touch", Mute)
        unmuteButton:removeEventListener("touch", Unmute)

        RemoveCollisionListeners()
        RemovePhysicsBodies()

        -- Deactivating the Analog Stick
        analogStick:deactivate()

        -- Stopping the Runtime Events
        Runtime:removeEventListener( "enterFrame", RuntimeEvents )

        -- Removing the listener which listens for the usage of the joystick
        analogStick:removeEventListener( "touch", Movement )

        physics.stop()
        RemoveRuntimeListeners()
        display.remove(character)
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