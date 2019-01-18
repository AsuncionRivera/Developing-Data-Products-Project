DEVELOPING DATA PRODUCTS PROJECT 
========================================================
author: AVR
date: January 11, 2019
autosize: true

The Requirement
========================================================
From Coursera : 

"This peer assessed assignment has two parts. First, you will create a Shiny application and deploy it on Rstudio's servers. Second, you will use Slidify or Rstudio Presenter to prepare a reproducible pitch presentation about your application.

Your Shiny Application

(1) Write a shiny application with associated supporting documentation. The documentation should be thought of as whatever a user will need to get started using your application.
(2) Deploy the application on Rstudio's shiny server
(3) Share the application link by pasting it into the provided text box
(4) Share your server.R and ui.R code on github"


Background
========================================================

A certain company (which I can't disclose) has been selling a certain product (which I can't disclose as well) for 2 years (2017 & 2018). 

The monthly sales data (number of units sold per month per year) path : https://github.com/AsuncionRivera/Developing-Data-Products-Project/blob/gh-pages/salestotal.csv.

The server.R's path : https://github.com/AsuncionRivera/Developing-Data-Products-Project/blob/gh-pages/server.R.

The ui.R's path : https://github.com/AsuncionRivera/Developing-Data-Products-Project/blob/gh-pages/ui.R.



My Project
========================================================

The interactive application can be run by clicking here : https://ariveraapps.shinyapps.io/DDPAVRProject/

My shiny application has 2 user interactions and 2 tabs. The **1st interaction** is a **dropdown** (*selectInput*) field containing  '**2017**' and '**2018**'. The user should choose a year, then the application would then display the monthly sales for that year **in the first tab**.  The **2nd interaction** asks the user **how many % increase in sales** would he want **by end of 2019**.  The % encoded in the side panel would be used to *compute* for the target EOP Sales for 2019 and would then be shown **in the second tab**.  NOTE : if the % would not be encoded in the side panel, then there would be **no answer**/**computation** in the 2nd tab.



Slide With Code
========================================================

```r
library(shiny)
shinyUI(fluidPage(
  titlePanel("SALES SCORECARD & TARGET SETTING"),
  sidebarLayout(
    sidebarPanel(
       selectInput("variable", "Display Sales for the Year : ", c("2017" = "YR2017","2018" = "YR2018")),
       textInput("box1", "Enter % Increase : ", value = "Tab1")
    ),
    mainPanel(
       tabsetPanel(
                   tabPanel("SALES", br(), tableOutput("data")),
                   tabPanel("TARGET SETTING",  br(), wellPanel("EOP Sales is 786202. With the desired % increase of", textOutput("out1"), "the 2019 EOP Target is :", textOutput("calc_target")))
                   )
  )
  )
)
)
```

<!--html_preserve--><div class="container-fluid">
<h2>SALES SCORECARD &amp; TARGET SETTING</h2>
<div class="row">
<div class="col-sm-4">
<form class="well">
<div class="form-group shiny-input-container">
<label class="control-label" for="variable">Display Sales for the Year : </label>
<div>
<select id="variable"><option value="YR2017" selected>2017</option>
<option value="YR2018">2018</option></select>
<script type="application/json" data-for="variable" data-nonempty="">{}</script>
</div>
</div>
<div class="form-group shiny-input-container">
<label for="box1">Enter % Increase : </label>
<input id="box1" type="text" class="form-control" value="Tab1"/>
</div>
</form>
</div>
<div class="col-sm-8">
<div class="tabbable">
<ul class="nav nav-tabs" data-tabsetid="8180">
<li class="active">
<a href="#tab-8180-1" data-toggle="tab" data-value="SALES">SALES</a>
</li>
<li>
<a href="#tab-8180-2" data-toggle="tab" data-value="TARGET SETTING">TARGET SETTING</a>
</li>
</ul>
<div class="tab-content" data-tabsetid="8180">
<div class="tab-pane active" data-value="SALES" id="tab-8180-1">
<br/>
<div id="data" class="shiny-html-output"></div>
</div>
<div class="tab-pane" data-value="TARGET SETTING" id="tab-8180-2">
<br/>
<div class="well">
EOP Sales is 786202. With the desired % increase of
<div id="out1" class="shiny-text-output"></div>
the 2019 EOP Target is :
<div id="calc_target" class="shiny-text-output"></div>
</div>
</div>
</div>
</div>
</div>
</div>
</div><!--/html_preserve-->


