pdf = $(addsuffix .pdf,1-3 4-5 ypr)
pdf : $(pdf)

$(pdf) : ; wget -O $@ http://mant.upol.cz/soubory/$@

#TODO *.pdf nainstalovat do data/media/YMAT2/
