install.packages(c("dygraphs","plotly","xts"))
library(dygraphs)#Time series plot
library(plotly)#prints interactivity
library(xts)#data time series 
library(tidyverse)

#Dygraphs
Nile
Nile_ts<-as.xts(Nile)
dygraph(Nile_ts,main = "Nile River Flow") #Main is like heading

"INDIA-AQI-DATA-2015-2020.csv" %>% 
  read_csv() %>% 
  select(c(Date,NO)) %>% 
  dygraph(main = "NO Timeseries")
#Add range selector
nile_graph<-dygraph(Nile_ts,main = "Nile River Flow with range") 
  dyRangeSelector(nile_graph)

#Multiple series
data<-cbind(mdeaths,fdeaths)
data_xts<-as.xts(data)
dygraph(data_xts,main="Deaths in the UK") %>% 
  dySeries("mdeaths",label="Male") %>% 
  dySeries("fdeaths",label="Female") %>% 
  dyOptions(colors = c("blue", "red")) %>% 
  dyRangeSelector()

lungdeath<-cbind(mdeaths,fdeaths)
dygraph(as.xts(lungdeath),main="Comparing deaths in male and female") %>% 
  dySeries("mdeaths",color = "darkblue") %>% 
  dySeries("fdeaths",color = "tomato") %>% 
  dyHighlight(highlightCircleSize = 5,highlightSeriesBackgroundAlpha = 0.2) %>% 
  dyOptions(drawPoints = TRUE,pointSize = 2) %>% 
  dyLegend(show = "always") %>% #Shows the m and f deaths
  dyRangeSelector()
  

