package haxidenti.firefly.project

import haxidenti.firefly.love.Love

object Project {
    fun createProject() {
        ProjectFiles.generateIncludeFile()
        ProjectFiles.generateMainFile()
        ProjectFiles.createFolderStructure()
    }

    fun runProject() {
        ProjectFiles.generateIncludeFile()
        Love.run(ProjectFiles.projectFolder) { println(it) }
        ProjectFiles.createFolderStructure()
    }
}