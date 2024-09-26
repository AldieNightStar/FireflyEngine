package haxidenti.firefly.project

import haxidenti.firefly.love.Love

object Project {
    fun createProject() {
        ProjectFiles.generateIncludeFile()
        ProjectFiles.generateMainFile()
    }

    fun runProject() {
        ProjectFiles.generateIncludeFile()
        ProjectFiles.generateMainFile()
        Love.run(ProjectFiles.projectFolder) { println(it) }
    }
}