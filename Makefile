.ONESHELL:

.PHONY: all
all: readme doc test cleanup

.PHONY: doc
doc:
	$(MAKE) -C doc
	cd doc || exit
	xelatex quran-en-doc
	xelatex quran-en-doc

.PHONY: test
test:
	$(MAKE) -C sample  quran-en-test.tex
	cd sample || exit
	xelatex quran-en-test
	cd .. || exit

.PHONY: cleanup
cleanup:
	$(MAKE) clean
	$(MAKE) clean -C doc -f ../Makefile
	$(MAKE) clean -C tex -f ../Makefile
	$(MAKE) clean -C sample -f ../Makefile

.PHONY: clean
clean:
	@rm -fv ./*.{aux,log,toc,idx,hd,out} ./*~

.PHONY: dev
dev:
	cd tex || exit
	sudo cp -v *.def quran-en.sty /usr/local/texlive/2023/texmf-dist/tex/xelatex/quran-en/

.PHONY: ctan
ctan:
	$(MAKE) cleanup
	mkdir -p quran-en/doc quran-en/tex
	cp -v README        quran-en
	cd tex || exit
	cp -v quran-en.sty  ../quran-en/tex
	cp -v qurantext-en*.translation.def ../quran-en/tex
	cd ../doc/ || exit
	cp -v quran-en-doc.pdf quran-en-doc.tex quran.png ../quran-en/doc
	cd ../sample || exit
	cp -v quran-en-test*    ../quran-en/doc
	cd ..
	zip -r quran-en.zip quran-en
	mv -fv quran-en.zip ..
	rm -rfv ../quran-en
	mv -fv quran-en ..

QURANDATE := $(shell grep "quranendate{" tex/quran-en.sty | cut -d'{' -f2 | tr -d '}')
QURANVERSION := $(shell grep "quranenversion{" tex/quran-en.sty | cut -d'{' -f2 | tr -d '}')
YEAR := "$(shell echo ${QURANDATE} | cut -d'/' -f1)"
readme-file := README

.PHONY: readme
readme:
	@echo "_____________________" > "${readme-file}"
	@echo "The quran-en package" >> "${readme-file}"
	@echo "v${QURANVERSION}" >> "${readme-file}"
	@echo "" >> "${readme-file}"
	@echo "The package is prepared for typesetting some of English translations of the Holy Quran." >> "${readme-file}"
	@echo -e "The supported translations are done  by \`Ahmed Ali\`, \`Ahmed Raza Khan\`, \`A. J. Arberry\`," >> "${readme-file}"
	@echo -e "\`Abdul Majid Daryabadi\`, \`Muhammad Taqi-ud-Din al-Hilali and Muhammad Muhsin Khan\`," >> "${readme-file}"
	@echo -e "\`Talal Itani\`, \`Abul Ala Maududi\`, \`Safi-ur-Rahman al-Mubarakpuri\`, \`Ali Quli Qarai\`," >> "${readme-file}"
	@echo -e "\`Mohammed Marmaduke William Pickthall\`, \`Hasan al-Fatih Qaribullah and Ahmad Darwish\`," >> "${readme-file}"
	@echo -e "\`Saheeh International\`, \`Muhammad Sarwar\`, \`Mohammad Habib Shakir\`, \`Wahiduddin Khan\`," >> "${readme-file}"
	@echo -e "and \`Abdullah Yusuf Ali\`." >> "${readme-file}"
	@echo "" >> "${readme-file}"
	@echo "For more information, please see the documentation." >> "${readme-file}"
	@echo "" >> "${readme-file}"
	@echo "Current version release date: ${QURANDATE}" >> "${readme-file}"
	@echo "___________________" >> "${readme-file}"
	@echo "Seiied-Mohammad-Javad Razvian" >> "${readme-file}"
	@echo "javadr@gmail.com" >> "${readme-file}"
	@echo "" >> "${readme-file}"
	@echo "Copyright © ${YEAR}" >> "${readme-file}"
	@echo "It may be distributed and/or modified under the LaTeX Project Public License," >> "${readme-file}"
	@echo "version 1.3c or higher (your choice). The latest version of" >> "${readme-file}"
	@echo "this license is at: http://www.latex-project.org/lppl.txt" >> "${readme-file}"
	@echo "" >> "${readme-file}"
	@echo "This work is “author-maintained” (as per LPPL maintenance status)" >> "${readme-file}"
	@echo "by Seiied-Mohammad-Javad Razavian." >> "${readme-file}"
