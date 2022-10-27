# This is just an example to get you started. A typical binary package
# uses this file as the main entry point of the application.

import "youtube"

when isMainModule:
  downloadUrl("https://www.youtube.com/watch?v=QtXby3twMmI")
