# Copyright Seth Wenchel 2015

.pkgenv <- new.env(parent=emptyenv())

.onAttach <- function(libname, pkgname){
  assign("objects_on_stack", 0,.pkgenv)
}



.push <- function(.data){
  count <- get("objects_on_stack",envir = .pkgenv)+1
  assign(paste0("stack_obj_",count),.data, envir = .pkgenv)
  assign("objects_on_stack", (count),.pkgenv)
}

.pop <- function(){
  count <- get("objects_on_stack",envir = .pkgenv)
  if(count <1) stop("No more scions on stack. Perhaps you meant to specify the \"data2\" argument to graft()?")
  assign("objects_on_stack", (count-1),.pkgenv)
  .data <- get(paste0("stack_obj_",count), envir = .pkgenv)
  return(.data)
}
