Stat 850 Project Description
================
Constanza Paz Avello Lefno, Yutong Liu, Lin Zhao

## Instructions

Each member of your team should modify this document in some way and
push their modifications to the repository in a separate commit. This
will ensure that you have set your repository up in a way that ensures
all group members are working with the same repository.

Note that you must compile your readme (this document) for it to
properly display as part of your github repository.

Once you have received feedback on your project proposal (via Canvas)
you may alter this README so that it describes your final project
instead of the project
proposal.

## Data Set

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

  - nutrient\_amount - *Amount of the nutrient per 100g of food.
    Specified in unit defined in the nutrient table.*

  - min - *The minimum amount*

  - max - *The maximum amount*

  - median - *The median amount*

  - nutrient\_name - *Name of the nutrient*

  - nutrient\_unit - *The standard unit of measure for the nutrient (per
    100g of food)*

## Potential Topics to Explore Using the Data Set

Describe avenues you might explore using the data

There are several tables in the original database, we only take three of
them and merge the variables together by **fdc\_id**, which is a unique
permanent identifier of a food across tables. We would like to discover
potential recycling of non-edible food component which has relatively
higher nutrient.

## Group Members

  - Constanza Paz Avello Lefno
  - Yutong Liu
  - Lin Zhao

## Reference

U.S. Department of Agriculture, Agricultural Research Service. FoodData
Central, 2019. fdc.nal.usda.gov.
