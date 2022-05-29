gdrive_download () {
  CONFIRM=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate "https://docs.google.com/uc?export=download&id=$1" -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')
  wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$CONFIRM&id=$1" -O $2
  rm -rf /tmp/cookies.txt
}

echo "Downloading model weight"
gdrive_download 13Enbld9Z8SMoHvfYE2tXNecdmQVKPqpO model.pb
mv model.pb model
echo "Downloading shadow dataset"
gdrive_download 1gvy0xELe6ZzL0rPEMrJ70XDq33le6reU Shadow-AR.zip
unzip -q Shadow-AR.zip -d ShadowAR
rm -f Shadow-AR.zip
