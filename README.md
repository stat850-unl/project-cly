Stat 850 Project Description
================
Lin Zhao

## Instructions

Each member of your team should modify this document in some way and
push their modifications to the repository in a separate commit. This
will ensure that you have set your repository up in a way that ensures
all group members are working with the same repository.

Note that you must compile your readme (this document) for it to
properly display as part of your github repository.

Once you have received feedback on your project proposal (via Canvas)
you may alter this README so that it describes your final project
instead of the project proposal.

## Data Set

Provide a link to your dataset here, and a description of the variables
in the data
set.

[FoodData](https://fdc.nal.usda.gov/fdc-datasets/FoodData_Central_csv_2020-04-29.zip)
is an integrated database that provides food component and nutrient
information.

Three tables from the database are chosen for this project:

  - food\_component.csv
  - food\_nutrient.csv
  - nutrient.csv

By combining three datasets together and selecting several variables, a
new dataset called **food\_dataset** is generated for further analysis.

Description of variables:

  - component\_name - *The kind of component, e.g. bone*

  - pct\_weight - *The weight of the component as a percentage of the
    total weight of the food*

  - is\_refuse - *Whether the component is refuse, i.e. not edible*

  - gram\_weight - *The weight of the component in grams*

  - nutrient\_name - *Name of the nutrient*

  - nutrient\_amount - *Amount of the nutrient per 100g of food.
    Specified in unit defined in the nutrient table.*

  - min - *The minimum amount*

  - max - *The maximum amount*

  - median - *The median amount*

  - nutrient\_unit - *The standard unit of measure for the nutrient (per
    100g of food)*

## Potential Topics to Explore Using the Data Set

Describe avenues you might explore using the data

There are several tables in the original database, we only take three of
them and merge the variables together by **fdc\_id**, which is a unique
permanent identifier of a food across tables. We would like to discover
potential recycling of non-edible food component which has relatively
higher nutrient. Here are some specific topics that we might explore
using the data:

1.  Having a table of food components that are discarded and looking for
    potential recyclable components.

2.  Manipulating data to have unified unit for nutrient amount, focusing
    on the food components that are defined as refuse and calculate the
    exact amount of each nutrient grouped by food component. Discover
    potential recyclable food components with higher pct\_weight and
    higher nutrient proportion by sorting data from highest nutrient
    proportion to the lowest.

3.  Once we find some nutrients with extreme content, we could plot the
    minimum, maximum, and median amount of these nutrients. Looking for
    which discarded food component is suitable for extract some specific
    nutrients, such as DHA.

Overall, we are looking for a higher amount of discarded/non-edible food
components with a higher amount of beneficial nutrients. We would like
to find these potential recyclable food components by exploring the
total amount of components and the amount of specific nutrients in the
food component.

## Group Members

  - Lin Zhao

## Reference

U.S. Department of Agriculture, Agricultural Research Service. FoodData
Central, 2019. fdc.nal.usda.gov.
