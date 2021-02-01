# https://docs.bigbluebutton.org/2.2/customize.html#increase-the-file-size-for-an-uploaded-presentation

NGINX_CONF=/etc/bigbluebutton/nginx/web.nginx
BBB_CONF=/usr/share/bbb-web/WEB-INF/classes/bigbluebutton.properties
METEOR_CONF=/usr/share/meteor/bundle/programs/server/assets/app/config/settings.yml

echo "- Setting maximum upload size..."
echo " - Setting $NGINX_CONF via sed..."
sed -i -e 's/client_max_body_size *30m;/client_max_body_size       200m;/g' $NGINX_CONF
echo " - Setting $BBB_CONF via sed..."
sed -i -e 's/maxFileSizeUpload=.*/maxFileSizeUpload=200000000/g' $BBB_CONF
echo " - Setting $METEOR_CONF via yq..."
yq w -i $METEOR_CONF public.presentation.uploadSizeMax 200000000
