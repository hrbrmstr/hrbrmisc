add_subtitle <- function() {

  context <- rstudioapi::getActiveDocumentContext()

  rstudio_input_text <- trimws(context$selection[[1]]$text)

  stopifnot(nchar(rstudio_input_text) > 0)

  if (grepl('[\\+\\(]', rstudio_input_text)) {
    gg_original <- eval(parse(text = rstudio_input_text))
  } else {
    gg_original <- get(rstudio_input_text, envir = .GlobalEnv)
  }

  stopifnot(is.ggplot(gg_original))

  ui <- miniPage(
    gadgetTitleBar("Add Subtitle"),
    miniContentPanel(
      fillRow(height='75%', style="margin-bottom:10px",
              plotOutput("curr_plot", width='100%', height='100%')
      ),
      fillRow(height="25%",
              tags$div(style="display:table; width:99%; margin:auto",
                       tags$textarea(id="subtitle", label="Subtitle",
                                     rows=3, cols=40, "A boring subtitle",
                                     style="width:inherit; padding=5px;"
                       ),
                       numericInput("wrap", "Wrap", "100", min = 10)
              )
      )
    )
  )

  server <- function(input, output, session) {

    gg_reactive <- reactive({
      wrap_len <- 100
      if (length(input$wrap) > 0) {
        wrap_len  <- input$wrap
      }
      subt <- paste0(strwrap(input$subtitle, wrap_len), sep="", collapse="\n")
      ggplot_with_subtitle(gg_original, subt)
    })

    current_plot <- renderPlot({
      gg_reactive()
    })

    output$curr_plot <- current_plot

    observeEvent(input$done, {
      rstudioapi::insertText(sprintf("subt <- '%s'\n", input$subtitle))
      rstudioapi::insertText(sprintf('subt <- paste0(strwrap(subt, %s), sep="", collapse="\\n")\n', input$wrap))
      rstudioapi::insertText(sprintf("ggplot_with_subtitle(%s, subt)\n", rstudio_input_text))
    })

    observeEvent(input$cancel, {
      invisible(stopApp())
    })

  }

  viewer <- paneViewer(minHeight="maximize")

  runGadget(ui, server, viewer = viewer)

}
