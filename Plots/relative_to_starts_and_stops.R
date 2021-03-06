bitmap("lll.relative_to_starts_and_stops.mmm.jpg",type="jpeg",height=10,width=12,res=600,pointsize=17)

col3 = c("red","blue","green")
par(xaxs="i")
par(yaxs="i")
par(cex.axis=1.2)
temp=c(0,1)
par(mar=c(0,0,0,0))
par(mgp=c(3,1.8,1))
cc1 = 1.2

f1 = 460
f2 = 220

layout(matrix(c(1,2,3,1,4,3,1,5,3,1,6,3,1,7,3), 3, 5, byrow = FALSE), c(5,f1,50,f2,5), c(0.2,4,0.35))

#  1   1   1   1   1
#  2   4   5   6   7
#  3   3   3   3   3

st <- read.table("lll.relative_to_starts_stops_length.mmm")

#Specify read sizes to plot here
sizes = c(sss)

s1a <- st[st$V3 == sizes[1] & st$V1 < 500 , ]
s2a <- st[st$V3 == sizes[2] & st$V1 < 500 , ]
s3a <- st[st$V3 == sizes[3] & st$V1 < 500 , ]
s4a <- st[st$V3 == sizes[4] & st$V1 < 500 , ]
s5a <- st[st$V3 == sizes[5] & st$V1 < 500 , ]
s6a <- st[st$V3 == sizes[6] & st$V1 < 500 , ]
#make histograms of the distances from start
h1a = hist(s1a$V1,breaks=c(-100:500)+0.5,plot=FALSE)
h2a = hist(s2a$V1,breaks=c(-100:500)+0.5,plot=FALSE)
h3a = hist(s3a$V1,breaks=c(-100:500)+0.5,plot=FALSE)
h4a = hist(s4a$V1,breaks=c(-100:500)+0.5,plot=FALSE)
h5a = hist(s5a$V1,breaks=c(-100:500)+0.5,plot=FALSE)
h6a = hist(s6a$V1,breaks=c(-100:500)+0.5,plot=FALSE)

s1b <- st[st$V3 == sizes[1] & st$V2 > -500 , ]
s2b <- st[st$V3 == sizes[2] & st$V2 > -500 , ]
s3b <- st[st$V3 == sizes[3] & st$V2 > -500 , ]
s4b <- st[st$V3 == sizes[4] & st$V2 > -500 , ]
s5b <- st[st$V3 == sizes[5] & st$V2 > -500 , ]
s6b <- st[st$V3 == sizes[6] & st$V2 > -500 , ]
#make histograms of the distances from stop
h1b = hist(s1b$V2,breaks=c(-500:100)+0.5,plot=FALSE)
h2b = hist(s2b$V2,breaks=c(-500:100)+0.5,plot=FALSE)
h3b = hist(s3b$V2,breaks=c(-500:100)+0.5,plot=FALSE)
h4b = hist(s4b$V2,breaks=c(-500:100)+0.5,plot=FALSE)
h5b = hist(s5b$V2,breaks=c(-500:100)+0.5,plot=FALSE)
h6b = hist(s6b$V2,breaks=c(-500:100)+0.5,plot=FALSE)

#find the maximum density positions relative to either the start or stop
y1 = max(h1a$counts,h1b$counts)
y2 = max(h2a$counts,h2b$counts)
y3 = max(h3a$counts,h3b$counts)
y4 = max(h4a$counts,h4b$counts)
y5 = max(h5a$counts,h5b$counts)
y6 = max(h6a$counts,h6b$counts)
buffer = 0.05*max(y1,y2,y3,y4,y5,y6)
ytotal = y1+y2+y3+y4+y5+y6+5*buffer #this is the upper y-axis coordinate for the entire group of histograms

#now calculate the appropriate lower y-axis coordinates for the histograms
o1 = y6+buffer+y5+buffer+y4+buffer+y3+buffer+y2+buffer #lower y coordinate of top histogram to be plotted
o2 = y6+buffer+y5+buffer+y4+buffer+y3+buffer
o3 = y6+buffer+y5+buffer+y4+buffer
o4 = y6+buffer+y5+buffer
o5 = y6+buffer
o6 = 0 #y coordinate of bottom histogram to be plotted

plot(temp,temp,axes=FALSE,ylab="",xlab="",main="",type="n")
text(0.5,0.5,adj=0.5,labels="ttt",cex=1.4,font=2) #plot title

