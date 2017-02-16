###Installation of chocolatey ###
$chocolateyCheck=choco --version
try
{
    if ($?)
        {
        Write-Host "chocolatey is already Present so skipping"
        }
    else
        {
        $installChoco= iwr httpos://chocolatey.org/install.ps1 -UseBasicParsing | iex
        if($?)
            {
            Write-Host "chocolatey Installed Sucessfuly"
            $status = 0
            }
        else
            {
            Write-Host "Error in Installing Chocolatey"
            }
        }
}
catch [Exception] {
    Write-Host $errorMessage
}

##Virtual Box Installation##
if ($status -eq 0)
{
    try
        {
        $virtualBoxInstallStatus= choco install virtualbox
        if ($?)
            {
            write-host "Vrtual Box Installed Sucessfully"
            $virtualBoxStatus = 0
            }
        else
            {
            write-host "Failed to Install VirtualBox"
            }
        }
    catch [Exception] {
    Write-Host $errorMessage
    }
}
##Vagrant Installation##
if ($virtualBoxInstallStatus -eq 0)
{
try
    {
    $vagrantInstallStatus= choco install vagrant
    if($?)
        {
        write-host "Vagarant Installed Sucessfully"
        $vagrantStatus=0
        }
    else
        {
        write-host "Fail to Install Vagrant"
        }
    }
catch [Exception] {
    write-host $errorMessage
    }
}
if ($vagrantStatus -eq 0)
{
try
    {
    $gitInstallStatus = choco install git
    if ($?) 
        {
        write-host "Git Installed Sucessfully"
        $gitStatus = 0
        }
    else
        {
        Write-Host "Fail to Install Git"
        }
    }
catch [Exception] {
    write-host $errorMessage
    }
}