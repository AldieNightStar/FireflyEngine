package haxidenti.firefly.util

import java.io.File

fun getJarFolder(): File {
    val dir = File(object {}::class.java.protectionDomain.codeSource.location.toURI()).parentFile
    // If latest folders is:
    //     build/classes/kotlin
    //     build/classes/java
    // Then we will take it project path
    if (dir.name == "kotlin" || dir.name == "java") {
        val locationFolder = dir.parentFile
        if (locationFolder.name == "classes") {
            if (locationFolder.parentFile.name == "build") {
                return locationFolder.parentFile.parentFile
            }
        }
    }
    return dir
}