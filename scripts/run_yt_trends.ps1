param (
  [string]$query = "viral shorts",
  [int]$limit = 30,
  [string]$region = "PK"
)

$ytDlp = "D:\tools\yt-dlp\yt-dlp.exe"

# Construct yt-dlp command using ytsearchdate with region
$cmd = "`"${ytDlp}`" `"ytsearchdate${limit}:${query}`" --dump-json --flat-playlist --geo-bypass-country ${region}"

Invoke-Expression $cmd