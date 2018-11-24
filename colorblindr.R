# Colorblindr
install.packages("colorspace", dependencies = TRUE)
# This won't work as colorblindr requires 1.4.0 instead of 1.3.2
# https://r-forge.r-project.org/R/?group_id=20
# Currently colorspace 1.4 is not working. 

install.packages("likert", dependencies = TRUE)
devtools::install_github("wilkelab/cowplot")
devtools::install_github("clauswilke/colorblindr")

# Recommended way
library(ggplot2)
library(likert) 
library(colorspace)
library(cowplot)
library(colorblindr)

# Use a provided dataset
data(pisaitems) 
q1 <- pisaitems[, substr(names(pisaitems), 1, 5) == "ST24Q"] 

# Realize the plot
p1 <- likert(q1) 
plot(p1)


# Somewhat frieldly scale_fill_OkabeIto() fill 
p2 <- ggplot(iris, aes(Sepal.Length, fill = Species)) + 
  geom_density(alpha = 0.7) + 
  scale_fill_OkabeIto()
p2

# Plotting different colorblind friendly themes
cvd_grid(p1)
cvd_grid(p2)
