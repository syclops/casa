# Setup for website

# Running this file is optional, but if you do not, then you will have to do
# this setup yourself. For directories, Docker will automatically create the
# necessary directories as root rather than as the current user.

set -o errexit

mkdir_if_necessary() {
    if [ ! -d "$1" ]; then
	mkdir "$1"
    fi
}

# Create directories for the nginx reverse proxy and Let's Encrypt service.
mkdir_if_necessary proxy
mkdir_if_necessary proxy/conf.d
mkdir_if_necessary proxy/vhost.d
mkdir_if_necessary proxy/html
mkdir_if_necessary proxy/certs

# Create directories for Nextcloud.
mkdir_if_necessary nextcloud
mkdir_if_necessary nextcloud/config
mkdir_if_necessary nextcloud/custom_apps
mkdir_if_necessary nextcloud/data
mkdir_if_necessary nextcloud/themes

# Create a new hugo site (if you want to set up Hugo)
if command -v hugo >/dev/null 2>&1; then
    hugo new site hugo
fi

# Copy the template environment files.
cp nextcloud-private-template.env nextcloud-private.env
cp site-private-template.env site-private.env
