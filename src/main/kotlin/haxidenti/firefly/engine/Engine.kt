package haxidenti.firefly.engine

import haxidenti.firefly.util.getJarFolder

object Engine {
    val engineFolder = getJarFolder()
    val engineLoveFolder = engineFolder.resolve("love")
}