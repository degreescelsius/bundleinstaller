echo "Welcome to the bundle installer by degreescelsius!"
echo "Make sure you run this via adb, other workarounds like with shizuku and an adb shell into the same phone will work."
echo "Filename inside the Downloads directory: "
read filename
echo "Is this a downgrade(y/n)?"
read downgrade

mkdir /data/local/tmp/bundleinstaller/
mv /data/media/0/Downloads/$filename /data/local/tmp/bundleinstaller/
mv /data/local/tmp/bundleinstaller/$filename /data/local/tmp/bundleinstaller/$filename.zip
unzip /data/local/tmp/bundleinstaller/$filename.zip /data/local/tmp/bundleinstaller/bundle

if [[ "$downgrade" == "y" || "$downgrade" == "Y" ]]; then
    pm install -d /data/local/tmp/bundleinstaller/bundle/*.apk
else
    pm install /data/local/tmp/bundleinstaller/bundle/*.apk
fi

rm -rf /data/local/tmp/bundleinstaller