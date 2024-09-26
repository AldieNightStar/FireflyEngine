package haxidenti.firefly.util

import java.io.File

fun File.writeIfDiffers(src: String) {
    if (!this.isFile || this.readText() != src) {
        this.writeText(src)
    }
}