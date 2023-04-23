
<!-- README.md is generated from README.Rmd. Please edit that file -->
`hrbrmisc` is @hrbrmstr's personal R pkg and unlikely to ever make it to CRAN

Features
--------

### Predicate-y

-   `%!fmin%`: Shortcuts for 'fmatch' and 'match' operations
-   `%!in%`: Shortcuts for 'fmatch' and 'match' operations
-   `%fmin%`: Shortcuts for 'fmatch' and 'match' operations
-   `%||0%`: Is an object 'NULL' or length zero
-   `%||0NA%`: Is an object 'NULL' or length zero or 'NA'
-   `is_empty_string`: Is a string equivalent to '""'
-   `is_zero_length`: Is length 0

### Utility

-   `as_date`: Shortcut to avoid specifying origin
-   `has_env`: Does the environment variable exist?
-   `last_el`: get last element
-   `make_numeric`: Clean up a character vector to make it numeric
-   `make_percent`: Clean up a character vector to make it a percent
-   `qp_decode`: Decode a quoted printable string

### Da-BOM

-   `has_bom`: Tests whether a raw httr response or character vector has a byte order mark (BOM)
-   `sans_bom`: Remove byte order mark (BOM) from 'httr::response' object or character vector

Code of Conduct
---------------

Please note that this project is released with a [Contributor Code of Conduct](CONDUCT.md). By participating in this project you agree to abide by its terms.
