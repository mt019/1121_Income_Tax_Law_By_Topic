#' Generate robots.txt and sitemap.xml for the built GitBook.
#'
#' This script assumes the HTML output lives in `docs/`.

output_dir <- "docs"
base_url <- "https://mt019.github.io/1121_Income_Tax_Law_By_Topic/"

if (!dir.exists(output_dir)) {
  stop("Output directory 'docs/' not found. Please build the book before running this script.")
}

robots_path <- file.path(output_dir, "robots.txt")
cat(
  "User-agent: *\n",
  "Allow: /\n",
  "\n",
  "Sitemap: ", base_url, "sitemap.xml\n",
  file = robots_path,
  sep = ""
)

html_files <- list.files(
  output_dir,
  pattern = "\\.html$",
  ignore.case = TRUE,
  full.names = FALSE
)

html_files <- html_files[!grepl("^libs/", html_files)]
html_files <- setdiff(html_files, "404.html")

relative_paths <- html_files
relative_paths[relative_paths == "index.html"] <- ""

if (length(relative_paths) == 0) {
  stop("No HTML files detected in 'docs/'. Did the book render correctly?")
}

file_info <- file.info(file.path(output_dir, html_files))

encode_url <- function(path) {
  utils::URLencode(paste0(base_url, path), reserved = TRUE)
}

sitemap_entries <- Map(
  function(url, mtime) {
    paste0(
      "  <url>\n",
      "    <loc>", url, "</loc>\n",
      "    <lastmod>", format(mtime, "%Y-%m-%d"), "</lastmod>\n",
      "    <changefreq>weekly</changefreq>\n",
      "  </url>\n"
    )
  },
  encode_url(relative_paths),
  file_info$mtime
)

sitemap_path <- file.path(output_dir, "sitemap.xml")

cat(
  '<?xml version="1.0" encoding="UTF-8"?>\n',
  '<urlset xmlns="https://www.sitemaps.org/schemas/sitemap/0.9">\n',
  paste0(sitemap_entries, collapse = ""),
  "</urlset>\n",
  file = sitemap_path,
  sep = ""
)
