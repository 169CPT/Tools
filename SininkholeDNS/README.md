# Sinkhole-DNS.p1

### Example: 
```
    .\Sinkhole-DNS.ps1 -Domain "www.sans.org"
```  
###    This will create a primary DNS domain named "www.sans.org"
###    which will resolve to "0.0.0.0".  DNS server is local.  
##
## Example: 
```
    .\Sinkhole-DNS.ps1 -Domain "www.sans.org" -SinkHoleIP "10.1.1.1"
```
####    This will create a primary DNS domain named "www.sans.org"
####    which will resolve to "10.1.1.1".  DNS server is local.
##
## Example: 
```
    .\Sinkhole-DNS.ps1 -InputFile file.txt -IncludeWildCard
```
###    This will create DNS domains out of all the FQDNs and domain
###    names listed in file.txt, plus add a wildcard (*) record.
##
## Example: 
```
    .\Sinkhole-DNS.ps1 -ReloadSinkHoleDomains
```
###    Perhaps after changing the sinkhole IP address, this will cause
###    all sinkholed domains to re-read their shared zone file.
##
## Example: 
```
    .\Sinkhole-DNS.ps1 -DeleteSinkHoleDomains
```
###    This will delete all sinkholed domains, but will not delete
###    any other domains.  This does not delete the sinkhole zone file.
##
## Example:
```
    .\Sinkhole-DNS.ps1 -InputFile file.txt -DnsServerName `
            "server7.sans.org" -Credential "server7\administrator"
```
###    This will create sinkholed domains from file.txt on a remote
###    DNS server named "server7.sans.org" with explicit credentials.
###    You will be prompted for the passphrase.   
##
## Example:
```
    $Cred = Get-Credential -Credential "server7\administrator"

   .\Sinkhole-DNS.ps1 -InputFile *evil*.txt `
        -DnsServerName "server7.sans.org" -Credential $Cred
```
###    This will create sinkholed domains from *evil*.txt on a remote
###    DNS server named "server7.sans.org" with explicit credentials 
###    supplied in a credential object ($Cred) which can be reused again.
###    Multiple input files may match "*evil*.txt".  
## ------------------------------------------------------------------------------------------------
## Create or Update Sinkhole-DNS configurations
```
.\Sinkhole-DNS.ps1 -InputFile blk_domains.txt -SinkHoleIP 127.0.0.1 -IncludeWildCard -RemoveLeadingWWW 
```
##
## Add individual Domains
```
Add-Content blk_domains.txt "domain to block with quotes"
```
#
# append-blklst.ps1
## Add multiple domains from list
```
.\append-blklst.ps1 -InputFile new_blklist.txt -MainFile blk_domains.txt
```