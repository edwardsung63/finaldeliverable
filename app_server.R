library(plotly)
library(ggplot2)
library(stringr)

server <- function(input, output) {
  output$out_message <- renderText({
    msg <- paste0("Hi there, ", input$username, "!")
    return(msg)
  })
  
  output$pie <- renderPlotly({
    if (input$app_store == "apple") {
    age_rating_apple <- apple_cleaned %>%
      group_by(new_content_rating, Category) %>%
      summarise(amount_spent = sum(as.numeric(price), na.rm = TRUE))
    
    data <- age_rating_apple %>% filter(new_content_rating == input$age_group)
    } else {
      age_rating_google <- google_cleaned %>%
        group_by(new_content, Category) %>%
        summarise(amount_spent = sum(price, na.rm = TRUE))
      
      data <- age_rating_google %>% filter(new_content == input$age_group)
    }
    
    fig <- plot_ly(data, labels = ~Category, values = ~amount_spent, type = 'pie', textposition = "inside", name = "4+")
    fig <- fig %>% layout(title = paste0("Spending habits of people ", input$age_group, "+"),
                          xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
                          yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
  })
  output$histogram <- renderPlotly({
    if (input$app_store_2 == "apple") {
      data <- apple_table
    } else {
      data <- google_table
    }
    data <- data %>% filter(count >= input$count)
    fig <- ggplot(
      data = data,
      aes(fill = count, x = Category, y = count)
    ) +
      ggtitle(paste0("Amount of applications per category (", str_to_title(input$app_store_2), ")")) +
      ylab("Number of applications") +
      xlab("Category") +
      geom_bar(stat = "identity", width = 0.8)
    
    fig <- ggplotly(fig)
    fig <- fig %>% layout(xaxis = list(title = ~Category, tickangle = 270))
  })
}