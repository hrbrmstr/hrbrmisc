hhs_breaches_req <- function(start=0, end=1000) {

  httr::POST(
    url = "https://ocrportal.hhs.gov/ocr/breach/breach_report.jsf",
    httr::add_headers(
      `Origin` = "https://ocrportal.hhs.gov",
      `Faces-Request` = "partial/ajax",
      `X-Requested-With` = "XMLHttpRequest",
      `Accept` = "application/xml, text/xml, */*; q=0.01",
      `Referer` = "https://ocrportal.hhs.gov/ocr/breach/breach_report.jsf"),
    body = list(
      javax.faces.partial.ajax = "true",
      javax.faces.source = "ocrForm:reportResultTable",
      javax.faces.partial.execute = "ocrForm:reportResultTable",
      javax.faces.partial.render = "ocrForm:reportResultTable",
      `ocrForm:reportResultTable` = "ocrForm:reportResultTable",
      `ocrForm:reportResultTable_pagination` = "true",
      `ocrForm:reportResultTable_encodeFeature` = "true",
      `ocrForm` = "ocrForm",
      `ocrForm:submissionStartDate_input` = "",
      `ocrForm:submissionEndDate_input` = "",
      `ocrForm:ceType_input` = "",
      `ocrForm:ceType_focus` = "",
      `ocrForm:state_input` = "",
      `ocrForm:state_focus` = "",
      `ocrForm:obo_input` = "",
      `ocrForm:obo_focus` = "",
      `ocrForm:searchText` = "",
      `ocrForm:searchCEName` = "",
      `ocrForm:reportResultTable_first` = start,
      `ocrForm:reportResultTable_rows` = end),
    encode = "form") -> res

  httr::stop_for_status(res)

  pg <- httr::content(res)

  rvest::html_nodes(pg, "extension[type='args']") %>%
    rvest::html_text() %>%
    jsonlite::fromJSON() -> tot

  rvest::html_nodes(pg, "update[id='ocrForm:reportResultTable']") %>%
    rvest::html_text() %>%
    sprintf("<table>%s</table>", .) %>%
    xml2::read_html() %>%
    rvest::html_table() %>%
    .[[1]] -> df

  list(tot=tot$totalRecords, df=df)

}

#' Retrieve current public list of U.S. Health & Human Services Breaches
#'
#' Recrods only for those impacting 500 or more persons
#'
#' @export
hhs_breaches <- function() {

  tmp <- hhs_breaches_req(0, 1)

  purrr::map(seq(1, tmp$tot, 500)-1, hhs_breaches_req, end=500) %>%
    purrr::map_df("df") -> out

  dplyr::select(out, -1) %>%
    setNames(c("covered_entity_name", "state", "covered_entity_type", "individuals_effected",
               "breach_submission_date", "breach_type", "breach_information_location",
               "business_associate_present", "web_description")) %>%
    dplyr::mutate(breach_submission_date=as.Date(breach_submission_date, format="%m/%d/%Y")) %>%
    dplyr::tbl_df() -> out

  suppressMessages(readr::type_convert(out))

}
