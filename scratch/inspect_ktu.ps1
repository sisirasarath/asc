$wc = New-Object System.Net.WebClient
$js = $wc.DownloadString('https://ktu.edu.in/static/js/main.101372da.js')
# Find where "academics" is defined as a route
$matches = [regex]::Matches($js, 'path:"academics/\*?"')
foreach ($m in $matches) {
    Write-Host "academics route at $($m.Index): $($m.Value)"
}
$idx = $js.IndexOf('view-group-a')
Write-Host "view-group-a at $idx"

# What about "view-group" anywhere in the entire text?
$matches2 = [regex]::Matches($js, 'view-group-[a-z0-9_-]+')
foreach ($m in $matches2) {
    Write-Host "view-group match at $($m.Index): $($m.Value)"
}
