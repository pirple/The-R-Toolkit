## Output data
# csv
write.csv(ds, file = "HockeyData.csv")

# text
write.table(ds, file = "HockeyData.txt", sep = "\t")

# Rdata
save(ds, file = "HockeyData.RData")

# R image
save.image(file = "HockeyData.RData")
