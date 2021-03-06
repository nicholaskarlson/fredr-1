#' Get the related categories for a FRED category.
#'
#' @param category_id An integer ID for the category.  Default is `0` for the
#' root category. _Required parameter._
#'
#' @param realtime_start A `Date` indicating the start of the real-time period.
#' Defaults to today's date. For more information, see
#' [Real-Time Periods](https://fred.stlouisfed.org/docs/api/fred/realtime_period.html).
#'
#' @param realtime_end A `Date` indicating the end of the real-time period.
#' Defaults to today's date. For more information, see
#' [Real-Time Periods](https://fred.stlouisfed.org/docs/api/fred/realtime_period.html).
#'
#' @param ... These dots only exist for future extensions and should be empty.
#'
#' @return A `tibble` object containing the name and parent ID for categories
#' related to the category indicated by `category_id`.
#'
#' @details From the [FRED API documentation](https://fred.stlouisfed.org/docs/api/fred/category_related.html):
#' "A related category is a one-way relation between 2 categories that is not
#' part of a parent-child category hierarchy. Most categories do not have related
#' categories."
#'
#' @section API Documentation:
#'
#' [fred/category/related](https://fred.stlouisfed.org/docs/api/fred/category_related.html)
#'
#' @seealso [fredr_category()], [fredr_category_children()],
#' [fredr_category_series()], [fredr_category_tags()], [fredr_category_related_tags()]
#'
#' @examples
#' if (fredr_has_key()) {
#' # Categories related to the "Employment Cost Index" category
#' fredr_category_related(category_id = 4L)
#' }
#' @export
fredr_category_related <- function(category_id,
                                   ...,
                                   realtime_start = NULL,
                                   realtime_end = NULL) {
  check_dots_empty(...)
  check_not_null(category_id, "category_id")

  user_args <- capture_args(
    category_id = category_id,
    realtime_start = realtime_start,
    realtime_end = realtime_end
  )

  fredr_args <- list(
    endpoint = "category/related"
  )

  do.call(fredr_request, c(fredr_args, user_args))
}
