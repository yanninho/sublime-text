Démarrer sublime-text : 

sudo docker run -ti --rm --name sublimetext -v [ Your local workspace ]:/workspace -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix yanninho/sublime-text:3
