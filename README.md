
<!-- README.md is generated from README.Rmd. Please edit that file -->
`hrbrmisc` is @hrbrmstr's personal R pkg

### Functions

#### Predicate-y

-   `%!fmin%`: Shortcuts for 'fmatch' and 'match' operations
-   `%!in%`: Shortcuts for 'fmatch' and 'match' operations
-   `%fmin%`: Shortcuts for 'fmatch' and 'match' operations
-   `%||0%`: Is an object 'NULL' or length zero
-   `%||0NA%`: Is an object 'NULL' or length zero or 'NA'

#### dplyr-is

-   `count_pct`: Shortcut for adding percentages to 'dplyr::count' summaries

#### grep-py

-   `ggrep`: Shorthand helpers for base 'grep' and 'grepl'
-   `igrep`: Shorthand helpers for base 'grep' and 'grepl'
-   `igrepl`: Shorthand helpers for base 'grep' and 'grepl'
-   `vgrep`: Shorthand helpers for base 'grep' and 'grepl'
-   `vigrep`: Shorthand helpers for base 'grep' and 'grepl'
-   `is_empty_string`: Is a string equivalent to '""'
-   `is_zero_length`: Is length 0
-   `last_el`: get last element
-   `lgrep`: Shorthand helpers for base 'grep' and 'grepl'

#### Utility

-   `make_numeric`: Clean up a character vector to make it numeric
-   `make_percent`: Clean up a character vector to make it a percent
-   `as_date`: Shortcut to avoid specifying origin
-   `qp_decode`: Decode a quoted printable string
-   `sans_bom`: Remove byte order mark (BOM) from 'httr::response' object or character vector
-   `has_bom`: Tests whether a raw httr response or character vector has a byte order mark (BOM)
-   `has_env`: Does the environment variable exist?

#### httr-ish

-   `sDELETE`: "Safe" versions of 'httr' functions
-   `sGET`: "Safe" versions of 'httr' functions
-   `sHEAD`: "Safe" versions of 'httr' functions
-   `sPATCH`: "Safe" versions of 'httr' functions
-   `sPOST`: "Safe" versions of 'httr' functions
-   `sPUT`: "Safe" versions of 'httr' functions
-   `sVERB`: "Safe" versions of 'httr' functions

#### ggplot2-y

-   `gbarplot`: Quick way to replace the handy 'barplot'
-   `quick_map`: Plot a fortified map using coord\_quickmap
-   \`theme\_hrbrmstr My ggplot2 go-to theme
-   `title_left`: Completely flush-left-align ggplot2 title

#### "Cyber"

-   `hhs_breaches`: Retrieve current public list of U.S. Health & Human Services Breaches
-   `host_up`: Is a host listening on a port (TCP)?
-   `get_public_dns_servers`: Get public DNS servers list

### Code of Conduct

Please note that this project is released with a [Contributor Code of Conduct](CONDUCT.md). By participating in this project you agree to abide by its terms.
