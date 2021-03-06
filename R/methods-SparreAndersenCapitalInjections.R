#' @include AllClass.R
#' @include AllGeneric.R
NULL


setValidity(
  Class = "SparreAndersenCapitalInjections",
  method = function(object) {

    # define aliases
    #---------------------------------------------------------------------------

    capital_injection_interarrival_generator <- object@capital_injection_interarrival_generator
    capital_injection_interarrival_parameters <- object@capital_injection_interarrival_parameters
    capital_injection_size_parameters <- object@capital_injection_size_parameters
    capital_injection_size_generator <- object@capital_injection_size_generator

    errors <- character(0)

    # check formal arguments of capital_injection_interarrival_generator and
    # capital_injection_interarrival_parameters
    #---------------------------------------------------------------------------

    if(
      isFALSE(
        all(
          names(capital_injection_interarrival_parameters) %in%
          names(formals(capital_injection_interarrival_generator))
        )
      )
    )
      errors <- c(errors,
                  paste0("capital_injection_interarrival_parameters must have",
                         " the same names as formal argument of",
                         " capital_injection_interarrival_generator"))

    # check formal arguments of capital_injection_size_generator and
    # capital_injection_size_parameters
    #---------------------------------------------------------------------------

    if(
      isFALSE(
        all(
          names(capital_injection_size_parameters) %in%
          names(formals(capital_injection_size_generator))
        )
      )
    )
      errors <- c(errors,
                  paste0("capital_injection_size_parameters must have the same",
                         " names as formal argument of",
                         " capital_injection_size_generator"))

    # return TRUE if slots are valid, otherwise errors messeges
    #---------------------------------------------------------------------------

    if(length(errors) == 0) {
      TRUE
    } else {
      errors
    }

  }

)


