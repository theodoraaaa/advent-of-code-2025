library(tidyverse)

rotations = c("L68", "L30", "R48", "L5", "R60", "L55", "L1", "L99", "R14", "L82")

current = 50
zeros = 0

for(i in rotations){
  
  print(i)
  
  value <- as.numeric(gsub('L|R', '', i))
  print(value)
  
  if(grepl("R", i)) {
    current = current + value
  } else {
    current = current - value
  }
  
  print(current)
  
  if(current < 0) {
    current = 100 + current
  } else if(current > 99) {
    current = current - 100
  }
  
  print(current)
  
  if(current == 0) {
    zeros = zeros + 1
    }
  
}
