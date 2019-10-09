module C = Configurator.V1

let () =
  C.main ~name:"foo" (fun _ ->
    let lflags = 
      if Sys.os_type = "Unix"
      then
        let ic = Unix.open_process_in "uname" in
        let uname = input_line ic in
        let () = close_in ic in
        (* macOS requires -keep_dwarf_unwind for exceptions to work. *)
        if uname = "Darwin" then ["-cclib";"-Wl,-keep_dwarf_unwind"] else []
      else
        []
    in
    C.Flags.write_sexp "library_flags.sexp" lflags
  )
