$quellcode = '<a href="eine adresse">Link 1</a><a href="noch eine">Link 2</a>'
$pattern = '<a href="(?<link>.*?)".*?>(?<text>.*?)</a>'
if ($quellcode -match $pattern) { $Matches }
