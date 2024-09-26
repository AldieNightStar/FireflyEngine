package haxidenti.firefly.util

import haxidenti.firefly.exception.CompileException
import java.io.File
import java.time.LocalTime
import java.util.*
import java.util.concurrent.TimeUnit

object OS {
    private val os = System.getProperty("os.name").lowercase(Locale.ROOT)

    val isWindows = os.contains("win")
    val isUnix = os.contains("nix") || os.contains("nux") || os.contains("mac")

    fun runCmd(
        name: String,
        args: Array<String>,
        workDir: File,
        output: (String) -> Unit,
        waitSec: Long = 45,
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
        if (!process.waitFor(waitSec, TimeUnit.SECONDS)) {
            throw CompileException("Command $name is not responding too long")
        }

        val exitCode = process.waitFor()
        if (exitCode != 0) {
            throw CompileException("Command $name ends with code : $exitCode")
        }
    }

    fun time(): String {
        return LocalTime.now().toString()
    }

    object Env {
        private val os = System.getenv()

        operator fun get(name: String) = os[name]
    }
}