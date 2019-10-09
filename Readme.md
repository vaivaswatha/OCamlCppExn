# OCaml C++ FFI Exceptions

  * Setup OCaml using the instructions [here](https://github.com/realworldocaml/book/wiki/Installation-Instructions).
  * Build by just typing `$make`
  * Run the executable as `bin/oce_runner.exe`
  * On macOS, this results in an uncaught exception, but not on GNU/Linux.
    - This is now fixed after passing `-fkeep_dwarf_unwind` to the linker.
