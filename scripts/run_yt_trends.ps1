param (
  [string]$query = "viral shorts",
  [int]$limit = 30
)

$ytDlp = "D:\tools\yt-dlp\yt-dlp.exe"

$cmd = "$ytDlp `"ytsearchdate${limit}:${query}`" --dump-json --flat-playlist"

Invoke-Expression $cmd
