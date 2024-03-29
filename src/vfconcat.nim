import options, os, strformat, times

proc main(filespec: string) =
  let f = open("input.txt", fmWrite)
  defer: f.close()

  var
    lastTime: Option[Time]
    lastFile = ""

  for file in walkFiles(filespec):
    let ts = file.getCreationTime
    if lastTime.isSome:
      f.writeLine(fmt"duration {(ts - lastTime.get).inMilliseconds / 1000}")
      lastTime = some(ts)

    f.writeLine(fmt"file '{file}'")
    lastTime = some(ts)
    lastFile = file

  # Duplicate the last frame (see: https://trac.ffmpeg.org/wiki/Slideshow#Concatdemuxer)
  # Not sure why or if this is really necessary, nor what frame duration to use.
  f.writeLine("duration 0.02")
  f.writeLine(fmt"file '{lastFile}'")

when isMainModule:
  if paramCount() != 1:
    echo fmt"Usage: {paramStr(0)} <filespec>"
    echo fmt"  e.g. {paramStr(0)} 'frames/frame_*.png'"
  else:
    main(paramStr(1))
