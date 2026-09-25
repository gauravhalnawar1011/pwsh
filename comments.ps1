# This is a single-line comment

########################################
#   To write a multi-line comment we use:
#########################################

<#
Open the block with the multi-line comment opening tag
and close it with the multi-line comment closing tag.

Everything written between these tags will be treated
as a comment, spanning as many lines as you need.
#>

# In short:
# #     → single-line comment
# <#   #> → multi-line/block comment

# Get the current date
$date = Get-Date

Write-Output $date
