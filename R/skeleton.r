hrbrmstr_pkg_skeleton = function(pkg_path, ...) {

  dir.create(pkg_path, recursive = TRUE, showWarnings = FALSE)

  dir.create(file.path(pkg_path, "R"))
  dir.create(file.path(pkg_path, "tests", "testthat"), recursive = TRUE)

  rsrc <-  system.file('rstudio', 'templates', 'project', 'resources', package = "hrbrmisc")

  files <- list.files(rsrc, recursive = TRUE, include.dirs = FALSE)

  src <- file.path(rsrc, files)
  dst <- file.path(pkg_path, files)

  file.copy(src, dst)

  pkg_name <- basename(pkg_path)

  list.files(pkg_path, recursive = TRUE, include.dirs = FALSE, full.names = TRUE) %>%
    purrr::walk(function(x) {
      readr::read_lines(x) %>%
        stri_replace_all_fixed("PACKAGE", pkg_name) %>%
        readr::write_lines(x)
    })

  dots <- list(...)
  purrr::walk(seq_along(dots), function(i) {

    key <- names(dots)[[i]]
    val <- dots[[i]]

    if ((key == "Rcpp") && (val)) devtools::use_rcpp(pkg = pkg_path)

  })

  devtools::use_git(pkg = pkg_path)
  devtools::document(pkg = pkg_path)

  return(TRUE)

}
