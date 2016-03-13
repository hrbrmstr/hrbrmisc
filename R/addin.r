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
    fillRow(height="3%", width="100%",
            tags$div("A glitch causes plot to disappear occassionally. Hit Enter in title text box to refresh.",
                     style="color:#9ebcda; margin:auto; margin-top:5px; text-align:center; font-size:8pt")
    ),
    fillRow(height='57%', style="margin-bottom:10px",
            miniContentPanel(
              plotOutput("curr_plot", width='100%', height='100%')
            )
    ),
    fillRow(width="100%", height="10%",
            tags$div(style="display:table; width:99%; margin:auto",
                     tags$textarea(id="subtitle", label="Subtitle",
                                   rows=2, cols=40, "A boring subtitle",
                                   style="width:inherit; font-size:9pt; padding:5px; margin-bottom:300px"
                     )
            )
    ),
    fillRow(width="100%", height="9%",
            textInput("fontfamily", "Font Family", value="Helvetica", width="130px"),
            numericInput("wrap", "Wrap", value="100", min=10, width="100px"),
            numericInput("fontsize", "Font size", value="10", min=1, width="100px")
    ),
    fillRow(width="100%", height="2%", tags$div()),
    fillRow(width="100%", height="9%",
            numericInput("hjust", "Horiz just", value="0", min=0, max=1, width="100px", step=0.5),
            numericInput("vjust", "Vert just", value="0", min=0, max=1, width="100px", step=0.5),
            numericInput("bottom_margin", "Bottom margin", value="5.5", min=0, width="100px")
    )
    )
  )

  server <- function(input, output, session) {

    gg_reactive <- reactive({

      subt <- paste0(strwrap(input$subtitle, input$wrap), sep="", collapse="\n")

      ggplot_with_subtitle(gg_original,
                           label=subt,
                           fontfamily=input$fontfamily,
                           fontsize=input$fontsize,
                           hjust=input$hjust,
                           vjust=input$vjust,
                           bottom_margin=input$bottom_margin)

    })

    current_plot <- renderPlot({ gg_reactive()  })

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
