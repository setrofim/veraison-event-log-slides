BASE_NAME = veraison-event-log
MARP_OPTS = --allow-local-files --theme theme.css

.DEFAULT: all

.PHONY: all pdf html pptx clean

all: pdf html pptx

pdf: $(BASE_NAME).pdf

html: $(BASE_NAME).html

pptx: $(BASE_NAME).pptx

$(BASE_NAME).pdf: $(BASE_NAME).md images/*
	marp $(BASE_NAME).md $(MARP_OPTS) --html --pdf --pdf-notes

$(BASE_NAME).html: $(BASE_NAME).md images/*
	marp $(BASE_NAME).md $(MARP_OPTS) --html

$(BASE_NAME).pptx: $(BASE_NAME).md images/*
	marp $(BASE_NAME).md $(MARP_OPTS) --html --pptx

watch:
	marp . -p -w --server $(MARP_OPTS)

clean:
	$(RM) -f *.pdf *.html *.pptx
