help : ; @cat Makefile

pdf = $(addsuffix .pdf,1-3 4-5 ypr)
pdf : $(addprefix ./media/,$(pdf))

$(addprefix ./media/,$(pdf)) : media ; wget -O $@ http://mant.upol.cz/soubory/$(notdir $@)

media : ; test -d $@ || mkdir $@

#TODO *.pdf nainstalovat do data/media/YMAT2/
#opravit!!! ./.git/config git@github.com:honza4/...

#je to plne matematicke sazby, s tim pdftotext mnoho nenadela
txt : $(pdf:.pdf=.txt)
vpath media
%.txt : %.pdf ; pdftotext $< $@

pngs := $(notdir $(wildcard media/T*.png))
stepbystep.txt : FORCE
	for png in $(basename $(pngs)) ; do echo "======$$png======";echo "{{YMAT2:$$png.png}}" ; done|tee $@

FORCE :: ;

localmedia = $(HOME)/bule.cz/data/media
localmedia :
	test -d $(localmedia)/YMAT2 || mkdir -p $(localmedia)/YMAT2
	cp media/*.png $(localmedia)/YMAT2

png : stepbystep.txt localmedia
