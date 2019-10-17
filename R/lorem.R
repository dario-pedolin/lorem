#' @title Print lorem ipsum to screen
#'
#' @description \code{lorem} prints 'x' chapters of lorem ipsum dummy text to the screen.
#'
#' @param x integer Number of chapters to print
#'   'x' has to be an integer >= 0 (default = 1)
#'
#' @export
#'
#' @examples lorem(1)
lorem <- function(x = 1) {

  if (!is.numeric(x) || (x %% 1) != 0 || x < 0) {
    stop(paste0("'x' must be an integer >= 0\n('x' is ", x))
  }

  f <- file(system.file("", "lorem.txt", package = "lorem"))
  txt <- paste0(readLines(f), "\n")
  close(f)


  lines <- if (is.null(x)) {
    length(txt)
  } else {
    lines <- c(rep(1:length(txt), as.integer(x / 7)), 0:(x %% length(txt)))
  }

  cat(txt[lines])

}
