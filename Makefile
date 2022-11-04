.PHONY: all git term clean

all:
	sudo -E bash apptainer.sh

git:
	@echo Setting up git and ssh keys...
	@Rscript .setup/git/git.R ${PWD}

term:
	@echo Building .bashrc and .vimrc...
	@(cd .setup/bash && make)
	@(cd .setup/vim && make)

clean:
	@rm -rf *.sif
	@docker system prune -a
	@docker rmi $(docker images -a -q)
	@docker stop $(docker ps -a -q)
	@docker rm $(docker ps -a -q)
