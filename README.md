Forked from: https://github.com/yanninho/sublime-text

To run:

docker run -ti --rm --name sublimetext -v [local workspace]:/workspace -e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix editors/sublime-text:3


Todo:

We can probably find a more suitable (smaller) base image. Do you really need full blown ubuntu for Sublime Text?