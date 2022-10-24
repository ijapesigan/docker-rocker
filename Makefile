.PHONY: all term termconda termclean clean

all:
	bash apptainer.sh

# terminal

term: termclean
	@(cd .bash && make)
	@(cd .vim && make)

termconda: term
	@(cd .bash && make conda)

# clean

termclean:
	@rm -rf ~/.vim

clean:
	@rm -rf *.sif
	@docker system prune -a
	@docker rmi $(docker images -a -q)
	@docker stop $(docker ps -a -q)
	@docker rm $(docker ps -a -q)
