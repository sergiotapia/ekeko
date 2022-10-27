import std/osproc

proc downloadUrl*(url: string) =  
  echo url
  let (result, exitCode) = execCmdEx("./binaries/yt-dlp", options = {}, input = url)
  echo result
  echo exitCode