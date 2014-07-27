library(shiny)
library(date)
library(data.table)
library(reshape2)
library(googleVis)
library(reldist)


shinyServer(function(input, output) {
  
      data1<-read.csv("data/markham.csv",stringsAsFactors=F)
      data1$address<-with(data1,paste(St._No.,St._Name,St._Type,",markham,ontario,canada"))
      data1$region<-"Markham"
      
      data2<-read.csv("data/RH.csv",stringsAsFactors=F)
      data2$address<-with(data2,paste(St._No.,St._Name,St._Type,",richmond hill,ontario,canada"))
      data2$region<-"Richmond Hill"
      
      
      data3<-read.csv("data/C15.csv",stringsAsFactors=F)
      data3$address<-with(data3,paste(St._No.,St._Name,St._Type,",toronto,ontario,canada"))
      data3$region<-"Toronto"
  
  
  data<-rbind(data1,data2,data3)
  data<-data[(which(!(data$MLS_No.==""))),]
  data$pct<-paste0(as.character(round(with(data,Sold_Price/Ask_Price-1)*100)),'%')
  data$dom<-with(data,as.date(Sold_Date)-as.date(Contract_Date))
  data$saledate<-with(data,as.date(Sold_Date))
  data$tip<-with(data,paste(St._No.,St._Name,St._Type,"Asking: ",Ask_Price,"Sold: ",Sold_Price,"Margin: ",pct
                            ,"DOM: ",dom
                            ,"Date Sold: ",saledate))
  ##markham,ontario,canada
  data$weeknum <- week(with(data,as.date(Sold_Date)))

  
  data<-data.table(data)
  data<-data[is.na(Sold_Price)==F,]
  data<-data[!duplicated(data),]
  
  plotdata <-reactive({
    
    data.table(data[House_Type %in% c(input$house_type) 
         & region %in% c(input$region) 
         & Bedroom>=input$min_bed
         & Washroo>=input$min_bath
         & Sold_Price<=input$max_price
         & Sold_Price>=input$min_price,][,avg_price:=mean(Sold_Price),by=weeknum]  
    )

  })
  
#   seq<-reactive({
#        seq(1+10*(input$next10-1),10+10*(input$next10-1))
#   })
  
  output$distPlot <- renderGvis({
    

    
#     plotdata<-data[House_Type %in% c(input$house_type) 
#                    & region %in% c(input$region) 
#                    & Bedroom>=input$min_bed
#                    & Bedroom<=input$max_bed
#                    & Sold_Price<=input$max_price
#                    & Sold_Price>=input$min_price,]
#     
        
      seq<-seq(1+10*(input$next10-1),10+10*(input$next10-1))
      
    m<-gvisMap(plotdata()[seq,],
               locationvar="address",
               tipvar="tip",
               options=list(showTip=TRUE, 
                            #showLine=TRUE, 
                            enableScrollWheel=TRUE,
                            mapType="normal", 
                            ##useMapTypeControl=TRUE,
                            width=800,height=600)
    )

  })

  output$plot <- renderChart({
#renderPlot({
#     par(mfrow = c(1, 1))
    n<-  nrow(plotdata())
#     hist(plotdata()[dom>0,dom],
#          main=paste(n,input$house_type,"\nwere sold in",input$region),
#          xlab="Days on Market",
#          ylab=NA)
    
#     hist(plotdata()[,Sold_Price],
#          main=paste(n,input$house_type,"\nwere sold in",input$region),
#          xlab='Sold Price')

    p1<-rPlot('avg_price' ~ 'weeknum' ,data=plotdata(),type='line')
    p1$addParams(dom = "plot",height = 600,width=800,title="Weekly Avg Sold Price of Selected Houses")
    p1$guides(y = list(title = "Sold Price"),x=list(title='Nth week of the year'))
    return(p1)
  })

  output$price <-renderChart({
 
  p2<-rPlot('pct' ~ 'Sold_Price' ,data=plotdata(),type='point',color='Bedroom')
  #p2<-rPlot('avg_price' ~ 'weeknum' ,data=plotdata(),type='line')
  p2$addParams(dom = "price",height = 600,width=800,title="% Spread in Price (Sold/Asking)")
  p2$guides(y = list(title = "% Spread (Sold/Asking)"))
  return(p2)
  
  })

})