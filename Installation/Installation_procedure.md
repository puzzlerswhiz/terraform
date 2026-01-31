Install Terraform on macOS
Using Homebrew (Recommended):

Install Homebrew if not already installed:
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

Add the HashiCorp tap and install Terraform:
brew tap hashicorp/tap
brew install hashicorp/tap/terraform

Verify installation:
terraform -version

Manual Installation:

Download the macOS binary from the official Terraform download page.
Extract the downloaded .zip file.
Move the terraform binary to /usr/local/bin:
mv terraform /usr/local/bin/

Verify installation:
terraform -version

Install Terraform on Windows
Using Chocolatey (Recommended):

Install Chocolatey (if not already installed):
Set-ExecutionPolicy Bypass -Scope Process -Force
iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

Install Terraform:
choco install terraform

Verify installation:
terraform -version

Using winget (Windows Package Manager):

Install Terraform:
winget install -e --id Hashicorp.Terraform

Verify installation:
terraform version

Manual Installation:

Download the Windows .zip file from the official Terraform download page.
Extract the terraform.exe file.
Create a folder like C:\terraform and place terraform.exe inside.
Add C:\terraform to your System PATH environment variable. 
Open a new Command Prompt or PowerShell window and verify:
terraform -version

✅ Note: The Homebrew method on macOS and Chocolatey on Windows are the easiest and most maintainable options.
