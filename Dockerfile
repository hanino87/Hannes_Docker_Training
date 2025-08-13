# Use a small and secure image from Alpline Linux 

# When you run image from think of where it come from and how much space it take

FROM alpine 

# You switch to a nobodyuser that alpine supports for more secure reasons by default docker runs as the root user that have more permissions on your host (local machine) 
USER nobody 

# This command print out a echo statment hello every time the container runs

CMD ["echo", "Hello from my Docker container this is Hannes and I have built my first container now!"]


