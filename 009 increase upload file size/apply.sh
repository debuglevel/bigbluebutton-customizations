# https://docs.bigbluebutton.org/2.2/customize.html#increase-the-file-size-for-an-uploaded-presentation
echo "Setting maximum upload size..."

sed -i -e 's/client_max_body_size *30m;/client_max_body_size       200m;/g' /etc/bigbluebutton/nginx/web.nginx

sed -i -e 's/maxFileSizeUpload=.*/maxFileSizeUpload=200000000/g' /usr/share/bbb-web/WEB-INF/classes/bigbluebutton.properties

yq w -i /usr/share/meteor/bundle/programs/server/assets/app/config/settings.yml public.presentation.uploadSizeMax 200000000
