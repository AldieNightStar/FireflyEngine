package haxidenti.firefly.project

import haxidenti.firefly.love.Love

object Project {
    fun newProject() {
        ProjectFiles.generateIncludeFile(false)
        ProjectFiles.generateMainFile()
        ProjectFiles.createFolderStructure()
        ProjectFiles.generateGitIgnore()
    }

    fun runProject() {
        ProjectFiles.generateIncludeFile(false)
        Love.run(ProjectFiles.projectFolder) { println(it) }
        ProjectFiles.createFolderStructure()
    }

    fun releaseProject() {
        ProjectFiles.packEngineFiles()
    }
}