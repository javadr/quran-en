# The quran-en package
Copyright © 2023

The [`quran-en`](https://ctan.org/pkg/quran-en) package is an extension of the [`quran`](https://ctan.org/pkg/quran) LaTeX package, designed to enhance the typesetting of the Holy Quran by incorporating several English translations. It provides support for English translations carried out by notable translators such as `Ahmed Ali`, `Ahmed Raza Khan`, `A. J. Arberry`, `Abdul Majid Daryabadi`, `Muhammad Taqi-ud-Din al-Hilali and Muhammad Muhsin Khan`, `Talal Itani`, `Abul Ala Maududi`, `Safi-ur-Rahman al-Mubarakpuri`, `Mohammed Marmaduke William Pickthall`, `Ali Quli Qarai`, `Hasan al-Fatih Qaribullah and Ahmad Darwish`, `Saheeh International`, `Muhammad Sarwar`, `Mohammad Habib Shakir`, `Wahiduddin Khan`, and `Abdullah Yusuf Ali`.

## Sample Usage

```
\documentclass{article}

\usepackage{arabxetex}
\usepackage{quran-en}

\begin{document}

    \begin{arab}[utf]
        \quransurah[112]
    \end{arab}
    \quransurahen[112]

\end{document}
```

## Documentation
For more details, please refer to [this link](http://mirrors.ctan.org/macros/xetex/latex/quran-en/doc/quran-en-doc.pdf).


## License

[The LaTeX project public license (LPPL), version 1.3c](https://www.latex-project.org/lppl/lppl-1-3c/)

## Citation

```tex
@misc{quran,
  title={{quran}: An easy way to typeset any part of The Holy Quran},
  url={https://ctan.org/pkg/quran},
  note={Available at https://github.com/javadr/quran},
  author={Javad Razavian},
  year={2015},
}
```
