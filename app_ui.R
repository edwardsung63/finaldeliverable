# library loaded
library(ggplot2)

# main page content(breif intro and overview)
main <- fluidPage(
  tags$div(h1("App Store & Google Play Comparison")),
  tags$img(src = "https://i.ibb.co/wSSv8zQ/f95x3MR.png"),
  textInput(
    inputId = "username",
    label = h3("Type in your name")
  ),
  textOutput(outputId = "out_message"),
  tags$div(h2("Introduction")),
  tags$p(sep = "\n", "As a result of smartphones slowly
         becoming a crucial part of modern day society,
         the demand for mobile applications has increased
         greatly. We have downloaded two different datasets
         'Mobile App Store' (collected July 2017) and 'Google
         Play Store Apps' (April 2019). These two data sets
         contain information regarding apps on the Apple App
         Store and Google Play Store such as price, rating,
         genre, size, and content rating. We will be analyzing
         and comparing the previously mentioned data sets to
         determine what makes an app successful on the different
         app stores. This data will create useful mobile app
         analytics to help developers understand existing strategies
         and categories that drive growth and retention of
         future app users."),
  tags$div(h2("Overview - Questions")),
  tags$p(sep = "\n", "What categories of apps are the most downloaded?"),
  tags$p("What type of mobile games generate the most revenue?"),
  tags$p("What factors determine the overall success of a mobile game?"),
  tags$p("What is the association between ratings and reviews vs the
         amount of installs?"),
  tags$p("What is the relationship between the Content Rating the average
         rating, review, revenue and installations?")
)
########################################
########################################
# tab 1 for pie chart
tab_1_options <- sidebarPanel(
  # first widget 
  selectInput(
    "age_group",
    label = "Age Group",
    choices = list(
      "Ages 4+" = "4",
      "Ages 9+" = "9",
      "Ages 12+" = "12",
      "Ages 17+" = "17"
    )
  ),
  # second widget
  selectInput(
    "app_store",
    label = "Appstore Selection",
    choices = list(
      "Google" = "google",
      "Apple" = "apple"
    )
  )
)
# the main tab on the page 
tab_1_main <- mainPanel(
  plotlyOutput("pie"),
  tags$p("The reason why we created pie chart is to
  show the distributions of spending on apps in
  different age groups. As the size and proportion
  showed by pie charts, we can easily get the idea
  of which category attracts relatively more or less
  people. As we can see from the charts, top few
  categories in Google Play Store are mostly education
  apps for ages 4+, games apps for ages 12+, sports apps
  for ages 9+ and 17+. For the education apps downloaded
  by ages 4+, we can assume that parents or gaurdians
  might be the users who download the apps for their kids.
  For the Google Play Store pie chart, we can see that there
  are a lot more categories than that in the Apple pie chart.
  Most of them seem repeated a subcategory of the main category.
  "),
  tags$p("For the Apple App Store pie chart data, it
         also follows a similar trend where for ages 4+ a
         majority of spending is towards the education or
         games category. It mirrors what we described that
         parents buy educational apps to encourage early
         learning. We can see that at ages 9+, 12+, and 17+,
         that games have become a huge spending category.
         For ages 17+, they tend to spend more towards
         productivity, social networking, food and drinks
         than their younger counterparts.")
)
# combining them together
tab_1 <- sidebarLayout(
  tab_1_options,
  tab_1_main
)
########################################
########################################
# tab 2 for the bar chart
tab_2_content <- sidebarPanel(
  # first widget
  radioButtons(
    inputId = "app_store_2",
    label = "Which app store?",
    choices = list(
      "Apple" = "apple", "Google" = "google"
    )
  ),
  # second widget
  numericInput("count", "Categories with more than ____
               total applications:", 1, min = 1, max = 30000)
)
# main tab on the page
tab_2_main <- mainPanel(
  plotlyOutput("bar_chart"),
  tags$p("For this plot we created a bar chart for
         both Google Play Store and Apple App Store
         that shows the number of applications that
         were uploaded into each category. This chart
         was included to visually show which categories
         were more saturated with apps. For the Google
         Play Store it was 'Education' and for the Apple
         App Store it was 'Games'. Using these charts app
         developers are able to determine which genre of
         apps they should be developing for. Since the
         categories that are heavily saturated with the
         same types of apps will make it harder for
         individual apps to stand out amongst the others.
         The app will become lost amid the sea of similar
         apps making it difficult to find on each respective
         app store, ultimately impacting the number of
         downloads and revenue it will receive.")
)
# conbining two bars together
tab_2 <- sidebarLayout(
  tab_2_content,
  tab_2_main
)
########################################
########################################
# tab three for scatter plot
tab_3_content <- sidebarPanel(
  # first widget
  radioButtons(
    inputId = "app_store_3",
    label = "Which app store?",
    choices = list(
      "Apple" = "apple", "Google" = "google"
    )
  ),
  # second widget
  radioButtons(
    inputId = "paid_free",
    label = ("Include free applications into calculation?"),
    choices = list(
      "Yes" = "overall_avg_price", "No" = "paid_avg_price"
    )
  ),
  # third widget 
  numericInput("count_2", "Categories with more than ____
               total applications:", 1, min = 1, max = 30000)
)
# main tab on the page
tab_3_main <- mainPanel(
  plotlyOutput("scatter"),
  tags$p("This scatter plot is created to show the
          correlation between the average listing price and
          the average rating of apps. The listing price of apps
          will affect whether someone is willing to download that
          app, if the price is too high that will usually result
          in people not downloading the app. By using this plot
          developers are able to see how satisfied people are in
          comparison with the listed price to determine what price
          to list their apps to maximize the chances of success.
          For the Google Play Store we can see that games tend
          to cost more while also obtaining high ratings.
          Applications that were cheap and also had high ratings
          were applications within the books and reference category.
          For the Apple App Store, applications in the medical
          category tend to cost a lot more than other categories
          but were also rated low. This could be that medical
          information is highly profitable but were not meeting
          to the consumers needs. Apps that did well in ratings
         were also lower priced. These categories were
         productivity and music.")
  
)
# conbining them together
tab_3 <- sidebarLayout(
  tab_3_content,
  tab_3_main
)
########################################
########################################
# conclusion tab
conclu_tab <- mainPanel(
  tags$div(h1("Conclusion")),
  tags$div(h3("Pie Chart")),
  tags$div(h3("Histogram Chart")),
  tags$div(h3("Scatter Plot"))
)
tab_3 <- sidebarLayout(
  tab_3_content,
  tab_3_main
)
########################################
########################################
# conclusion tab
conclu_tab <- mainPanel(
  tags$div(h1("Conclusion")),
  tags$div(h3("Pie Chart")),
  tags$div(h3("Histogram Chart")),
  tags$div(h3("Scatter Plot"))
)

########################################
########################################
# about us
member_main <- fluidPage(
  tags$div(h1("About US")),
  tags$div(h2("Team name: \" *GrOuP **NAmE** \" ")),
  # member 1
  tags$div(h3("Danell")),
  tags$p("Hello! My name is Danell and I am currently a junior at UW.
         My intended major is Informatics / Applied Mathematics.
         Fun Facts: I love playing tennis and video games in my freetime."),
  # member 2
  tags$div(h3("Edward Sung")),
  tags$p("Hello, my name is Edward. I am currently a sophomore at UW.
         My intended major is Informatics.
         Fun Facts: Please subscribe my Youtube Channel and follow my
         photography account: edwardphotholic."),
  tags$img(src = "https://i.ibb.co/b24ddrw/IMG-6860-2.jpg", width = 308, height = 305),
  # member 3
  tags$div(h3("Alex")),
  tags$p("Hi! My name is Alex. I am currently a senior at the 
         University Washington. I am a Interdisciplinary Visual
         Arts major with a minor in DXARTS, Informatics, and
         Art History. 
         Fun Facts: I am a travel filmmaker and photographer and
         currently the lead creative videographer/photographer at
         UW Recreation. Checkout my Instagram: @Alex._Chen"),
  tags$img(src = "https://i.ibb.co/Sy3C38H/Alex.jpg", width = 265, height = 332),
  # member 4
  tags$div(h3("Rhea")),
  tags$p("")
)
########################################
########################################
# adding theme for the shinyApp interface
library(shinythemes)
ui <- fluidPage(
  theme = shinytheme("superhero"),
  navbarPage("INFO 201 Final",
  tabPanel("Main table", main),
  tabPanel("Pie Chart", tab_1),
  tabPanel("Bar Chart", tab_2),
  tabPanel("Scatterplot", tab_3),
  tabPanel("Conclusion", conclu_tab),
  tabPanel("About us", member_main)
    )

)
