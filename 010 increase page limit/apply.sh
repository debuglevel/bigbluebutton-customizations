# https://docs.bigbluebutton.org/2.2/customize.html#increase-the-200-page-limit-for-uploads
echo "UNTESTED"
return

echo "Setting page limit..."
sed -i 's/maxNumPages=.*/maxNumPages=500/g' /usr/share/bbb-web/WEB-INF/classes/bigbluebutton.properties