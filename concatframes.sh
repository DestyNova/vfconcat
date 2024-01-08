#!/usr/bin/env bash

set -euo pipefail

ffmpeg -f concat -i input.txt -vsync vfr -vcodec libx264 -b:v 800k output.mp4
