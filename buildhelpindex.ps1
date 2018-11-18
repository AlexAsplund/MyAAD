param(

    [switch]$Debug

)
$files = ls $PSScriptRoot\src\Public\*

$Text = @"
# MyAAD Module
## Description
A simple and pretty straight forward Powershell Module for Microsoft Graph



"@

foreach($file in $files){

    $description = ((cat $file.fullname)[2] + "`n") -replace "^\s+",""
    $cmdletname = $file.name -replace "\.ps1",""
    
    $NextRowIsExample = $False
    $NextRowIsDescription = $False
    $Example = "`n"

    $Descr = ""

    (cat $file.FullName) | foreach {
        if($NextRowIsExample){
            
            $Example += "`n$_"
            $NextRowIsExample = $false

        }
        if($_ -eq ".Example"){

            $NextRowIsExample = $True

        }
    }

    $Example += "`n"
    $Text+= "### [$cmdletname]($cmdletname.md)"
    $Text += "`n`n#### Description:`n`n"
    $Text += "$Description"
    $Text += "`n#### Example:"
    $text += $Example+"`n"
    $text += $cmdletinfo
}

if(!$Debug) {
    $Text | Out-File -FilePath $PSScriptRoot\docs\MyAAD.md -Force
}
else {
    $Text
}