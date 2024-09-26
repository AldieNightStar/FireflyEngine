package haxidenti.firefly.love

import haxidenti.firefly.util.OS
import java.io.File

object Love {
    fun run(folder: File, output: (String) -> Unit) {
        OS.runCmd("love", arrayOf("."), folder, output)
    }
}