#' Constructs an object of SparreAndersenCapitalInjections S4 class
#'
#' \code{SparreAndersenCapitalInjections()} constructs an object of
#' \code{SparreAndersenCapitalInjections} S4 class.
#'
#' The function constructs an object of a formal S4 class
#' \code{SparreAndersenCapitalInjections}, a representation of an extension of
#' Sparre Andersen model that allows for positive jumps and defined as follows:
#' \deqn{X_(t) = u + ct + \sum_{k=1}^{N^{(+)}(t)} Y^{(+)}_k -
#' \sum_{i=1}^{N^{(-)}(t)} Y^{(-)}_i}
#' where \eqn{u} is the initial capital (\code{initial_capital}), \eqn{c} is the
#' premium rate (\code{premium_rate}), \eqn{N^{(+)}(t)} is the renewal process
#' of positive jumps (capital injections) defined by distribution of
#' interarrival times (\code{capital_injection_interarrival_generator} and
#' \code{capital_injection_interarrival_parameters}), \eqn{Y^{(+)}_k} are iid
#' capital injections' sizes (\code{capital_injection_size_generator}
#' and \code{capital_injection_size_parameters}), \eqn{N^{(-)}(t)} is the
#' renewal process of claims defined by distribution of interarrival times
#' (\code{claim_interarrival_generator} and
#' \code{claim_interarrival_parameters}), \eqn{Y^{(-)}_i} are iid claim sizes
#' (\code{claim_size_generator} and \code{claim_size_parameters}).
#'
#' @param initial_capital a length one numeric non-negative vector specifying an
#' initial capital. Default: \code{0}.
#' @param premium_rate a length one numeric non-negative vector specifying a
#' premium rate. Default: \code{1}.
#' @param claim_interarrival_generator a function indicating the random
#' generator of claims' interarrival times. Default: \code{rexp}.
#' @param claim_interarrival_parameters a named list containing parameters for
#' the random generator of claims' interarrival times. Default:
#' \code{list(rate = 1)}.
#' @param claim_size_generator a function indicating the random generator of
#' claims' sizes. Default: \code{rexp}.
#' @param claim_size_parameters a named list containing parameters for the
#' random generator of claims' sizes. Default: \code{list(rate = 1)}.
#' @param capital_injection_interarrival_generator a function indicating
#' the random generator of capital injections' interarrival times. Default:
#' \code{rexp}.
#' @param capital_injection_interarrival_parameters a named list containing
#' parameters for the random generator of capital injections' interarrival
#' times. Default: \code{list(rate = 1)}.
#' @param capital_injection_size_generator a function indicating the random
#' generator of capital injections' sizes. Default: \code{rexp}.
#' @param capital_injection_size_parameters a named list containing parameters
#' for the random generator of capital injections' sizes. Default:
#' \code{list(rate = 1)}.
#'
#' @return An object of \linkS4class{SparreAndersenCapitalInjections} class.
#'
#' @seealso \code{\link{CramerLundberg}},
#' \code{\link{CramerLundbergCapitalInjections}},
#' \code{link{SparreAndersen}}.
#'
#' @references
#' Breuera L., Badescu A. L. \emph{A generalised Gerber Shiu measure for
#' Markov-additive risk processes with phase-type claims and capital
#' injections}. Scandinavian Actuarial Journal, 2014(2): 93-115, 2014.
#'
#' @examples
#' model <- SparreAndersenCapitalInjections(
#'   initial_capital = 10,
#'   premium_rate = 1,
#'   claim_interarrival_generator = rexp,
#'   claim_interarrival_parameters = list(rate = 1),
#'   claim_size_generator = rexp,
#'   claim_size_parameters = list(rate = 1),
#'   capital_injection_interarrival_generator = rexp,
#'   capital_injection_interarrival_parameters = list(rate = 1),
#'   capital_injection_size_generator = rexp,
#'   capital_injection_size_parameters = list(rate = 1)
#' )
#'
#' @export
SparreAndersenCapitalInjections <- function(
  initial_capital = NULL,
  premium_rate = NULL,
  claim_interarrival_generator = NULL,
  claim_interarrival_parameters = NULL,
  claim_size_generator = NULL,
  claim_size_parameters = NULL,
  capital_injection_interarrival_generator = NULL,
  capital_injection_interarrival_parameters = NULL,
  capital_injection_size_generator = NULL,
  capital_injection_size_parameters = NULL
) {

  # set default arguments
  #-----------------------------------------------------------------------------

  if(is.null(initial_capital))
    initial_capital <- 0

  if(is.null(premium_rate))
    premium_rate <- 1

  if(is.null(claim_interarrival_generator))
    claim_interarrival_generator <- stats::rexp

  if(is.null(claim_interarrival_parameters))
    claim_interarrival_parameters <- list(rate = 1)

  if(is.null(claim_size_generator))
    claim_size_generator <- stats::rexp

  if(is.null(claim_size_parameters))
    claim_size_parameters <- list(rate = 1)

  if(is.null(capital_injection_interarrival_generator))
    capital_injection_interarrival_generator <- stats::rexp

  if(is.null(capital_injection_interarrival_parameters))
    capital_injection_interarrival_parameters <- list(rate = 1)

  if(is.null(capital_injection_size_generator))
    capital_injection_size_generator <- stats::rexp

  if(is.null(capital_injection_size_parameters))
    capital_injection_size_parameters <- list(rate = 1)

  # generate an object and return it
  #-----------------------------------------------------------------------------

  model <- methods::new(
    Class = "SparreAndersenCapitalInjections",
    initial_capital = initial_capital,
    premium_rate = premium_rate,
    claim_interarrival_generator = claim_interarrival_generator,
    claim_interarrival_parameters = claim_interarrival_parameters,
    claim_size_generator = claim_size_generator,
    claim_size_parameters = claim_size_parameters,
    capital_injection_interarrival_generator = capital_injection_interarrival_generator,
    capital_injection_interarrival_parameters = capital_injection_interarrival_parameters,
    capital_injection_size_generator = capital_injection_size_generator,
    capital_injection_size_parameters = capital_injection_size_parameters
  )

  return(model)

}


