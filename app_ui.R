library(ggplot2)

main <- fluidPage(
  tags$div(h1("App Store & Google Play Comparison")),
  tags$img(src="https://www.hallmanagementgroup.com/wp-content
                /uploads/2018/10/google-play-app-store-badges-5926
                dec63df78cbe7eaf4f9e.jpg", width = 600, height = 400),
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
         “Mobile App Store” (collected July 2017) and “Google 
         Play Store Apps”(April 2019). These two data sets 
         contain information regarding apps on the Apple App 
         Store and Google Play Store such as price, rating, 
         genre, size, and content rating. We will be analyzing 
         and comparing the previously mentioned data sets to 
         determine what makes an app successful on the different 
         app stores. This data will create useful mobile app 
         analytics to help developers understand existing strategies 
         and categories that drive growth and retention of 
         future app users.")
)
########################################
########################################
tab_1_options <- sidebarPanel(
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
  selectInput(
    "app_store",
    label = "Appstore Selection",
    choices = list(
      "Google" = "google",
      "Apple" = "apple"
    )
  )
)

tab_1_main <- mainPanel(
  plotlyOutput("pie")
)

tab_1 <-  sidebarLayout(
    tab_1_options,
    tab_1_main
  )
########################################
########################################
tab_2_content <- sidebarPanel(
  radioButtons(
    inputId = "app_store_2",
    label = "Which app store?",
    choices = list(
      "Apple" = "apple", "Google" = "google"
    )
  ),
  numericInput("count", "Categories with more than ____ total applications:", 1, min = 1, max = 30000)
)
tab_2_main <- mainPanel(
  plotlyOutput("histogram")
)
tab_2 <- sidebarLayout(
  tab_2_content,
  tab_2_main
)
########################################
########################################
tab_3_content <- sidebarPanel(
  radioButtons(
    inputId = "app_store_3",
    label = "Which app store?",
    choices = list(
      "Apple" = "apple", "Google" = "google"
    )
  ),
  radioButtons(
    inputId = "paid_free",
    label = ("Include free applications into calculation?"),
    choices = list(
      "Yes" = "overall_avg_price", "No" = "paid_avg_price"
    )
  ),
    numericInput("count_2", "Categories with more than ____ total applications:", 1, min = 1, max = 30000)
)
tab_3_main <- mainPanel(
  plotlyOutput("scatter")
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
         than their younger counterparts."),
  tags$div(h3("Histogram Chart")),
  tags$p("For this plot we created a bar chart for 
         both Google Play Store and Apple App Store 
         that shows the number of applications that 
         were uploaded into each category. This chart 
         was included to visually show which categories 
         were more saturated with apps. For the Google 
         Play Store it was “Education” and for the Apple 
         App Store it was “Games”. Using these charts app
         developers are able to determine which genre of 
         apps they should be developing for. Since the 
         categories that are heavily saturated with the 
         same types of apps will make it harder for 
         individual apps to stand out amongst the others. 
         The app will become lost amid the sea of similar 
         apps making it difficult to find on each respective 
         app store, ultimately impacting the number of 
         downloads and revenue it will receive."),
  tags$div(h3("Scatter Plot")),
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

########################################
########################################
# about us 
member_main <- fluidPage(
  tags$div(h1("About US")),
  tags$div(h2("Team name: \" *GrOuP **NAmE** \" ")),
  # member 1
  tags$div(h3("Danell")), 
  tags$p(""),
  # member 2
  tags$div(h3("Edward Sung")),
  tags$p("Hello, my name is Edward. I am currenly a sophomore at UW. 
         My intended major is Informatics. 
         Fun Facts: Please subscribe my Yotube Channel and follow my
         photography account: edwardphotholic."),
  tags$img(src= "./photos/IMG_6860 2.jpg", width = 600, height = 400),
  # member 3
  tags$div(h3("Alex")),
  tags$p(""),
  # member 4
  tags$div(h3("Rhea")),
  tags$p("")
)
########################################
########################################
library(shinythemes) 
ui <- fluidPage(
  theme = shinytheme("superhero"),
  navbarPage("INFO 201 Final",
    tabPanel("Main table", main),
    tabPanel("About us", member_main),
    tabPanel("Pie Chart", tab_1),
    tabPanel("Histogram", tab_2),
    tabPanel("Scatterplot", tab_3),
    tabPanel("Conclusion", conclu_tab)
    )
)


