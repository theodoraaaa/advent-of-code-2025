library(tidyverse)

# example values: rotations = c("L168", "L430", "R248", "L1105", "R60", "L55", "L1", "L99", "R14", "L82")

rotations_data <- read_csv("Data/aoc_1_input.csv", col_names = FALSE)
rotations <- rotations_data$X1

counter = 0 # number of times dial is rotated
current = 50 # starting position of dial
zeros = 0 # counter for number of times dial points at 0

for(i in rotations){
  
  counter = counter + 1
  print(counter)
  
  # take value from rotation - ignore values above 99 as they don't impact the rotation
  value <- as.numeric(gsub('L|R', '', i))
  if(value>9) {
    value <- as.numeric(str_sub(value, start = -2))
  }
  
  # add or subtract the value from the current position to rotate the dial
  if(grepl("R", i)) {
    current = current + value
  } else {
    current = current - value
  }
  
  # alter final position if rotation passes 0 in either direction
  if(current < 0) {
    current = 100 + current
  } else if(current > 99) {
    current = current - 100
  }

  # keep count of number of times dial points at 0
  if(current == 0) {
    zeros = zeros + 1
    }
  
}
