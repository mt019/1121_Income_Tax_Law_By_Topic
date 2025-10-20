#!/bin/sh

set -ev

PROJECT_ROOT=$(cd "$(dirname "$0")/../.." && pwd)
cd "$PROJECT_ROOT"

Rscript - <<'RS'
full <- tolower(Sys.getenv("BUILD_FULL", "true"))
formats <- c("bookdown::gitbook")
if (full %in% c("true", "1", "yes", "on")) {
  formats <- c(formats, "bookdown::pdf_book", "bookdown::epub_book")
}
for (fmt in formats) {
  message("Rendering format: ", fmt)
  bookdown::render_book(
    input = "index.Rmd",
    output_format = fmt,
    clean_envir = FALSE,
    new_session = FALSE
  )
}
RS
Rscript ops/scripts/generate_seo_files.R
