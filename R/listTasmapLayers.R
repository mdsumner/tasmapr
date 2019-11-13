#' List Tasmanian maps layers
#'
#' @return names vector
#' @export
#' @examples
#' listTasmapLayers()
listTasmapLayers <- function(){
  return(tasmap_layers$Name)
}
