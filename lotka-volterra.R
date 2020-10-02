library(phaseR)
library(deSolve)
library(tidyverse)
options(repr.plot.width=6, repr.plot.height=4)

predator_prey <- function(t, y, parameters) {
  # calculates dx/dt and dy/dt for a predator-prey model
  
  # t: time at which to evaluate derivatives
  # y: vector of system variables (c(X, Y))
  # parameters: vector of model parameters (c(a, b, c, d))
  
  # the arguments need to be named "t", "y", and "parameters", otherwise this won't work with phaseR, a package we will use later
  
  #now the state vector y has two elements because we have two species
  X <- y[1] # prey
  Y <- y[2] # predators
  
  a <- parameters['a']
  b <- parameters['b']
  c <- parameters['c']
  d <- parameters['d']
  
  # calculate rate of change
  dx <- a * X - b * Y * X
  dy <- c * X * Y - d * Y
  
  # return rate of change
  return(list(c(dx, dy)))
}


parameters <- c(a = 0.1, b = 0.02, c = 0.01, d = 0.3)
state <- c(X = 40, Y = 9)
times <- seq(0, 200, by = 0.05) # the timestep dt is chosen by setting the increment with 'by'

#?ode # look at the documentation to learn about the parameters
result <- as.data.frame(ode(y = state, times = times, func = predator_prey, parms = parameters))
head(result)

# note that we saved the output of the plot as a variable p for use later
(p = ggplot(result, aes(time, X, color = "prey")) + geom_line() + 
    geom_line(aes(time, Y, color = "predator")) + theme_minimal())

library(gganimate)
p + ylab("number of individuals") + transition_reveal(time)

ggplot(result, aes(X, Y)) + geom_path()

# plot vector field: on a grid of points, plot an arrow in the direction of dx/dt and dy/dt
pp_flowField <- flowField(predator_prey, xlim = c(0, 2), ylim = c(0, 2),
                          parameters = parameters, # same parameters as before,
                          points = 15, # this is the density of grid points on which to plot arrows
                          system = 'two.dim', # 'two.dim' is default
                          add = FALSE)

# add trajectories
pp_trajectory <- trajectory(predator_prey, 
                            # y0 is a matrix where each row is pairs of (X, Y) 
                            y0 = state, 
                            tlim = c(0,20), # how far in time to calculate the trajectories
                            parameters = parameters, system = "two.dim")

# compute isocline for this paramer set
predator <- parameters[['a']]/parameters[['b']]
prey <- parameters[['c']]/parameters[['d']]

pp_trajectory <- trajectory(predator_prey, 
                            # y0 is a matrix where each row is pairs of (X, Y) 
                            y0 = c(prey, predator), 
                            tlim = c(0,20), # how far in time to calculate the trajectories
                            parameters = parameters, system = "two.dim", col = "red")

y0 = matrix(c(1,2, 8, 3), ncol = 2, byrow = TRUE)
y0

# plot vector field: on a grid of points, plot an arrow in the direction of dx/dt and dy/dt

pp_flowField <- flowField(predator_prey, xlim = c(0, 100), ylim = c(0, 30),
                          parameters = parameters, # same parameters as before,
                          points = 15, # this is the density of grid points on which to plot arrows
                          system = 'two.dim', # 'two.dim' is default
                          add = FALSE)

# add trajectories
pp_trajectory <- trajectory(predator_prey, 
                            y0 = y0, 
                            tlim = c(0,50), # how far in time to calculate the trajectories
                            parameters = parameters, system = "two.dim", col = c("red", "black"))

