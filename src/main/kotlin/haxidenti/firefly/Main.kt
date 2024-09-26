package haxidenti.firefly;

import haxidenti.firefly.project.Project

private val USAGE = """
    Usage:
        firefly command options...
        
        firefly new     - Create new project in current folder
    
        firefly run - Run the project
        firefly rel - Release the project
        firefly gen - Run code generator
""".trimIndent()

fun main(args: Array<String>) {
    when (args.firstOrNull() ?: "") {
        "new" -> Project.newProject()
        "run" -> Project.runProject()
        "rel" -> Project.releaseProject()
        "gen" -> println("IN TODO")
        else -> println(USAGE)
    }
}
