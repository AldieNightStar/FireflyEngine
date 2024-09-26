package haxidenti.firefly.project

import java.io.File

object ProjectFiles {
    val projectFolder = File(".")

    // Files in project
    val includeFile = projectFolder.resolve("____.lua")
    val mainFile = projectFolder.resolve("main.lua")
    val outputDist = projectFolder.resolve("output.love")
    val gitIgnoreFile = projectFolder.resolve(".gitignore")

    // Folders in project
    val generateFilesFolder = projectFolder.resolve("gen")
}