plot(temp,temp,axes=FALSE,ylab="",xlab="",main="",type="n")

plot(temp,temp,axes=FALSE,ylab="",xlab="",main="",type="n")
text(0.5,0.15,adj=0.5,labels="location of 5' end of reads relative to start and stop codons",cex=cc1)

plot(temp,temp,type="n",xlab="",ylab="",main="",xlim=c(-60,400),ylim=c(0,ytotal),axes=FALSE)
#the color is assigned according to the position relative to the start codon - hence, if the read is in frame 0, then the first color is selected from the col3 array defined above. this is evaluated according to the below equation: (h1a$mids+900)%%3+1, where $mids is the position of alignment
#NB: hist$mids gives the x coordinates the midpoints of the bars of a histogram: in this case, it is simply the position relative to the start/stop
rect(h1a$mids-0.5,o1,h1a$mids+0.5,o1+h1a$counts,border=FALSE,col=col3[(h1a$mids+900)%%3+1]) #we add and substract 0.5 to the mids so that the rectangles will be centred exactly on the appropriate alignment position
rect(h2a$mids-0.5,o2,h2a$mids+0.5,o2+h2a$counts,border=FALSE,col=col3[(h2a$mids+900)%%3+1])
rect(h3a$mids-0.5,o3,h3a$mids+0.5,o3+h3a$counts,border=FALSE,col=col3[(h3a$mids+900)%%3+1])
rect(h4a$mids-0.5,o4,h4a$mids+0.5,o4+h4a$counts,border=FALSE,col=col3[(h4a$mids+900)%%3+1])
rect(h5a$mids-0.5,o5,h5a$mids+0.5,o5+h5a$counts,border=FALSE,col=col3[(h5a$mids+900)%%3+1])
rect(h6a$mids-0.5,o6,h6a$mids+0.5,o6+h6a$counts,border=FALSE,col=col3[(h6a$mids+900)%%3+1])
axis(side=1,labels=c("start","100","200","300","400"),at=c(0,100,200,300,400))

plot(temp,temp,axes=FALSE,ylab="",xlab="",main="",type="n") #this is the white space between the two sets of stacked histograms for start and end positions

plot(temp,temp,type="n",xlab="",ylab="",main="",xlim=c(-200,20),ylim=c(0,ytotal),axes=FALSE)
rect(h1b$mids-0.5,o1,h1b$mids+0.5,o1+h1b$counts,border=FALSE,col=col3[(h1b$mids+902)%%3+1])
rect(h2b$mids-0.5,o2,h2b$mids+0.5,o2+h2b$counts,border=FALSE,col=col3[(h2b$mids+902)%%3+1])
rect(h3b$mids-0.5,o3,h3b$mids+0.5,o3+h3b$counts,border=FALSE,col=col3[(h3b$mids+902)%%3+1])
rect(h4b$mids-0.5,o4,h4b$mids+0.5,o4+h4b$counts,border=FALSE,col=col3[(h4b$mids+902)%%3+1])
rect(h5b$mids-0.5,o5,h5b$mids+0.5,o5+h5b$counts,border=FALSE,col=col3[(h5b$mids+902)%%3+1])
rect(h6b$mids-0.5,o6,h6b$mids+0.5,o6+h6b$counts,border=FALSE,col=col3[(h6b$mids+902)%%3+1])
#add the labels to show which size reads are being shown in each pair of histograms
text(20,o1+buffer/2,adj=1,cex=cc1,labels=paste(sizes[1],"nt"),font=2)
text(20,o2+buffer/2,adj=1,cex=cc1,labels=paste(sizes[2],"nt"),font=2)
text(20,o3+buffer/2,adj=1,cex=cc1,labels=paste(sizes[3],"nt"),font=2)
text(20,o4+buffer/2,adj=1,cex=cc1,labels=paste(sizes[4],"nt"),font=2)
text(20,o5+buffer/2,adj=1,cex=cc1,labels=paste(sizes[5],"nt"),font=2)
text(20,o6+buffer/2,adj=1,cex=cc1,labels=paste(sizes[6],"nt"),font=2)
axis(side=1,labels=c("-200","-100","stop"),at=c(-200,-100,0))

plot(temp,temp,axes=FALSE,ylab="",xlab="",main="",type="n")

dev.off()
