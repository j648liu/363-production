##open data
a <- read.csv("all_data.csv")

##data descriptives
summary(a)
#majority of the answers were correct
#more rejection ("No") than identification ("Yes")
#more female and than male

##production effect
x<- numeric()
num_par = nrow(a)/40
for (i in 1:num_par) {
	first_row = 40*(i-1)+1
	last_row = 40*(i-1)+40
	sub <- a[first_row:last_row,] 
	p=sum(sub$assessment[sub$list == "read"] == "correct")-
	sum(sub$assessment[sub$list == "silent"] == "correct")
	x<- append(x, p)
}

t.test(x, mu=0)
#t(11) = 4.4228, p<0.05
#95%CI [1.59, 4.74]
#mean=3.167
#Words read aloud significantly remembered better than words read silently

corrects<- c(sum(a$assessment[a$list == "read"] == "correct")/12,sum(a$assessment[a$list == "silent"] == "correct")/12)
barplot(corrects,main="Average correct answers",
   names.arg=c("Read condition","Silent condition") 

##false alarm and missed detection
y<- numeric()
for (i in 1:num_par) {
	first_row = 40*(i-1)+1
	last_row = 40*(i-1)+40
	sub <- a[first_row:last_row,] 
	q=sum(sub$assessment[sub$identification == "reject"] == "false")-
	sum(sub$assessment[sub$identification == "identification"] == "false")
	y<- append(y, q)
}

t.test(y, mu=0)
#t(11) = -4.5288, p<0.001
#95% CI [-4.21, -1.46]
#mean=-2.833
#False alarms significanly less than missed detection (among wrong answers, more "N" than "Y")

##primacy and recency effect
word<- unique(a$word)

test<- c('forest','pocket','traffic','machine','leather',
'lesson','branch','invention','station','education',
'history','village','theatre','wagon','minute',
'factory','direction','century','amount','record',
'debate','furniture','wheel','address','judge',
'ticket','account','powder','uniform','teacher',
'answer','package','quarrel','victory','captain',
'trousers','shoulder','afternoon','election','ocean')

overlap<-intersect(word,test)

sort<- overlap[order(match(overlap,test))]
#sort the tested words in order of appearance

z<- numeric()
for (i in 1:40) {
	u=sum(a$word[a$assessment=="correct"]==sort[i])
	v=sum(a$word == sort[i])
	w=u/v
	z<-append(z, w)
}

plot(z, type="o")
#recency effect stronger than primacy effect
#effect attenuated by ceiling effect (mostly high)

mean(z)
sd(z)
#mean=0.742, sd=0.25