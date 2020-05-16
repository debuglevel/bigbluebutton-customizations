#!/bin/bash

# TODO: not yet tested if this works that way (duplicate key)
cat <<EOT >> /usr/share/bbb-web/WEB-INF/classes/bigbluebutton.properties
defaultWelcomeMessage=Hallo in <b>%%CONFNAME%%</b>!<br><br>Fuer Hilfe zu BigBlueButton schau dir diese kurzen Videos an: <a href="event:https://bigbluebutton.org/html5"><u>Tutorial Videos</u></a>.<br><br>Bitte benutze ein Headset um die Audioqualitaet zu verbessern :-).
defaultWelcomeMessageFooter=Viel Spass!
EOT

