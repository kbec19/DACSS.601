# first step is always loading tidyverse

library(tidyverse)

# look in conflicts to see what of the package conflicts/replaces a basic R function

# look at data dimensions

dim(mtcars)

# look at the headers of the data

head(mtcars)

# tidying data means every row is a value, every column is a variable, and every cell is a value
# use tibble 
# to make R do something and show us what it did, put in parentheses

(mtcars_new <- as_tibble(mtcars))

# tibble prints things differently, reduced number of entries and info on what is being left out
# tibble also shows us what type of variable the values are
# the data is not tidy if the variables are not properly named

select(mtcars_new,mpg, wt, hp)

# select specific columns if we would like to do that
# then we store that as a new dataset so we don't screw up the first one

(mtcars_new2 <- select(mtcars_new,mpg, wt, hp))

# arrange makes it easy to view something in a certain way

mtcars.mpg <- arrange(mtcars_new2, desc(mpg))

# here we arranged the column "mpg" in descending order

# filter chooses observations - we can then rename to a new dataset with certain observations only

mtcars_mpg20 <- filter(mtcars.mpg, mpg<20) 

# this is how we arrange 

(mtcars.mpg.hp <- arrange(mtcars_new, desc(hp),desc(mpg)))

# this is how we arrange and mutate variables

mtcars_new.eff <- mutate(mtcars.mpg20,
                    efficient=case_when(
                      mpg >= 20 & hp >= 100 ~ 1,
                      mpg < 20 | hp < 100 ~ 0
                    ))

mtcars_new.eff %>% 
  group_by(efficient) %>% 
  summarise(
    mean_wt=mean(wt),
    median_wt=median(wt)
  )

# left_join is a mutating join that adds all rows in x to a database
    
mtcars_joined <- left_join(mtcars_new.eff, mtcars)                    
                    
mtcars_joined %>% 
  group_by(am, vs) %>% 
  summarise(mean_mpg=mean(mpg),
            mean_hp=mean(hp)) %>% 
  arrange(desc(mean_mpg))



