#!/usr/bin/env bash
##
##  Package uploader
##
##  Lokesh Pandey @Hax4Us <lkpandey950@gmail.com>
##
##  This program is free software: you can redistribute it and/or modify
##  it under the terms of the GNU General Public License as published by
##  the Free Software Foundation, either version 3 of the License, or
##  (at your option) any later version.
##
##  This program is distributed in the hope that it will be useful,
##  but WITHOUT ANY WARRANTY; without even the implied warranty of
##  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
##  GNU General Public License for more details.
##
##  You should have received a copy of the GNU General Public License
##  along with this program.  If not, see <http://www.gnu.org/licenses/>.
##

set -o nounset

# Check dependencies.
if [ -z "$(command -v curl)" ]; then
    echo "[!] Package 'curl' is not installed."
    exit 1
fi

echo -n "[*] Uploading ${1}..."
if RESULT_URL=$(curl --silent -F "file=@${1}" https://file.io/?expires=2) > /dev/null 2>&1; then
    echo "ok"
    echo
    echo "${1} uploaded to ${RESULT_URL}"
    exit 0
else
    echo
    echo "[!] Failed to upload packages."
    echo
    echo "However, since build was successfull, exiting"
    exit 0
fi
