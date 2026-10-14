#Setting Group Policy Object (GPO) in active directory .
     This section outlines the step-by-step procedures for creating,configuring, linking and verifying Group Policy Objects (GPO) a windows server directory environment.
## Prerequisites
 A windows server domain controller running [Active Directory Domain Services (AD DS)]
 Administrative privileges "Domain Admin" or "Enterprise Admin" access.
 Target computers or users organized inside specific "Organization Units (OUs)"

 
 #step1: Open Group Policy Management Console(GPMC)
    On your Windows server, open "server manager"
    click on "tools" in the top right menu and select "Group Policy Management"
    Alternatively: press "win + R" type "gpmc.msc" and press enter

    
 #step 2: Create a New Group Policy Object
     Expand your "Forest" $\rightarrow$ "Domain" $\rightarrow$ "your-domain-name.com(Stanbic.com)"
     Right click on "Group Policy Objects" and select "New"
     Enter a clear name for the GPO (eg."GPO enforce Password Policy" or "GPO disable USB storage")
     Leave "Source Starter GPO " as (none) unless using a predefined template
     click ok

#step3:Configure Policy Setting
  Right click  the newly created GPO under the "Group Policy Object" folder and click "edit"
  the "Group Policy Management Editor" window will open with two main sections: 1."computer configuration: settings applied to domain joined devices (applies at startup)"  2. "user configuration: settings applied to domain users (applies at logon)
Navigate to the desired policy node:
example like (password policy):computer configuration>policies>windows settings>security>advanced account policies like audit policy configuration>audit policies>DS access>audit directory>object access
Select "enabled" and click "apply" then ok
close the editor window

#step4:link the GPO to an organizational unit (OU)
  In the main " Group Policy Management" window, locate the target "organizational unit(OU) " where you want to apply the policy 
  Right click the OU and select "link to an existing GPO"
  Select your newly created GPO from the list and click ok


  step5: Enforce and test policy application
  Group Policy automatically updates every 90 minutes (with a random offset), but you can manually enforce it on client machines 
  

     
