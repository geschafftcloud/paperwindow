build:
	docker build -t paperwindow .

prepareaudio:
	pulseaudio --start &

run1080p:
	chmod +x x11docker
	sudo xrandr --fb 1920x1080
	./x11docker --xvfb --size=1920x1080 --pulseaudio -g -- -p 8080:8080 -- paperwindow

run1080p-ssl:
	chmod +x x11docker
	sudo xrandr --fb 1920x1080
	./x11docker --xvfb --size=1920x1080 --ssl-cert=./cert.pem --pulseaudio -g -- -p 8080:8080 -- paperwindow

run1080p-cpu:
	chmod +x x11docker
	sudo xrandr --fb 1920x1080
	./x11docker --xvfb --size=1920x1080 --pulseaudio -- -p 8080:8080 -- paperwindow

run1080p-cpu-noxrandr:
	chmod +x x11docker
	./x11docker --xvfb --size=1920x1080 --pulseaudio -- -p 8080:8080 -- paperwindow
