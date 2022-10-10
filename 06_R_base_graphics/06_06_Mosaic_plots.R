# 6.6 Mosaic plots

# some data for mosaic plot

gender <- sample(x = c("M", "F"), size = 100, replace = T, prob = c(0.35, 0.65))
eye.color <- sample(x = c("brown", "blue", "green", "hazel"), size = 100, replace = T, prob = c(0.5, 0.05, 0.15, 0.3))
df <- data.frame(gender = gender, eye_color = eye.color) # create data frame
data.t <- table(df) # generate table
mosaicplot(data.t)

# add colors, labels
mosaicplot(x = data.t,
           col = c("deepskyblue", "brown", "forestgreen", "gray"),
           main = "Eye color by gender",
           xlab = "gender",
           ylab = "eye color")

# another mosaic plot
data <- UCBAdmissions[ , , 1:3]
mosaicplot(x = data, 
           sort = 3:1,
           col = c("deepskyblue", "brown1"),
           main = "Student admissions at UC Berkeley",
           xlab = "Department")
