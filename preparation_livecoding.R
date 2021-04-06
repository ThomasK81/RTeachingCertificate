# install.packages("tidyverse")
library(tidyverse)

# ggplot follows a simple structure:
# ggplot(data = <DATA>) +
# <GEOM_FUNCTION>(mapping = aes(<MAPPINGS>))

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy))

# The line ggplot() already initialises the graph:
ggplot()

# If I want to see a coordinate system, I have to at least specify a mapping:
ggplot(data = mpg, mapping = aes(x = displ, y = hwy))

# Notice that no data has been plotted. The reason for that is that we haven't 
# defined the graphic objects yet. they are called geoms. geoms are the graphic 
# objects that are used to communicate the data. 
# geom_point, for instance, produces a scatterplot:
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy))

# The plus connects the two elements of the ggplot call
# You don't have to write it in two lines, but you can break after the +
# This is recommended for better readability.
# It would work without the line break though: 
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy))

# Scatterplots can sometimes show an overly complicated plot or
# even imprecise plots when there is a lot of overplotting.
# With geom_smooth() I can try to summarise the relationship between
# variables
ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy))

# Did you see the red line. Red is not always bad in ggplot.
# Sometimes it is just extra information or warnings.
# You will get a result, but it is also good to not ignore the warnings.
# Here it is just extra information regarding the mathematical model ggplot uses.
# You don't have to understand this at this stage.

# Have you noticed that both graphical objects start with geom_? 
# This is not by accident. You can use geom_ and RStudio's code completion 
# to see all the options. Type geom_ into the console.

geom_

# Sidetrack: 
# Don't call the geom_function without the initial ggplot().
# You won't get an error, but it will get confusing!
# I'll explain in Advanced R. ;)

# You can combine multiple geoms in the same plot
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  geom_smooth(mapping = aes(x = displ, y = hwy))

# The order matters
ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy)) +
  geom_point(mapping = aes(x = displ, y = hwy))

# You don't have to define the mapping on the level of the geom
# You can do it in the ggplot() function
# This is defining it at the parent level:
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_smooth() +
  geom_point()

# Info in the parent level is automatically inherited by
# all child levels in the geom_...() functions
# You can overwrite it though:

cylinder_4 <- filter(mpg, cyl == 4)
cylinder_8 <- filter(mpg, cyl == 8)

ggplot(data = cylinder_4, mapping = aes(x = displ, y = hwy, col = "4-cylinder")) +
  geom_point() +
  geom_point(data = cylinder_8, mapping = aes(x = displ, y = hwy, col = "8-cylinder"))


# As you may suspect from the last example,
# ggplot's visual vocabulary is a lot wider than simply mapping to
# x and y. For instance, you can map a variable to a colour:
ggplot(data = mpg, mapping = aes(x = displ, y = hwy, col = class)) +
  geom_point()

# Notice how a legend is directly produced to help a reader to
# interpret the plot.

# You can add more:
ggplot(data = mpg, mapping = aes(x = displ, y = hwy, col = class, shape = cyl)) +
  geom_point()

# oops, ggplot doesn't like me using the shape aesthetic on a continuous variable!
# I can fix it either by changing the mapping
ggplot(data = mpg, mapping = aes(x = displ, y = hwy, col = class, size = cyl)) +
  geom_point()

# Or changing the variable:
ggplot(data = mpg, mapping = aes(x = displ, y = hwy, col = class, shape = as.character(cyl))) +
  geom_point()

# the as.character() function is a quick & dirty method to coerce
# a variable into being discrete

# Last but not least, so far we have named every parameter in the ggplot function
# If you provide the parameters in the order ggplot suspects, you can drop the names.

ggplot(mpg) +
  geom_point(aes(displ, hwy))

# It still follows this basic structure: 

# ggplot(<DATA>) +
# <GEOM_FUNCTION>(aes(<MAPPINGS>))


