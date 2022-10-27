import std/[json, osproc]
import strformat

proc downloadUrl*(url: string) =  
  let downloadsFolder = "./downloads/youtube"
  let savePath = fmt"{downloads_folder}/%(title)s.%(ext)s"  
  let process = startProcess("./binaries/yt-dlp", args = [url, "-o", savePath, "--print-json"])    
  let (lines, exitCode) = process.readLines  
  let jsonNode = parseJson(lines[0])

  let title =  jsonNode["title"].getStr()
  let extension = jsonNode["ext"].getStr()

  let resizedSavePath = fmt"{downloads_folder}/{title}-720p.mp4"  

  let ffmpegProcess = startProcess("./binaries/ffmpeg-5.1.1-amd64-static/ffmpeg", args = [
    "-i",
    fmt"{downloads_folder}/{title}.{extension}",
    "-c:v",
    "libx265",
    "-vf",
    "scale=1280:-2",
    resizedSavePath
  ])

  echo ffmpegProcess.readLines

  while ffmpegProcess.peekExitCode == -1:
    echo "Still converting video..."

  process.close()
  ffmpegProcess.close()
