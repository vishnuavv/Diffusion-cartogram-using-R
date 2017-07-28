# Diffusion-cartogram-using-R
R code for Diffusion cartogram using food services data across US States. 

Found R library for plotting cartogram at this internet page, “https://cran.r-project.org/web/packages/cartogram/cartogram.pdf”	
This is how the plotting has been done:
1.	Installed cartogram package and dependencies, imported library cartogram along with regeos, mapproj, rgdal & sp.
2.	Used shape file to get US States dimensions, got SpecialPloygonDataFrame and applied CRS projection.
3.	Inported food services data into data frame.
4.	Merged SpecialPloygonDataFrame with Generic states with Food services data frame upon state name.
5.	Invoked cartogram function by passing SpecialPloygonDataFrame.
6.	Plotted with tm_shape.


