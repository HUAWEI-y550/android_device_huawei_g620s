#!/bin/bash

#
# Copyright (C) 2015  Rudolf Tammekivi
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

VENDOR=huawei
DEVICE=g620s

# Get the script location no matter where it's started from.
SCRIPTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Go to root tree.
cd $SCRIPTDIR/../../..

VENDORDIR=vendor/$VENDOR/$DEVICE
FILEDIR=$VENDORDIR/proprietary

MAKEFILE=$VENDORDIR/Android.mk
echo -e "\e[00;35mWriting "$(basename $MAKEFILE) "\e[00m"
(cat << EOF) > $MAKEFILE
#
# Copyright (C) 2015  Rudolf Tammekivi
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# This file is generated by device/$VENDOR/$DEVICE/setup-makefiles.sh

EOF

cat $SCRIPTDIR/proprietary-modules.txt >> $MAKEFILE

MAKEFILE=$VENDORDIR/$DEVICE-vendor-blobs.mk
echo -e "\e[00;35mWriting "$(basename $MAKEFILE) "\e[00m"
(cat << EOF) > $MAKEFILE
#
# Copyright (C) 2015  Rudolf Tammekivi
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# This file is generated by device/$VENDOR/$DEVICE/setup-makefiles.sh

EOF

# Clear the variables before using them.
unset file
unset wasfile
firstline=true

# Secondly add standard libraries.
while read file
do
	# Skip the line if it is a comment or empty line.
	if [[ ${file:0:1} == "#" ]] || [[ $file == "" ]]; then
		continue
	fi

	# If it's the first match, add the definition.
	if [[ $firstline == true ]]; then
		echo "PRODUCT_COPY_FILES += \\" >> $MAKEFILE
		firstline=false
	fi

	# We have to put the correct line ending, depending on if we had a file
	# previously.
	if [[ $wasfile == true ]]; then
		echo " \\" >> $MAKEFILE
	fi
	echo -en "\t$FILEDIR/$file:$file" >> $MAKEFILE
	wasfile=true
done < $SCRIPTDIR/proprietary-files.txt

# Write newline at end of file.
echo "" >> $MAKEFILE

# Clear the variables before using them.
unset file
unset wasfile
firstline=true

MAKEFILE=$VENDORDIR/BoardConfigVendor.mk
echo -e "\e[00;35mWriting "$(basename $MAKEFILE) "\e[00m"
(cat << EOF) > $MAKEFILE
#
# Copyright (C) 2015  Rudolf Tammekivi
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# This file is generated by device/$VENDOR/$DEVICE/setup-makefiles.sh

USE_CAMERA_STUB := false
EOF

# Clear the variables before using them.
unset file
unset wasfile
firstline=true

MAKEFILE=$VENDORDIR/$DEVICE-vendor.mk
echo -e "\e[00;35mWriting "$(basename $MAKEFILE) "\e[00m"
(cat << EOF) > $MAKEFILE
#
# Copyright (C) 2015  Rudolf Tammekivi
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# This file is generated by device/$VENDOR/$DEVICE/setup-makefiles.sh

# Pick up overlay for features that depend on non-open-source files
DEVICE_PACKAGE_OVERLAYS += $VENDORDIR/overlay

\$(call inherit-product, $VENDORDIR/$DEVICE-vendor-blobs.mk)
EOF
