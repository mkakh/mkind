open Str
open Stdio

let replace template contents =
  let re = regexp "%TEMPLATE" in
  global_replace re contents template

let make_html template_file_name contents_file_name =
  let template = In_channel.read_all template_file_name in
  let contents_with_newline = In_channel.read_all contents_file_name in
  let contents_length = String.length contents_with_newline in
  let contents = String.sub contents_with_newline 0 (contents_length - 1) in
  replace template contents

let usage = "Usage: mkind template_file_name contents_file_name"

let () =
  let str = if Array.length Sys.argv == 3 then make_html Sys.argv.(1) Sys.argv.(2) else usage in
  print_endline str

