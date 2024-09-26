package haxidenti.firefly;

import haxidenti.firefly.project.Project

private val USAGE = """
    Usage:
        firefly command options...
        
        firefly new     - Create new project in current folder
    
        firefly run     - Run the project
        firefly release - Release the project
        firefly gen     - Run code generator
""".trimIndent()

fun main(args: Array<String>) {
    when (args.firstOrNull() ?: "") {
        "new" -> Project.createProject()
        "run" -> Project.runProject()
        else -> println(USAGE)
    }
}
