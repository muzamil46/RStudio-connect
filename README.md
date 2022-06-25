# RStudio-connect
terraform script to provision rstudio connect on aws

**Prior Steps**

In order to trigger this terraform code we need an key-pair through which we can connect to the EC2 instance. Please create an key-pair in your aws account.
steps to create key-pair
  1. go to the aws console
  2. go to EC2 service
  3. on the left side of panel in the Network and security tab select key-pair
  4. create an key-pair and download it also.

**How to trigger terraform script:**
 1. clone the RStudio-connect repository
 2. cd RStudio-connect
 3. run "terraform init" it will downnload all necessary packges for the given provider
 4. run "terraform apply" after entering this command terraform will prompt you for two variable, first one is "keypair_name" -> "Enter the name of key-pair that you generated in the prior Steps section", and the second is "private_key" -> "Enter the path of the downloaded key-pair file" .
 5. run "terraform apply" it will create and EC2 instance on your aws account and after creating the instance it will install RStudio connect through "Rstudio_connect_installation.sh" script.
 6. after successfull execution of the command "terraform apply", terraform will print public ip of the instance as an output on the screen copy that public ip and hit "public_ip:3939" on any browser, you will be redirected to the RStudio connect. 
