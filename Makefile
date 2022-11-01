.PHONY: all term clean

all:
	sudo -E bash apptainer.sh

# terminal

term:
	@(cd .bash && make)
	@(cd .vim && make)

clean:
	@rm -rf *.sif
	@docker system prune -a
	@docker rmi $(docker images -a -q)
	@docker stop $(docker ps -a -q)
	@docker rm $(docker ps -a -q)
