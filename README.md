# PK-Jumpbox

A jumpbox to reach multiple endpoints (Dev, Staging, Prod) for various cloud services (Google Cloud Platform, Amazon Web Services).

This assumes that you have a CLI installed and configured with an authenticated user for each cloud environment-
gcloud - https://cloud.google.com/sdk/gcloud/
aws-cli - https://aws.amazon.com/cli/
  The aws-cli user will need to have JSON set as the default output

INSTALLATION

Make sure that you do not have any existing jumpbox files in place.
This will install files in:
$HOME/bin/aws
$HOME/bin/gce
$HOME/bin/opt


1. Clone this repo.
  $ git clone git@github.com:wallentx/PK-Jumpbox.git
2. cd into the repo dir.
  $ cd PK-Jumpbox/
3. Execute the install script.
  $ ./install.sh
4. Verify the existance of the files in $HOME/bin
  $ which jumpmenu
