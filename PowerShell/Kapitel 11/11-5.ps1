$version = [Version]'12.1.99.832'
$version

$version.Major
$version.Minor

if ($version.Major -gt 10)
{
  "Version $version ist größer als Version 10.x.x.x"
}
else
{
  "Version $version ist NICHT größer als Version 10.x.x.x"
}
