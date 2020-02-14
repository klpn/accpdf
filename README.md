# accpdf
Experiments with creating accessible PDFs from Pandoc, see
[Pandoc #5409](https://github.com/jgm/pandoc/issues/5409).

* Running `make pdf` in a dpcument subdirectory, e.g. `tagged-pres`
  should produce a tagged PDF/A-2a file using Lualatex via Pandoc,
  from the markdown sources in the directory and the Pandoc
  templates and Lua filters in the `common` directory.
* The tag structure in the resulting PDF can be inspected using
  the [Poppler](https://poppler.freedesktop.org/) pdfinfo utility,
  e.g. `pdfinfo -struct-text tagged-pres.pdf`.
* The file can be validated as PDF/A using
  [veraPDF](https://docs.verapdf.org/install/), e.g.
  `~/verapdf/verapdf tagged-pres.pdf`. Use the latest version of
  veraPDF.