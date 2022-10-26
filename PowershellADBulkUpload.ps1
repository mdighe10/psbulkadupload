#Import active directory module for running AD cmdlets

Import-Module activedirectory

#Data from the CSV file should be kept in the $Users variable. Make sure CSV file name and path is correct.
$Users = Import-csv C:\it\bulk_import.csv

#Cycle over each line of the CSV file's user information. 
foreach ($User in $Users) {
    # Read user data from each field in each row

        # create a hashtable for splatting the parameters
        $userProps = @{
            SamAccountName            = $User.employeeId                   
            Path                      = $User.path
            GivenName                 = $User.firstName 
            Surname                   = $User.lastName
            Name                      = $User.fullName
            DisplayName               = $User.fullName
            UserPrincipalName         = $user.UserPrincipalName 
            Department                = $User.department
            EmailAddress              = $User.email
            AccountPassword           = (ConvertTo-SecureString $User.Password -AsPlainText -Force) 
            Enabled                   = $true
            ChangePasswordAtLogon     = $false
        }   #end userprops   

        New-ADUser @userProps

    } #end else
