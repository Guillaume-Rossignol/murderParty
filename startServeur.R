#!/usr/bin/env Rscript
options(shiny.port = 80)
options(shiny.host = '0.0.0.0')
args = commandArgs(trailingOnly=TRUE)
print(args[1])
library(murderParty)
lancer_serveur_habemus(args[1])
