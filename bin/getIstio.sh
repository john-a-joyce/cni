#!/bin/bash

# Copyright 2018 Istio Authors
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at

#       http://www.apache.org/licenses/LICENSE-2.0

#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License

# This file is temporary compatibility between old update version
# and helm template based generation
set -e
set -o errexit
set -o pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/.."
TEMP_DIR="/tmp"

while getopts :n:p:x:c:a:h:o:P:d:D: arg; do
  case ${arg} in
    d) DEST_DIR="${OPTARG}";;
    *) usage;;
  esac
done

mkdir $DEST_DIR
#JAJ remove cd $TEMP_DIR/$DEST_DIR && { curl -L https://git.io/getLatestIstio | sh - ; cd -; }
cd $DEST_DIR 
git clone https://github.com/istio/istio
cd $DEST_DIR/istio
git checkout tags/1.0.2

# 0.  Assume CNI already cloned. 
# 1.  Check if Istio is already cloned
# 2.  if not clone Istio
# 3.  Set Tag and hub to point to release tag (or default to it)
# 3.  Set branch to be the 1.0.2 branch
# 4.  generate_yaml
# 5.  Change configmap  
# 6.  Install CNI (preferably this becomes a config option of the test)
# 7.  Run test 

