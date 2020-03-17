echo "Starting Unity installation" > Unitysetup.log
echo "Step 1/4: Starting dependencies installation..." >> Unitysetup.log
sudo apt install libgtk2.0-0 libsoup2.4-1 libarchive13 libpng16-16 libgconf-2-4 lib32stdc++6 libcanberra-gtk-module libgtk-3-0 libgtk-3-dev libglu1-mesa libnss3 -y
echo "Step 2/4: Downloading Unity setup file..." >> Unitysetup.log
curl https://beta.unity3d.com/download/dad990bf2728/UnitySetup-2018.2.7f1 -o UnitySetup-2018.2.7f1
echo "Step 3/4: Creating working folder and granting access..." >> Unitysetup.log
sudo chmod +x UnitySetup-2018.2.7f1
sudo mkdir Unity
sudo chmod 777 Unity
echo "Step 4/4: Running Unity setup..." >> Unitysetup.log
yes | ./UnitySetup-2018.2.7f1 --unattended --verbose --install-location=./Unity
echo "Unity installation finished" >> Unitysetup.log