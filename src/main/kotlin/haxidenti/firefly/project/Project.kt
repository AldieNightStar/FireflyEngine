package haxidenti.firefly.project

import haxidenti.firefly.love.Love

object Project {
    fun newProject() {
        ProjectGen.generateIncludeFile(false)
        ProjectGen.generateMainFile()
        ProjectGen.generateGitIgnore()
    }

    fun runProject() {
        ProjectGen.generateIncludeFile(false)
        Love.run(ProjectFiles.projectFolder) { println(it) }
    }

    fun releaseProject() {
        ProjectGen.packEngineFiles()
    }
}