#' Simulates a path of a Sparre Andersen model's extension with capital
#' injections
#'
#' \code{simulate_path()} simulates a path of
#' \linkS4class{SparreAndersenCapitalInjections} model until one of the
#' following conditions is met: (1) the process is ruined, (2)
#' \code{max_time_horizon} is achieved, (3) the elapsed time of the simulation
#' is greater than \code{max_simulation_time}.
#'
#' @param model an S4 object of \linkS4class{SparreAndersenCapitalInjections}
#' class.
#' @param max_time_horizon a length one numeric vector specifying the maximum
#' time horizon, until with the process will be simulated. Default: \code{Inf}.
#' @param max_simulation_time a length one numeric vector indicating the maximum
#' allowed time of simulation. The value should be specified in seconds.
#' Default: \code{Inf}.
#' @param seed an optional arbitrary length numeric vector specifying the seed.
#' If provided, the \code{.Random.seed} in \code{.GlobalEnv} is set to its
#' value.
#'
#' @return \linkS4class{PathSparreAndersenCapitalInjections}
#'
#' @section Warning:
#' Setting both \code{max_time_horizon} and \code{max_simulation_time} to
#' \code{Inf} might be dangerous. In this case, the only stopping condition is a
#' ruin of the process, which might not happen.
#'
#' @examples
#' model <- SparreAndersenCapitalInjections(
#'   initial_capital = 10,
#'   premium_rate = 1,
#'   claim_interarrival_generator = rexp,
#'   claim_interarrival_parameters = list(rate = 1),
#'   claim_size_generator = rexp,
#'   claim_size_parameters = list(rate = 1),
#'   capital_injection_interarrival_generator = rexp,
#'   capital_injection_interarrival_parameters = list(rate = 1),
#'   capital_injection_size_generator = rexp,
#'   capital_injection_size_parameters = list(rate = 2)
#' )
#'
#' path <- simulate_path(model = model, max_time_horizon = 10)
setMethod(
  f = "simulate_path",
  signature = c(model = "SparreAndersenCapitalInjections"),
  definition = function(model,
                        max_time_horizon = NULL,
                        max_simulation_time = NULL,
                        seed = NULL) {

    # set default arguments
    #---------------------------------------------------------------------------

    if(is.null(max_time_horizon))
      max_time_horizon <- Inf

    if(is.null(max_simulation_time))
      max_simulation_time <- Inf

    if(is.null(seed)) {
      seed <- .Random.seed
    } else {
      # .Random.seed <<- seed
      assign(x = ".Random.seed", value = seed, envir = .GlobalEnv)
    }

    # validate arguments
    #---------------------------------------------------------------------------

    stopifnot(

      is.numeric(max_time_horizon) &&
        length(max_time_horizon) == 1 &&
        isFALSE(is.na(max_time_horizon)) &&
        max_time_horizon > 0,

      is.numeric(max_simulation_time) &&
        length(max_simulation_time) == 1 &&
        isFALSE(is.na(max_simulation_time)) &&
        max_simulation_time > 0,

      is.numeric(seed)

    )

    if(is.infinite(max_time_horizon) && is.infinite(max_simulation_time))
      warning(paste0("Setting both max_time_horizon and max_simulation_time",
                     "to Inf might result in an infinite loop."))

    # define aliases
    #---------------------------------------------------------------------------

    u <- model@initial_capital
    pr <- model@premium_rate


    f_pa <- model@capital_injection_interarrival_generator
    param_pa <- model@capital_injection_interarrival_parameters
    f_ps <- model@capital_injection_size_generator
    param_ps <- model@capital_injection_size_parameters

    f_na <- model@claim_interarrival_generator
    param_na <- model@claim_interarrival_parameters
    f_ns <- model@claim_size_generator
    param_ns <- model@claim_size_parameters

    # simulate process
    #-----------------------------------------------------------------------

    # add n = 1 to all distributions parameters in order to generate only
    # one r.v.
    param_pa[["n"]] <- 1
    param_ps[["n"]] <- 1
    param_na[["n"]] <- 1
    param_ns[["n"]] <- 1

    # initialize process
    path <- matrix(NA, nrow = 1, ncol = 2)
    colnames(path) <- c("time", "X")
    path[1, ] <- c(0, u)

    # auxiliary function for adding jumps to a path
    add_jump_to_path <- function(path, arrival, size) {

      path <- rbind(
        path,
        c(arrival,
          path[nrow(path), 2] + (arrival - path[nrow(path), 1]) * pr)
      )

      path <- rbind(
        path,
        c(arrival,
          path[nrow(path), 2] + size)
      )
      path
    }

    s_pos <- numeric() # positive jumps' sizes
    s_neg <- numeric() # positive jumps' sizes

    a_pos <- numeric() # arrival times of positive jumps
    a_neg <- numeric() # arrival times of negative jumps

    ca_pos <- do.call(what = f_pa, args = param_pa) # current arrival time of a
                                                     # positive jump
    ca_neg <- do.call(what = f_na, args = param_na) # current arrival time of a
                                                     # negative jump

    is_ruined <- FALSE

    start_time <- Sys.time() # set a timer

    repeat{

      if(as.numeric(difftime(time1 = Sys.time(),
                             time2 = start_time,
                             units = "secs")) < max_simulation_time) {

        if(ca_pos < max_time_horizon || ca_neg < max_time_horizon) {

          if(ca_pos > ca_neg) {

            # current negative jump's size
            cs_neg <- do.call(what = f_ns, args = param_ns)

            path <- add_jump_to_path(path, ca_neg, -cs_neg)

            s_neg <- c(s_neg, cs_neg)
            a_neg <- c(a_neg, ca_neg)

            if(path[nrow(path), 2] < 0) {
              is_ruined <- TRUE
              break
            }

            ca_neg <- ca_neg + do.call(what = f_na, args = param_na)


          } else if(ca_pos == ca_neg) {

            # current positive jump's size
            cs_pos <- do.call(what = f_ps, args = param_ps)
            # current negative jump's size
            cs_neg <- do.call(what = f_ns, args = param_ns)

            path <- add_jump_to_path(path, ca_pos, cs_pos - cs_neg)

            s_pos <- c(s_pos, cs_pos)
            s_neg <- c(s_neg, cs_neg)

            a_pos <- c(a_pos, ca_pos)
            a_neg <- c(a_neg, ca_neg)

            if(path[nrow(path), 2] < 0) {
              is_ruined <- TRUE
              break
            }

            ca_pos <- ca_pos + do.call(what = f_pa, args = param_pa)
            ca_neg <- ca_neg + do.call(what = f_na, args = param_na)

          } else if(ca_pos < ca_neg) {

            # current positive jump's size
            cs_pos <- do.call(what = f_ps, args = param_ps)

            path <- add_jump_to_path(path, ca_pos, cs_pos)

            s_pos <- c(s_pos, cs_pos)
            a_pos <- c(a_pos, ca_pos)

            ca_pos <- ca_pos + do.call(what = f_pa, args = param_pa)

          }

        } else {

          # add max_time_horizon to a path
          path <- rbind(
            path,
            c(max_time_horizon,
              path[nrow(path), 2] + (max_time_horizon - path[nrow(path), 1]) * pr)
          )

          break

        }

      } else {

        break

      }

    }

    end_time <- Sys.time()

    elapsed_time <- as.numeric(difftime(time1 = end_time,
                                        time2 = start_time,
                                        units = "secs"))

    # generate a returning object
    process <- methods::new(
      Class = "PathSparreAndersenCapitalInjections",
      model = model,
      path = path,
      claim_sizes = s_neg,
      claim_arrival_times = a_neg,
      capital_injection_sizes = s_pos,
      capital_injection_arrival_times = a_pos,
      time_horizon = path[nrow(path), 1],
      is_ruined = is_ruined,
      elapsed_time = elapsed_time,
      max_time_horizon = max_time_horizon,
      max_simulation_time = max_simulation_time,
      seed = seed
    )

    return(process)

  }
)
