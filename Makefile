build:
	docker build -t webwine-plus .

run1080p:
    xrandr --output VGA-1 --mode 1920x1080
	./x11docker --xvfb --size=1920x1080 -g -- -p 4200:8080 -- webwine-plus

run1080p-cpu:
	./x11docker --xvfb --size=1920x1080 -- -p 4200:8080 -- webwine-plus