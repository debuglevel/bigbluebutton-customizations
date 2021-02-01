# https://docs.bigbluebutton.org/2.2/customize.html#increase-the-200-page-limit-for-uploads
BBB_CONF="/usr/share/bbb-web/WEB-INF/classes/bigbluebutton.properties"

echo "- Setting page limit..."
echo "  - Setting value in $BBB_CONF via sed"
sed -i 's/maxNumPages=.*/maxNumPages=500/g' $BBB_CONF
