#!/usr/bin/env bash

set -euo pipefail

ffmpeg -f concat -i input.txt -vsync vfr output.mp4
