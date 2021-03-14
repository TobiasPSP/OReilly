# Regex-Muster für eine IPv4-Adresse:
$regex = '^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$'

# true:
'10.12.100.1' -match $regex
# false:
'10.12.100.259' -match $regex
