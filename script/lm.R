#radius of gyration linear regression model
radius_regression=read.csv('..data/radius_seperate.csv')
model_radius<-lm(radius_difference~pLDDT+ES_ISO+ES_REF+ADS+ACS+MXE+IR_ISO+IR_REF+AFE+ALE+MXE_AFE+MXE_ALE,data=radius_regression)
summary(model_radius)
effect_size <- coef(model_radius)
p_value <- summary(model_radius)$coefficients[,4]
results <- data.frame(effect_size = effect_size, p_value = p_value)
#write.csv(results, file = "results_radius.csv", row.names = FALSE)

#surface charge linear regression model
charge_regression=read.csv('..data/charge_seperate.csv')
model_charge<-lm(charge_difference~pLDDT+ES_ISO+ES_REF+ADS+ACS+MXE+IR_ISO+IR_REF+AFE+ALE+MXE_AFE+MXE_ALE,data=charge_regression)
summary(model_charge)
effect_size <- coef(model_charge)
p_value <- summary(model_charge)$coefficients[,4]
results <- data.frame(effect_size = effect_size, p_value = p_value)
#write.csv(results, file = "results_charge.csv", row.names = FALSE)

#TM-score linear regression model
tm_regression=read.csv('..data/tm_align.csv')
model_tm<-lm(tm_align~pLDDT+ES+ADS+ACS+MXE+IR+AFE+ALE+MXE_AFE+MXE_ALE,data=tm_regression)
summary(model_tm)
effect_size <- coef(model_tm)
p_value <- summary(model_tm)$coefficients[,4]
results <- data.frame(effect_size = effect_size, p_value = p_value)
#write.csv(results, file = "results_tm.csv", row.names = FALSE)

#helix linear regression model
ss_regression=read.csv('..data/ss_seperate.csv')
model_helix<-lm(helix~pLDDT+ES_ISO+ES_REF+ADS+ACS+MXE+IR_ISO+IR_REF+AFE+ALE+MXE_AFE+MXE_ALE,data=ss_regression)
summary(model_helix)
effect_size <- coef(model_helix)
p_value <- summary(model_helix)$coefficients[,4]
results <- data.frame(effect_size = effect_size, p_value = p_value)
#write.csv(results, file = "results_helix.csv", row.names = FALSE)

#sheet linear regression model
model_sheet<-lm(sheet~pLDDT+ES_ISO+ES_REF+ADS+ACS+MXE+IR_ISO+IR_REF+AFE+ALE+MXE_AFE+MXE_ALE,data=ss_regression)
summary(model_sheet)
effect_size <- coef(model_sheet)
p_value <- summary(model_sheet)$coefficients[,4]
results <- data.frame(effect_size = effect_size, p_value = p_value)
#write.csv(results, file = "results_sheet.csv", row.names = FALSE)

#loop linear regression model
model_loop<-lm(loop~pLDDT+ES_ISO+ES_REF+ADS+ACS+MXE+IR_ISO+IR_REF+AFE+ALE+MXE_AFE+MXE_ALE,data=ss_regression)
summary(model_loop)
effect_size <- coef(model_loop)
p_value <- summary(model_loop)$coefficients[,4]
results <- data.frame(effect_size = effect_size, p_value = p_value)
#write.csv(results, file = "results_loop.csv", row.names = FALSE)
