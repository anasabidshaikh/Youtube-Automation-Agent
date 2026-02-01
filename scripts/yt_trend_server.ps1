
$listener = New-Object System.Net.HttpListener
$listener.Prefixes.Add("http://+:3333/")
$listener.Start()

Write-Host "Listening on http://localhost:3333/"

while ($true) {
  $context = $listener.GetContext()
  $request = $context.Request
  $response = $context.Response

  $query = $request.QueryString["q"]
  if (-not $query) { $query = "viral shorts" }

  $output = powershell -ExecutionPolicy Bypass `
    -File "D:\N8N Projects Workflows\Youtube-Automation-Agent\scripts\run_yt_trends.ps1" `
    -query $query

  $json = "[" + ($output -join ",") + "]"

  $buffer = [System.Text.Encoding]::UTF8.GetBytes($json)
  $response.ContentLength64 = $buffer.Length
  $response.OutputStream.Write($buffer, 0, $buffer.Length)
  $response.Close()
}
