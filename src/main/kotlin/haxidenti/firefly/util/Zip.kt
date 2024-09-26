package haxidenti.firefly.util

import java.io.File
import java.io.IOException
import java.nio.file.Files
import java.nio.file.Path
import java.util.zip.ZipEntry
import java.util.zip.ZipOutputStream
import kotlin.io.path.isDirectory
import kotlin.io.path.relativeTo


object ZipUtil {

    @Throws(IOException::class)
    fun pack(folder: File, zipFile: File, ignoreFiles: List<String> = listOf()) {
        pack(listOf(folder), zipFile, ignoreFiles)
    }

    @Throws(IOException::class)
    fun pack(folders: List<File>, zipFile: File, ignoreFiles: List<String> = listOf()) {
        // Delete old file
        if (zipFile.isFile) {
            if (!zipFile.delete()) {
                throw IOException("Can't delete old ${zipFile.name} file")
            }
        }

        // Create new file
        zipFile.createNewFile()

        // Start packing multiple folders
        ZipOutputStream(Files.newOutputStream(zipFile.toPath())).use { zipOutput ->
            for (folderPath in folders.map { it.toPath() }) {
                Files.walk(folderPath)
                    .filter { !it.isDirectory() }
                    .filter { it.relativeFixedSlash(folderPath) !in ignoreFiles }
                    .forEach { path: Path ->
                        val zipEntry = ZipEntry(folderPath.relativize(path).toString())
                        zipOutput.putNextEntry(zipEntry)
                        Files.copy(path, zipOutput)
                        zipOutput.closeEntry()
                    }
            }
        }
    }

    private fun Path.relativeFixedSlash(folder: Path): String {
        return relativeTo(folder).toString().replace("\\", "/")
    }
}