sudo mkdir -p /etc/apt/keyrings
curl -fsSL "https://download.opensuse.org/repositories/home:/alvistack/xUbuntu_$(lsb_release -rs)/Release.key" \
	  | gpg --dearmor \
	    | sudo tee /etc/apt/keyrings/alvistack.gpg > /dev/null
echo \
	  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/alvistack.gpg]\
	      https://ftp.gwdg.de/pub/opensuse/repositories/home:/alvistack/xUbuntu_$(lsb_release -rs)/ /" \
	        | sudo tee /etc/apt/sources.list.d/alvistack.list > /dev/null
sudo apt-get update
sudo apt-get -y install podman passt podman-netavark podman-aardvark-dns uidmap slirp4netns
