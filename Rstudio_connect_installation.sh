#! /bin/bash
# Enable the Extra Packages for Enterprise Linux (EPEL) repository
sudo yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm -y

# Enable the CodeReady Linux Builder repository
sudo subscription-manager repos --enable codeready-builder-for-rhel-8-x86_64-rpms

# If running RHEL 8 in a public cloud, such as Amazon EC2, enable the CodeReady
# Linux Builder repository from Red Hat Update Infrastructure (RHUI) instead
sudo dnf install dnf-plugins-core -y
sudo dnf config-manager --set-enabled "codeready-builder-for-rhel-8-*-rpms"

export R_VERSION=4.1.3

curl -O https://cdn.rstudio.com/r/centos-8/pkgs/R-${R_VERSION}-1-1.x86_64.rpm
sudo yum install R-${R_VERSION}-1-1.x86_64.rpm -y

sudo ln -s /opt/R/${R_VERSION}/bin/R /usr/local/bin/R
sudo ln -s /opt/R/${R_VERSION}/bin/Rscript /usr/local/bin/Rscript

curl -O https://cdn.rstudio.com/connect/2022.05/rstudio-connect-2022.05.0.el8.x86_64.rpm
sudo yum install rstudio-connect-2022.05.0.el8.x86_64.rpm -y

sudo systemctl start rstudio-connect


