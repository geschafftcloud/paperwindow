build:
	docker build -t paperwindow .

run1080p:
	chmod +x x11docker
	sudo xrandr --display VGA1 --mode 1920x1080
	sudo xrandr --fb 1920x1080
	./x11docker --xvfb --size=1920x1080 --pulseaudio -g -- -p 8080:8080 -- paperwindow

run1080p-cpu:
	chmod +x x11docker
	sudo xrandr --display VGA1 --mode 1920x1080
	sudo xrandr --fb 1920x1080
	./x11docker --xvfb --size=1920x1080 --pulseaudio -p 8080:8080 -- paperwindow
