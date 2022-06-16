<#
param (
    [string] $BuildRef,
    [string] $sapapiurl,
    [string] $sapsubscriptionid,
    [string] $saptoken
)

#>

try 
{
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12;

    # refs/heads/main
	# refs/tags/resideo_001.002

    #Write-Host "BuildRef : $($BuildRef)" 
    #Write-Host "GITHUB_REPOSITORY_OWNER : $($env:GITHUB_REPOSITORY_OWNER)"

    Write-Host $env:COMPUTERNAME

    #Set-ActionVariable BRANCH_NAME "$env:COMPUTERNAME_true"

    <#
    $git_tag=''

    if ($BuildRef -ne $null -and $BuildRef.StartsWith("refs/tags/")) 
    {
        $git_tag =$BuildRef.Split("/")[2];
        Write-Host "Git Tag : $($git_tag)"
        
        $Body = @{
            branch = $($git_tag)
            name = $($git_tag)
        }

        $Header = @{
                "authorization" = "Bearer $saptoken"
            }
 
        $CreateSAPBuild = @{
            Method = "POST"
            Headers     = $Header
            Uri =  $( $sapapiurl + $sapsubscriptionid + "/builds" )
            Body = ($Body | ConvertTo-Json) 
            ContentType = "application/json"
        }
        
        $res=Invoke-RestMethod @CreateSAPBuild
        
        $res

        
    }
    #>

}
catch [Exception]
{
    #Write-Output "Error while FTP file : $($_.Exception.Message)" 
    Write-Error $_

    #exit 1
}