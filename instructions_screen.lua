-----------------------------------------------------------------------------------------
-- instructions_screen.lua
-- Created by: Linh Ho
-- Special thanks to Wal Wal for helping in the design of this framework.
-- Date: February 19th, 2019
-- Description: This is the instructions page, displaying a back button to the main menu.
-----------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-----------------------------------------------------------------------------------------
-- INITIALIZATIONS
-----------------------------------------------------------------------------------------

-- Use Composer Libraries
local composer = require( "composer" )
local widget = require( "widget" )

-----------------------------------------------------------------------------------------

-- Naming Scene
sceneName = "instructions_screen"

-- Creating Scene Object
scene = composer.newScene( sceneName ) -- This function doesn't accept a string, only a variable containing a string

-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------

local level1Button
local level2Button
local level3Button

local bkg_image
local backButton

------------------------------------------------------------------------------------------
-- SOUNDS
------------------------------------------------------------------------------------------

-- background music 
local instructionScreen = audio.loadSound("Sounds/instructionScreen.mp3")
local instructionScreenChannel

-----------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------

-- Creating Transition to Level1 Instructions Screen
local function Level1ScreenTransition( )
    composer.gotoScene( "instructions1", {effect = "zoomInOutFade", time = 500})
end    

-----------------------------------------------------------------------------------------

-- Creating Transition Function to Level2 Instructions Screen
local function Level2ScreenTransition( )       
    composer.gotoScene( "instructions2", {effect = "slideRight", time = 500})
end 

-----------------------------------------------------------------------------------------

-- Creating Transition to Level3 Instructions Screen
 
 local function Level3ScreenTransition( )
    composer.gotoScene( "instructions3", {effect = "slideLeft", time = 500})
end  

------------------------------------------------------------------------------------------

-- Creating Transitioning Function back to main menu
local function BackTransition( )
    composer.gotoScene( "main_menu", {effect = "slideRight", time = 500})
end

-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------

-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -- Insert the background image and set it to the center of the screen
    bkg_image = display.newImage("Images/InstructionsSelect.png")
    bkg_image.x = display.contentCenterX
    bkg_image.y = display.contentCenterY
    bkg_image.width = display.contentWidth
    bkg_image.height = display.contentHeight


    -- Associating display objects with this scene 
    sceneGroup:insert( bkg_image )

    -- Send the background image to the back layer so all other objects can be on top
    bkg_image:toBack()


    -----------------------------------------------------------------------------------------
    -- BUTTON WIDGETS
    -----------------------------------------------------------------------------------------

    -- Creating Back Button
    backButton = widget.newButton( 
    {
        -- Setting Position
        x = 100,
        y = 700,

        -- Setting Dimensions
        width = 200,
        height = 100,

        -- Setting Visual Properties
        defaultFile = "Images/BackButtonUnpressedLinhH.png",
        overFile = "Images/BackButtonPressedLinhH.png",

        -- Setting Functional Properties
        onRelease = BackTransition

    } )

    -----------------------------------------------------------------------------------------

    -- Creating level1 Button
    level1Button = widget.newButton( 
        {   
            -- Set its position on the screen relative to the screen size
            x = 200,

            y = 400,

            width = 200,
            height = 100,

            -- Insert the images here
            defaultFile = "Images/level1UnpressedLinhH@2x.png",
            overFile = "Images/level1PressedLinhH@2x.png",

            -- When the button is released, call the Level1 screen transition function
            onRelease = Level1ScreenTransition
                      
        } )

    -- Creating level2 Button
    level2Button = widget.newButton( 
        {
            -- Set its position on the screen relative to the screen size
            x = 500,
            y = 400,

            width = 200,
            height = 100,
            
            -- Insert the images here
            defaultFile = "Images/level2UnpressedLinhH@2x.png",
            overFile = "Images/level2PressedLinhH@2x.png",

            -- When the button is released, call the Credits transition function
            onRelease = Level2ScreenTransition
        } ) 

    -- Creating level3 button
    level3Button = widget.newButton( 
        {
            -- Set its position on the screen relative to the screen size
            x = 800,
            y = 400,

            width = 200,
            height = 100,

            -- Insert images here
            defaultFile = "Images/level3UnpressedLinhH@2x.png",
            overFile = "Images/level3PressedLinhH@2x.png",

            -- When the button is released, call the Instructions transition function
            onRelease = Level3ScreenTransition
        } ) 

    -- Associating Buttons with this scene
    sceneGroup:insert( level1Button )
    sceneGroup:insert( level2Button )
    sceneGroup:insert( level3Button )
    sceneGroup:insert( backButton )
    
end -- function scene:create( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to appear on screen
function scene:show( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------

    local phase = event.phase

    -----------------------------------------------------------------------------------------

    if ( phase == "will" ) then
        -- Called when the scene is still off screen (but is about to come on screen).

    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        -- Called when the scene is now on screen.
        -- Insert code here to make the scene come alive.
        -- Example: start timers, begin animation, play audio, etc.
        -- Play background music
        instructionScreenChannel = audio.play(instructionScreen)
        -- set volume, repeat in channel, and infinite loop
        audio.setVolume(0.5, { channel=1, loops=-1 } )
    end

end -- function scene:show( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to leave the screen
function scene:hide( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------

    local phase = event.phase

    -----------------------------------------------------------------------------------------

    if ( phase == "will" ) then
        -- Called when the scene is on screen (but is about to go off screen).
        -- Insert code here to "pause" the scene.
        -- Example: stop timers, stop animation, stop audio, etc.
        audio.stop(instructionScreenChannel)
    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen.
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

end --function scene:destroy( event )

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


