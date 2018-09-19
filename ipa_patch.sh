#!/bin/bash

# Usage:
# 1) Put file DJI GO 4 4.3.2.ipa and mobileprovision file near ipa_patch.sh
# 2) Find signature: security find-identity -p codesigning -v (ex: 857219800D661A7B2BBDA3C8AFDD710C3EFC18A2)
# 3) Run: ./ipa_patch.sh "DJI GO 4 4.3.2" [Signature] [Mobileprovision File]
# 4) Output file: DJI GO 4 4.3.2-frida.ipa

GITHUB_BASE_URL="https://raw.githubusercontent.com/ddzobov/dji-ios-frida-tweak/master"

SIGNATURE=$2
MOBILEPROVISION_NAME=$3
GADGET_CONFIG_NAME="FridaGadget.config"
TWEAK_NAME="Tweak.js"
PAYLOAD_FOLDER="Payload"
APP_FOLDER="$PAYLOAD_FOLDER/DJI GO 4.app"
SRC_NAME="$1.ipa"
TMP_NAME="$1-tmp.ipa"
PATCHED_NAME="$1-tmp-frida-codesigned.ipa"
OUTPUT_NAME="$1-frida.ipa"

if [[ ! -f "$SRC_NAME" ]]; then
	echo "IPA file \"$SRC_NAME\" does not exists"
	exit 0;
fi

if [[ ! -f "$MOBILEPROVISION_NAME" ]]; then
	echo "Mobileprovision file \"$MOBILEPROVISION_NAME\" does not exists"
	exit 0;
fi

# downloading config and tweak from Github
wget -O "$GADGET_CONFIG_NAME" "$GITHUB_BASE_URL/$GADGET_CONFIG_NAME"
wget -O "$TWEAK_NAME" "$GITHUB_BASE_URL/$TWEAK_NAME"

# unpacking decrypted ipa
unzip "$SRC_NAME"

# copying config and tweak into app folder and packing
cp "$GADGET_CONFIG_NAME" "$TWEAK_NAME" "$APP_FOLDER/Frameworks/"
zip -r "$TMP_NAME" "$PAYLOAD_FOLDER"
rm -rf "$PAYLOAD_FOLDER";

# patching ipa with objection requires codesigning
objection patchipa -s "$TMP_NAME" -c $SIGNATURE -p $MOBILEPROVISION_NAME
rm "$TMP_NAME"

# unpacking patched and signed ipa
unzip "$PATCHED_NAME"
rm "$PATCHED_NAME"

# cleaning package - removing codesignature and embedded.mobileprovision
rm -rf "$APP_FOLDER/_CodeSignature"
rm "$APP_FOLDER/embedded.mobileprovision"
zip -r "$OUTPUT_NAME" "$PAYLOAD_FOLDER"

# cleaning temp folder
rm -rf "$PAYLOAD_FOLDER" "$GADGET_CONFIG_NAME" "$TWEAK_NAME"