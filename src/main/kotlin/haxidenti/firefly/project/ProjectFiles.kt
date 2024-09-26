package haxidenti.firefly.project

import haxidenti.firefly.engine.Engine
import haxidenti.firefly.util.writeIfDiffers
import java.io.File

object ProjectFiles {
    val projectFolder = File(".")

    // Files in project
    val includeFile = projectFolder.resolve("____.lua")
    val mainFile = projectFolder.resolve("main.lua")

    fun generateIncludeFile() {
        val engineFilesPath = Engine.engineLoveFolder.canonicalPath
            .replace("\\", "/") + "/?.lua"
        includeFile.writeIfDiffers(
            """
            -- Please do not edit this file. It will be generated every time engine is started
            -- When game will be released, then engine files will be included
            package.path = "$engineFilesPath" .. ";" .. package.path
            
            -- Include all the functionality
            require("firefly_engine")
            
             -- Please, add "init_firefly" at the very end of "main.lua"
             -- It will initialize everything
            """.trimIndent()
        )
    }

    fun generateMainFile() {
        mainFile.writeText("""
            -- Load engine
            require "${includeFile.nameWithoutExtension}"
            
            -- Main code
            function love.load()     end
            function love.draw()     end
            function love.update(dt) end
            
            -- Init Firefly
            init_firefly()
        """.trimIndent())
    }


}