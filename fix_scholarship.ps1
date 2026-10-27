$path = 'scholarship.html'
$c = [IO.File]::ReadAllText($path, [System.Text.Encoding]::UTF8)
$origLen = $c.Length

# Step 1: Add imgErr() helper before render function
$renderAnchor = '    /* Render cards */'
$withHelper = '    function imgErr(el) { el.outerHTML = ''<div class="sch-logo-fb"><i class="fa-solid fa-graduation-cap"></i></div>''; }' + "`n`n" + '    /* Render cards */'
if ($c.Contains($renderAnchor)) {
    $c = $c.Replace($renderAnchor, $withHelper)
    Write-Host 'imgErr helper added'
} else {
    Write-Host 'WARNING: render anchor not found'
}

# Step 2: Replace the isB64 logo block with clean imgErr version
# Search by anchor
$oldAnchor = 'var isB64 = s.image && s.image.indexOf'
$idx = $c.IndexOf($oldAnchor)
if ($idx -ge 0) {
    # Find end of this block (ends at 'var tag')
    $endAnchor = 'var tag = (s.specialTag'
    $endIdx = $c.IndexOf($endAnchor, $idx)
    if ($endIdx -ge 0) {
        $oldPart = $c.Substring($idx, $endIdx - $idx)
        Write-Host 'Old logo block length:' $oldPart.Length
        $newPart = '/* Logo: uses imgErr() helper to avoid broken onerror string escaping */' + "`r`n" +
                   "            var logoHtml = !s.image" + "`r`n" +
                   "                ? '<div class=" + [char]34 + "sch-logo-fb" + [char]34 + "><i class=" + [char]34 + "fa-solid fa-graduation-cap" + [char]34 + "></i></div>'" + "`r`n" +
                   "                : '<img class=" + [char]34 + "sch-logo" + [char]34 + " src=" + [char]34 + "' + esc(s.image) + '" + [char]34 + " alt=" + [char]34 + [char]34 + " loading=" + [char]34 + "lazy" + [char]34 + " onerror=" + [char]34 + "imgErr(this)" + [char]34 + ">';" + "`r`n" +
                   "            "
        $c = $c.Substring(0, $idx) + $newPart + $c.Substring($endIdx)
        Write-Host 'Logo block replaced'
    } else {
        Write-Host 'WARNING: endAnchor not found'
    }
} else {
    Write-Host 'WARNING: isB64 anchor not found'
}

# Step 3: Increase logo CSS size 54->70
$c = $c -replace 'width: 54px; height: 54px;(\r?\n\s+border-radius:) 12px;(\r?\n\s+object-fit: contain;)', 'width: 70px; height: 70px;${1} 14px;${2}'
$c = $c -replace '\.sch-logo-fb \{(\r?\n\s+)width: 54px; height: 54px;(\r?\n\s+border-radius:) 12px;', '.sch-logo-fb {${1}width: 70px; height: 70px;${2} 14px;'
$c = $c -replace 'font-size: 1\.35rem;(\r?\n\s+color: var\(--primary-red\);)', 'font-size: 1.6rem;${1}'
Write-Host 'Logo CSS size updated'

[IO.File]::WriteAllText($path, $c, [System.Text.Encoding]::UTF8)
Write-Host "Done. Old size: $origLen, New size: $($c.Length)"
