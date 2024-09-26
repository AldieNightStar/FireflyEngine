package haxidenti.firefly.project

import haxidenti.firefly.love.Love

object Project {
    fun newProject() {
        ProjectGen.generateIncludeFile(false)
        ProjectGen.generateMainFile()
        ProjectGen.createFolderStructure()
        ProjectGen.generateGitIgnore()
    }

    fun runProject() {
        ProjectGen.generateIncludeFile(false)
        Love.run(ProjectFiles.projectFolder) { println(it) }
        ProjectGen.createFolderStructure()
    }

    fun releaseProject() {
        ProjectGen.packEngineFiles()
    }
}