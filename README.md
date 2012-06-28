# Bits related to serving Webconverger downloads

* index.php - el cheapo CDN based on libapache2-mod-geoip
* [stats/](http://dl.webconverger.com/stats) based on [Morris.js](http://oesmith.github.com/morris.js/)

# cron

	@daily make -C /srv/www/dl.webconverger.com

# /etc/apache2/sites-available/dl Apache2 content delivery network configuration

Use backport of [geoip-database](http://as.archive.progress-linux.org/progress/pool/contrib/g/geoip-database-contrib/)

More information about the [Webconverger download servers](http://webconverger.org/servers/).

	<VirtualHost *:80>
	ServerName dl.webconverger.com
	DocumentRoot /srv/www/dl.webconverger.com/
	<Directory />
	AllowOverride None
	Options +FollowSymLinks
	RewriteEngine On
	RewriteCond %{REQUEST_FILENAME} !-f
	RewriteCond %{REQUEST_FILENAME} !-d
	RewriteRule . /index.php [L]
	</Directory>
	GeoIPEnable On
	GeoIPDBFile /usr/share/GeoIP/GeoIP.dat
	CustomLog /var/log/apache2/dl.log combined
	ErrorLog /var/log/apache2/dl-error.log
	</VirtualHost>


Like the work? Then support our product <http://webconverger.com>!
