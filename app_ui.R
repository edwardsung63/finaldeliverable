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
  tags$p("The pie chart visually shows the distribution of
          downloads of apps from each age group. The size and
          proportion of the categories in the pie chart easily
          show which app categories are most popular in each age
          group.")
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
  tags$p("A bar chart was created for both Google Play Store 
          and Apple App Store to show the number of applications 
          that were uploaded into each category. This chart visually 
          shows which categories were the most and least app populated.")
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
  tags$p("This scatter plot was created to show the
          correlation between the average listing price and
          the average rating of apps. The listing price of apps
          is a factor that will affect whether someone is willing 
          to download that app.")
  
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
  tags$p("The pie chart visually shows the distribution of
          downloads of apps from each age group and the size of the
          slice easily shows which categories are most popular in
          each age group. This will help developers target which
          app genre they should develop based on their target
          audience's age.
          For the Google Play Store it seems that the most popular
          category for age 4+ is education, which shows that parents
          are downloading educational apps for growing children. And
          as the consumer mature's their interests also shifts to
          Game Role Playing at age 9+, Sports at age 12+, and 
          Entertainment at 17+.
          For the Apple App Store at age 4+ the most popular category
          is Games, this could be because parents are giving their
          young children games to stimulate their brains and keep them
          busy. And at age 9+ its Games, 12+ is Games, 17+ is Games. This
          pattern shows that users of the Apple App Store are more inclined
          to download games compared to the other categories. This will
          help developers decide what genre of apps to develop based on
          their target audience. For the Google Play Store it would be
          dependant on their age, while in the Apple App Store it would
          be better to develop a game."),
  tags$div(h3("Bar Chart")),
  tags$p("After anaylzing the bar chart the most populated app category
          in the Google Play Store is the Education category with 32247 
          apps, and for the Apple App Store it was the Games category 
          with 3862 apps. By using this bar chart app developers are 
          able to determine which app category they should develop apps 
          for. Since the categories that are heavily saturated with apps 
          will make it harder for individual apps to stand out amongst the
          other apps. The app could become lost amongst the sea of
          similar apps, making it difficult for consumers to find it
          on the app store, ultimately impacting the number of
          downloads and revenue developers will receive.
          This chart shows that it will be harder to gain popularity
          for newly developed apps in the Education category for the
          Google Play Store and in the Games category for the Apple
          App Store."),
  tags$div(h3("Scatter Plot")),
  tags$p("The scatter plot shows visually the comparison between the
          average price of apps and the average rating of apps. 
          The listing price of apps is a factor that will affect whether 
          someone is willing to download that app, if the price is too high 
          it will usually result in less people downloading the app. By 
          using this plot, developers are able to see how satisfied 
          people are with the app in comparison with the listed 
          price to determine the optimal listing price for their apps 
          to maximize the chances of success.
          In the Google Play Store we can see that the game categories
          (GAME_ADVENTURE & GAME_ROLE_PLAYING) had higher average listing
          prices than the other app categories, but still obtaining a higher
          app average rating. This indicates that consumers are willing to
          pay more for game apps, because they will get more satisfaction
          out of it than other genre of apps on average.
          For the Apple App Store, applications in the medical
          category tend to cost more than the other categories,
          and had a average rating of 3.37 out of 5. This rating was
          not as low as other categories that charged less, this can
          indicate that consumers are willing to pay more for medical
          applications that provide health information. A possible
          reason for this is that consumers may choose to utilize
          medical apps over going to a physical doctor due to factors
          such as medical costs and convenience.
          category tend to cost a lot more than other categories
          but were also rated low. This could be that medical
          information is highly profitable but were not meeting
          to the consumers needs. Apps that did well in ratings
          were also lower priced. These categories were
          productivity and music."),
  tags$div(h3("Takeaways")),
  tags$p("After analyzing these three charts app developers are able
          to determine what factors will maximize their chances of
          developing a successfull app. The pie chart shows that the most
          popular category for all ages in the Apple App Store is games,
          while in the Google Play Store it shifts from games to Sports
          and Entertainment as the age group matures. These are the categories
          that should be targeted for based on what the target audience's
          age group. The bar chart shows that app developers should be
          cautious in developing apps in the Education category for the
          Google Play Store and Games in the Apple App Store, because those
          categories are heavily populated with apps making it harder for new
          apps to gain popularity. The scatter plot shows which categories will
          give the avgerage highest rating with the highest average listing price,
          thus maximizing revenue because more people will download it. It is
          GAME_ADVENTURE & GAME_PLAYING for the Google Play Store and medical
          for the Apple App Store.")
)
tab_3 <- sidebarLayout(
  tab_3_content,
  tab_3_main
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
