package haxidenti.firefly.util

import java.io.File
import java.time.LocalTime
import java.util.*

object OS {
    private val os = System.getProperty("os.name").lowercase(Locale.ROOT)

    val isWindows = os.contains("win")
    val isUnix = os.contains("nix") || os.contains("nux") || os.contains("mac")

    fun runCmd(
        name: String,
        args: Array<String>,
        workDir: File,
        output: (String) -> Unit,
    ) {
        val command = if (isWindows) {
            listOf("cmd", "/c", name, *args)
        } else if (isUnix) {
            listOf("/bin/bash", "-c", name, *args)
        } else {
            throw IllegalStateException("Unknown OS")
        }

        val processBuilder = ProcessBuilder()
            .command(command)
            .directory(workDir)

        val process = processBuilder.start()
        process.inputStream.reader().forEachLine(output)
        process.errorStream.reader().forEachLine(output)
        process.waitFor()
    }

    fun time(): String {
        return LocalTime.now().toString()
    }

    object Env {
        private val os = System.getenv()

        operator fun get(name: String) = os[name]
    }
}