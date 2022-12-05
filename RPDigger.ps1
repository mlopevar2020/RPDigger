param ($search, $iterations)

Function Get-Bing-Search {
    [CmdletBinding(DefaultParameterSetName = 'Search')]
    Param(
        [Parameter (Mandatory = $False, Position = 0, ParameterSetName = 'Search')]
        $search
    )

    $baseUrl = "https://www.bing.com/search?q=+"
    $search = $search -replace ' ', '+'
    $url = $baseUrl + $search
    
    Start-Process microsoft-edge:$url -WindowStyle maximized
}

for ($i = 1; $i -le $iterations; $i++) {
    Get-Bing-Search -Search "$($search) $($i)"
    Start-Sleep -Seconds 1
}