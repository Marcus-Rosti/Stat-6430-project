install.packages("plot3D")
install.packages("rgl")       # to install this, don't install source. Answer n when it asks
install.packages("plot3Drgl") # you can install this one from source safely
library(plot3D)
library(rgl)
library(plot3Drgl)

############################################################
# An example of a 3D histogram
# 
#
############################################################

lon <- seq(165.5, 188.5, length.out = 30)
lat <- seq(-38.5, -10, length.out = 30)
xy <- table(cut(quakes$long, lon),
            cut(quakes$lat, lat))
xmid <- 0.5*(lon[-1] + lon[-length(lon)])
ymid <- 0.5*(lat[-1] + lat[-length(lat)])

par (mar = par("mar") + c(0, 0, 0, 2))
hist3D(x = xmid, y = ymid, z = xy,
       zlim = c(-20, 40), main = "Earth quakes",
       ylab = "latitude", xlab = "longitude",
       zlab = "counts", bty= "g", phi = 5, theta = 25,
       shade = 0.2, col = "white", border = "black",
       d = 1, ticktype = "detailed")

with (quakes, scatter3D(x = long, y = lat, 
                        z = rep(-20, length.out = length(long)), 
                        colvar = quakes$depth, col = gg.col(100), 
                        add = TRUE, pch = 18, clab = c("depth", "m"),
                        colkey = list(length = 0.5, width = 0.5, 
                                      dist = 0.05, cex.axis = 0.8, cex.clab = 0.8)
)) 

plotrgl(new = TRUE) 

############################################################
#
#
#
############################################################

image2D(volcano, shade = 0.2, rasterImage = TRUE, main = "volcano",
        contour = list(col = "white", labcex = 0.8, lwd = 3, alpha = 0.5),
        colkey = list(length = 0.5, width = 0.5)  )

plotrgl(new = TRUE)

############################################################
#
#
#
############################################################

with(USArrests, text3D(Murder, Assault, Rape, 
                       colvar = UrbanPop, col = gg.col(100), theta = 60, phi = 20,
                       xlab = "Murder", ylab = "Assault", zlab = "Rape", 
                       main = "USA arrests", 
                       labels = rownames(USArrests), cex = 0.6, 
                       bty = "g", ticktype = "detailed", d = 2,
                       clab = c("Urban","Pop"), adj = 0.5, font = 2))

with(USArrests, scatter3D(Murder, Assault, Rape - 1, 
                          colvar = UrbanPop, col = gg.col(100), 
                          type = "h", pch = ".", add = TRUE))

plotrgl(new = TRUE)