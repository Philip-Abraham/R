library(installr)

copy.packages.between.libraries(ask = T)
# it will ask you from what R version 
# to copy the packages into which R version.  
# Since (do_NOT_override_packages_in_new_R = T) the function will 
# make sure to NOT override your newer packages.