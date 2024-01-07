# vfconcat

This utility helps concatenate PNG images with non-uniform durations using ffmpeg. Each frame's duration is determined from the difference between the file creation timestamps of the frame and the following one.

In my case this was needed to convert frames dumped from a [Py5](https://py5coding.org) program to a (roughly) accurate video, since the recording process drops a lot of frames.

```
Usage: ./vfconcat <path_glob>

  <path_glob>: A glob specification for the frame files, e.g. 'frames/frame_*.png'
```

The program produces a file named `input.txt` in the current directory, which lists frames and durations in the format used by [ffmpeg's concat demuxer](https://trac.ffmpeg.org/wiki/Slideshow#Concatdemuxer) (also see [this Stack Overflow answer](https://stackoverflow.com/a/76990351/2161072) where I learned about it, and showed that fractional durations can be used).

# concatframes.sh

This convenience script launches `ffmpeg` using the concat demuxer and the input file produced by `vfconcat`.
