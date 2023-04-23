
[![Project Status: Active – The project has reached a stable, usable
state and is being actively
developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
[![Signed
by](https://img.shields.io/badge/Keybase-Verified-brightgreen.svg)](https://keybase.io/hrbrmstr)
![Signed commit
%](https://img.shields.io/badge/Signed_Commits-8%25-lightgrey.svg)

![Minimal R
Version](https://img.shields.io/badge/R%3E%3D-4.0.0-blue.svg)
![License](https://img.shields.io/badge/License-MIT-blue.svg)

# hrbrmisc

Personal ‘R’ Package of ‘hrbrmstr’

## Description

Tools and functions primarily of use to hrbrmstr.

## What’s Inside The Tin

The following functions are implemented:

- `as_date`: Shortcut to avoid specifying origin
- `do_call`: data first do.call
- `has_bom`: Tests whether a raw httr response or character vector has a
  byte order mark (BOM)
- `has_env`: Does the environment variable exist?
- `is_empty_string`: Is a string equivalent to “”
- `is_zero_length`: Is length 0
- `last_el`: get last element
- `make_numeric`: Clean up a character vector to make it numeric
- `make_percent`: Clean up a character vector to make it a percent
- `map_field_list`: data first lapply ‘\[\[’
- `map_field_simple`: data first sapply ‘\[\[’
- `%fmin%`: Shortcuts for fmatch and match operations
- `month`: Mont of date object
- `null-or-zero-or-na`: Is an object NULL or length zero or NA
- `null-or-zero`: Is an object NULL or length zero
- `pf_grep`: data first grep
- `pf_grepl`: data first grepl
- `pf_gsub`: data first gsub
- `pf_sub`: data first sub
- `qp_decode`: Decode a quoted printable string
- `row_bind_lst`: data first do.call/rbind.data.frame
- `row_bind`: shorter name for rbind.data.frame
- `sans_bom`: Remove byte order mark (BOM) from httr::response object or
  character vector
- `strsplit_one`: data first strsplit
- `year`: Year of date object
- `zeek_conn_states`: Zeek conn-log connection state values and
  descriptions

## Installation

``` r
remotes::install_github("hrbrmstr/hrbrmisc")
```

NOTE: To use the ‘remotes’ install options you will need to have the
[{remotes} package](https://github.com/r-lib/remotes) installed.

## Usage

``` r
library(hrbrmisc)

# current version
packageVersion("hrbrmisc")
## [1] '0.3.0'
```

## Code of Conduct

Please note that this project is released with a Contributor Code of
Conduct. By participating in this project you agree to abide by its
terms.
