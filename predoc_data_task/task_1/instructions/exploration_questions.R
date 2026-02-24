library(data.table)
library(tidyverse)
library(knitr)

path <- '/Users/djscolari/Dropbox/academia/mit/coding_sample'

ercot_resource_output <- fread(file.path(path, 'task data', 'ercot_resource_output.csv'))
ercot_resource_types  <- fread(file.path(path, 'task data', 'ercot_resource_types.csv'))


# how many unique values of the following:
# resource name
# qse
# how many unique pairs of these two variables are there?
ercot_resource_output[, resource_name] %>% unique() %>% length() # resource_name - 1121
ercot_resource_output[, qse          ] %>% unique() %>% length() # qse - 194
ercot_resource_output[, .N, by = c('resource_name', 'qse')]      # qse/resource name pairs - 1127


# What is a QSE? Do a quick online search for this ERCOT acronym. 
# Provide a breif definition for QSE within ERCOT's wholesale electricity market.
# From ERCOT's website: 
  #"Qualified scheduling entities (QSEs) submit bids and offers on behalf of resource entities (REs) 
  # or load serving entities (LSEs) such as retail electric providers (REPs)"
  # QSEs are able to submit offers to sell and/or bids to buy energy in the Day-Ahead Market and the Real-Time Market.
  # The QSE is also responsible for submitting a Current Operating Plan for all resources it represents and offering or 
  # procuring Ancillary Services as needed to serve their represented load. QSEs are responsible for settling financially 
  # with ERCOT. For more information on the basics of the Nodal Market, please see the Market Guide.

# looking at qse/resource name pairs: 
# is it ever the case that a single qse is paired to multiple resource names? 
# What might this indicate about the relationship between qses and resource names?

# What are the 10 largest QSEs in terms of the number of unique resource names they are paired to in the data.
ercot_resource_output[, c('resource_name', 'qse')] %>% unique() %>% .[, .N, by = qse] %>% .[order(-N)] %>% .[1:10] %>% 
  kable(format = 'latex', booktabs = T, col.names = c('QSE', 'N Resource Names')) %>% 
  write(file = file.path(path, 'task data', 'ten_large.tex'))

# is it ever the case that a single resource name is paired to more than one qse in the data? 
# For how many resource names is this true for
ercot_resource_output[, c('resource_name', 'qse')] %>% unique() %>% .[, .N, by = resource_name] %>% .[N>1]

# Why would a single resource name be paried to multiple qses? (hint: look at hor pairs change over time)
ercot_resource_output[resource_name == 'MUSTNGCK_BES1'] %>% View() # take a screenshot of this data

# how many unique, non-missing values does resource type take? Can you define them? 
ercot_resource_types[, 'resource_type'] %>% unique()
# Note: PVGR = solar, DSL = diesel, {CCGT90, SCGT90, CCLE90, GSSUP, GSNONR, GSREH, SCLE90} = natural gas, 
# CLLIG = coal, NUC = nuclear, PWRSTR = storage

# OR

# look at the csv file names resource_types.csv
# ercot_resource_types[, resource_type] %>% unique()
# CCGT90 Combined Cycle greater than 90 MW
# CCLE90 Combined Cycle less than or equal to
# 90 MW
# CLLIG Coal and Lignite
# DSL Diesel
# GASSTM Gas-Steam
# GSNONR Gas Steam Non-Reheat Boiler
# GSREH Gas Steam Reheat Boiler
# GSSUP Gas Steam Supercritical Boiler
# HYDRO Hydro
# NUC Nuclear
# RENEW Renewable
# SCGT90 Simple Cycle greater than 90 MW
# SCLE90 Simple Cycle less than or equal to 90
# MW
# WIND Wind
# PS Pumped Storage

# (you don't have to define all 15, but try to guess a few from just the name. Then look online for a few you don't know.)
# Are there any empty strings in the resource type column? Which resource names are missing their type? 
# Can you guess what they are? Fill in the missing values with your guess
ercot_resource_types[resource_type == '']
ercot_resource_types[resource_name == 'GALLOWAY_SOLAR1' | resource_name == 'ROSELAND_SOLAR3', 'resource_type'] <- 'PVGR'
ercot_resource_types[resource_name == 'SSPURTWO_WIND_1' | resource_name == 'SWEETWN2_WND24',  'resource_type'] <- 'WIND'

# Based on the following definitions, use the resource type column to make a fuel type column

# resource_type
# 1:            DSL - Other
# 2:         SCGT90 - Natural Gas
# 3:           WIND - Wind
# 4:         PWRSTR - Other
# 5:          HYDRO - Other
# 6:         CCGT90 - Natural Gas
# 7:           PVGR - Solar
# 8:         SCLE90 - Natural Gas
# 9:          GSREH - Natural Gas
# 10:        CCLE90 - Natural Gas
# 11:         CLLIG - Coal 
# 12:         GSSUP - Natural Gas
# 13:           NUC - Nuclear
# 14:        GSNONR - Natural Gas
# 15:         RENEW - Other

# now that you've filled in the missing resource types, merge the resource type data to the output data by resource name
# you will use this data for the rest of the task.

