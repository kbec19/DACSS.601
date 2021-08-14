## **Different ways of visualizing variable correlations**

I also found another way to look at the Pearson correlation coefficient of each relationship in my data set. The package corrplot gives some great tools to not only calculate, but visualize those correlations between all of the variables in the data set.

```{r echo=TRUE}
scdb.tidy2 <- select(scdb.tidy,term, decisionDirection)
scdb.1976 <- filter(scdb.tidy2, term == "1976") 
(scdb.1976 <- scdb.1976 %>% 
    mutate(ideology = case_when(
      decisionDirection == 1 ~ "conservative",
      decisionDirection == 2 ~ "liberal",
      decisionDirection == 3 ~ "unspecified"
    )))
```

```{r echo=TRUE}
ggplot(scdb.1976, aes(x = ideology)) + 
  geom_bar(fill = "slategray3", 
           color="black") +
  labs(x = "Ideology", 
       y = "Frequency", 
       title = "Ideology of Supreme Court Decisions in 1976")
```

```{r echo=TRUE}
library(dplyr)
library(scales)
plotdata <- scdb.1976 %>%
  count(ideology) %>%
  mutate(pct = n / sum(n),
         pctlabel = paste0(round(pct*100), "%"))
```

```{r echo=TRUE}
ggplot(plotdata, 
       aes(x = reorder(ideology, -pct),
           y = pct)) + 
  geom_bar(stat = "identity", 
           fill = "darkred", 
           color = "black") +
  geom_text(aes(label = pctlabel), 
            vjust = -0.25) +
  scale_y_continuous(labels = percent) +
  labs(x = "Ideology", 
       y = "Frequency", 
       title = "Ideology of Supreme Court Decisions in 1976")
```