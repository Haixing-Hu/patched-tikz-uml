# Patched TikZ-uml

This repository provides a patch and supporting scripts to fix an issue in the
`tikz-uml` package when using sequence diagram commands (e.g., `\umlcall`) in
 TeX Live 2022 and later versions.

## Problem Description

The `tikz-uml` package is a popular LaTeX package for creating UML diagrams.
However, when using the `\umlcall` command in sequence diagrams, an error occurs
in TeX Live 2022 or higher due to changes in the LaTeX kernel. The error message
is as follows:

```
Extra \or.
\end{umlcall}
```

### Minimal Example to Reproduce the Issue

The following minimal LaTeX example will trigger the error:

```latex
\documentclass{article}
\usepackage{tikz-uml}

\begin{document}

\begin{tikzpicture}
  \begin{umlseqdiag}
    \umlobject[class=A]{a}
    \umlobject[class=B]{b}
    \umlobject[class=C]{c}
    \begin{umlcall}{a}{b}
      \begin{umlcall}{b}{c}
      \end{umlcall}
    \end{umlcall}
  \end{umlseqdiag}
\end{tikzpicture}

\end{document}
```

### Cause of the Issue

This issue arises due to a conflict between the `tikz-uml` package and the
updated LaTeX kernel, which introduced changes in handling logical operators
like `\or`. The `tikz-uml` package's implementation of `\umlcall` does not
account for these changes, leading to the error.

## Solution

The solution to this problem is based on a fix provided in a [StackExchange answer]. This repository includes:

- `tikz-uml.v1.0-2016-03-29.sty`: The original `tikz-uml.sty` file (v1.0-2016-03-29).
- `umlcall.patch`: A patch file to fix the issue in the `tikz-uml.sty` package.
- `get_texmf_dir.sh`: A script to identify the local `texmf` directory path.
- `Makefile`: Automates the process of applying the patch and installing the patched version.

## How to Use

### Prerequisites

- TeX Live 2022 or later.
- The `patch` command-line tool installed (default in most Unix-like systems).
- Access to the local `texmf` directory (usually located under `/usr/local/share/texmf/` or a similar path).

### Instructions

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/Haixing-Hu/patched-tikz-uml.git
   cd patched-tikz-uml
   ```

2. **Apply the Patch**:
   Use the `Makefile` to generate a patched version of the `tikz-uml.sty` file:
   ```bash
   make patch
   ```

3. **Install the Patched File**:
   Install the patched file into your local `texmf` directory:
   ```bash
   make install
   ```

4. **Verify the Fix**:
   Compile the minimal example provided above to ensure the error no longer occurs.


The above step 2 and step 3 can be combined into a single command:
```bash
make
```

### Clean Up

To remove any generated files, use:
```bash
make clean
```

## Acknowledgements

The patch solution originates from this [StackExchange answer]. Special thanks
to the community for providing this workaround.

## Repository Purpose

This repository is not affiliated with the original `tikz-uml` project. It
exists solely to provide a workaround for the compatibility issue with
TeX Live 2022 and later. Since the original project does not appear to have
an official repository, this patch is shared here to assist users.

## License

This repository is distributed under the [MIT License](LICENSE).


[StackExchange answer]: https://tex.stackexchange.com/questions/690613/tikz-uml-extra-or-endumlcall-issue-returned-on-new-tex-versions/725846#725846