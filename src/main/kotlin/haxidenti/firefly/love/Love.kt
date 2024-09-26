package haxidenti.firefly.love

import haxidenti.firefly.util.OS
import java.io.File

object Love {
    fun run(folder: File, output: (String) -> Unit) {
        if (OS.isWindows) {
            OS.runCmd("lovec", arrayOf("."), folder, output)
        } else if (OS.isUnix) {
            OS.runCmd("love", arrayOf("."), folder, output)
        }
    }
}